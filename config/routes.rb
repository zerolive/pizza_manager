Rails.application.routes.draw do
  root to: 'pizzas#index'

  get '/pizzas' => 'pizzas#index'
  get '/pizzas/:id' => 'pizzas#show', as: :pizza
end
