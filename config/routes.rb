Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/first_contact_url" => "contacts#first_contact_method"
    get "/second_contact_url" => "contacts#second_contact_method"
    get "/third_contact_url" => "contacts#third_contact_method"
    get "/all_contacts_url" => "contacts#all_contacts_method"
  end
end
