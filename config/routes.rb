Rails.application.routes.draw do
  root "products#index"
  resources :products

  # only the create action of the checkout resource will have a route generated, 
  # and other CRUD actions (like index, show, update, 
  # destroy) won't have routes automatically generated.
  resources :checkout, only: [:create]
  post "checkout/create", to: "checkout#create"
end
