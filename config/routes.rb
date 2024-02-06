Rails.application.routes.draw do
  root 'home#index'
  resources :places
  
  # for searching the place & showing the result in a separate page
  get 'home/search_results', to: 'home#index', as: :search_results

  # to get the places with state name
  get '/places_in_state/:state', to: 'places#places_in_state', as: 'places_in_state'
end
