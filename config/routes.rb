Rails.application.routes.draw do
  resources :events do
    resources :tickets , only:[:new, :create, :destroy]
  end
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
