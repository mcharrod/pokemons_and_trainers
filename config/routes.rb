Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/trainers', to: 'trainers#index'
  get '/trainers/new', to: 'trainers#new'
  post '/trainers', to: 'trainers#create'
  get '/trainers/:id', to: 'trainers#show'

  get '/pokemons', to: 'pokemons#index'
  get '/pokemons/:id', to: 'pokemons#show'

  get '/trainers/:trainer_id/pokemons', to: 'trainer_pokemons#index'
end
