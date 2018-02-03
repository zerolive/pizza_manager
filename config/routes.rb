Rails.application.routes.draw do
  get '/pizzas' => 'pizzas#index'
end
