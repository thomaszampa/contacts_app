class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all

    search_first_name = params[:search_first]
    if search_first_name
      @contacts = @contacts.where("first_name ILIKE ?", "%#{search_first_name}%")
    end

    search_middle_name = params[:search_middle]
    if search_middle_name
      @contacts = @contacts.where("middle_name ILIKE ?", "%#{search_middle_name}%")
    end

    search_last_name = params[:search_last]
    if search_last_name
      @contacts = @contacts.where("last_name ILIKE ?", "%#{search_last_name}%")
    end

    search_email = params[:search_email]
    if search_email
      @contacts = @contacts.where("email ILIKE ?", "%#{search_email}%")
    end

    search_phone = params[:search_phone_number]
    if search_phone
      @contacts = @contacts.where("phone_number ILIKE?", "%#{search_phone}%")
    end

    render "index.json.jbuilder"
  end

  def create
    @contact = Contact.new(
      first_name: params["first_name"],
      middle_name: params["middle_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone_number: params["phone_number"],
      bio: params["bio"]
      )
    @contact.save
    render "show.json.jbuilder"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params["first_name"] || @contact.first_name
    @contact.middle_name = params["middle_name"] || @contact.middle_name
    @contact.last_name = params["last_name"] || @contact.last_name
    @contact.email = params["email"] || @contact.email
    @contact.phone_number = ["phone_number"] || @contact.phone_number
    @contact.save
    render "show.json.jbuilder"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Contact successfully deleted!"}
  end
end
