Rails.application.routes.draw do
  root to: 'pizzas#index'

  get '/pizzas' => 'pizzas#index'
end
