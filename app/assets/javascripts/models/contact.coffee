Contacts.ContactViewModel = class @ContactViewModel
  constructor: (data)->
    ko.mapping.fromJS(data, {}, this)


