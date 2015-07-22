Rails.application.routes.draw do
  root to: 'scholarships#index'
  resources :scholarships do
    resources :donations
  end
end
