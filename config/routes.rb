Rails.application.routes.draw do
  get '/' => 'home#landing'
  get '/home/secret' => 'home#secret'
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :users
  resources :home, only: [:index, :landing, :secret]

  resources :scholarships do
    resources :donations
  end

  resources :donations do
    resources :charges
  end

  resources :scholarships do
    resources :repayments
  end

  resources :repayments do
    resources :charges
  end

end
