Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:create]
  end

  get '/' => 'restaurants#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


# Prefix Verb   URI Pattern                     Controller#Action
# restaurants GET    /restaurants(.:format)          restaurants#index    --> if you go to restaurants, a view from index file in restaurants directory will be shown.
#        POST   /restaurants(.:format)          restaurants#create
# new_restaurant GET    /restaurants/new(.:format)      restaurants#new
# edit_restaurant GET    /restaurants/:id/edit(.:format) restaurants#edit
# restaurant GET    /restaurants/:id(.:format)      restaurants#show
#        PATCH  /restaurants/:id(.:format)      restaurants#update
#        PUT    /restaurants/:id(.:format)      restaurants#update
#        DELETE /restaurants/:id(.:format)      restaurants#destroy
# MacBook-Air-Kot:FoodOnRailsBeta2 kotpsot bin/rails server
