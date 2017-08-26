Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :items do
    resources :purchases, only: [:create]
  end

  get "/team", to: "pages#team"
  get "/contact", to: "pages#contact"
  get "/company", to: "pages#company"
    get "/about", to: "shared#about2"

  mount Attachinary::Engine => "/attachinary"

  get "/my_items", to: "items#my_items"

  get "/payment", to: "purchases#payment"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
