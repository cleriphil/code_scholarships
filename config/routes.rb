Rails.application.routes.draw do
  get '/' => 'home#index'
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :users

  resources :scholarships do
    resources :donations
  end

  resources :donations do
    resources :charges
  end
end
