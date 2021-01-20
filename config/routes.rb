Rails.application.routes.draw do
  get "status" => "status#index", defaults:{format:"json"}
  resources :events do
    resources :tickets , only:[:new, :create, :destroy]
  end
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  resources :deletes , only:[:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
