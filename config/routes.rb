Rails.application.routes.draw do
  root to: 'pizzas#index'

  get '/pizzas' => 'pizzas#index'
  get '/pizzas/:pizza' => 'pizzas#show', as: :pizza
  post '/pizzas/remove/:pizza/:ingredient' => 'pizzas#remove_ingredient', as: :remove_ingredient
  post '/pizzas/add/:pizza' => 'pizzas#add_ingredient', as: :add_ingredient
end
