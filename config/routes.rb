Shop::Application.routes.draw do
  resources :settings


  root to: "stores#index"
  resources :stores


  resources :categories

  resources :products do
    resources :pictures
  end

end
