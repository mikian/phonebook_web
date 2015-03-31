Contacts.ContactsViewModel = class @ContactsViewModel
  contacts: ko.observableArray()

  constructor: ->
    @init()

  init: ->
    @refresh(true);

  refresh: (initial)=>
    @timer = setTimeout @refresh, 10 * 1000  # 10 seconds
    @fetch() unless initial

  fetch: =>
    console.log "Fetching orders..."
    mapping = {
      orders:
        create: (options)->
          return new Contacts.ContactsViewModel(options.data)
    }

    jQuery.getJSON 'http://0.0.0.0:3000/contacts'
      .then (data) =>
        ko.mapping.fromJS(data, mapping, 0)

jQuery ->
  Contacts.contactsViewModel = contactsViewModel = new Contacts.ContactsViewModel
  ko.applyBindings(contactsViewModel)
  contactsViewModel.fetch()
