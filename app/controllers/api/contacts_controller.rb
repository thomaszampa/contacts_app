class Api::ContactsController < ApplicationController
  def first_contact_method
    @first_contact = Contact.all
    render "first_contacts.json.jbuilder"
  end

  def second_contact_method
    @second_contact = Contact.all
    render "second_contact.json.jbuilder"
  end

  def third_contact_method
    @third_contact = Contact.all
    render "third_contact.json.jbuilder"
  end
end
