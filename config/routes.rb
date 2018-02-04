Rails.application.routes.draw do
  root to: 'pizzas#index'

  get '/pizzas' => 'pizzas#index'
  get '/pizzas/:pizza' => 'pizzas#show', as: :pizza
  post '/pizzas/:pizza/remove/:ingredient' => 'pizzas#remove_ingredient', as: :remove_ingredient
  post '/pizzas/:pizza/add' => 'pizzas#add_ingredient', as: :add_ingredient
  get '/pizzas/:pizza/custom_pizza' => 'pizzas#custom_pizza', as: :custom_pizza
end
