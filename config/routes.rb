Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#home'
  get "/about", to: 'home#about'
  get '/stock', to: 'stocks#index'
  post '/load-stock', to: 'stocks#load_stock'
  get '/alerts', to: 'stocks#alerts'
  resources :stock_symbols, only: %i[index new edit create update]
end
