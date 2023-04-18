Rails.application.routes.draw do
get "/products" => "products#index"
get "/products/:id" => "products#show"
post "/products" => "products#create" #admin
patch "/products/:id" => "products#update"
delete "/products/:id" => "products#destroy"

post "/users" => "users#create"

post "/sessions" => "sessions#create"

get "/orders/:id" => "orders#show" #users
get "/orders" => "orders#index" #users
post "/orders" => "orders#create" #users
end