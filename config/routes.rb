Rails.application.routes.draw do
  root to: 'pizzas#index'

  get '/pizzas' => 'pizzas#index'
  get '/pizzas/:id' => 'pizzas#show', as: :pizza
  post '/pizzas/:id/remove/:ingredient' => 'pizzas#remove_ingredient', as: :remove_ingredient
end
