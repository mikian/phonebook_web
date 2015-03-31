Contacts.ContactsViewModel = class @ContactsViewModel
  contacts: ko.observableArray()

  fetch: =>
    console.log "Fetching orders..."
    jQuery.getJSON 'http://0.0.0.0:3000/contacts'
      .then (data) =>
        @contacts.removeAll()
        data.forEach (el)=>
          @contacts.push(el)

jQuery ->
  Contacts.contactsViewModel = contactsViewModel = new Contacts.ContactsViewModel
  ko.applyBindings(contactsViewModel)
  contactsViewModel.fetch()
