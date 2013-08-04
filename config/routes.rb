Shop::Application.routes.draw do
  root to: "stores#index"
  resources :stores


  resources :categories

  resources :products do
    resources :pictures
  end

end
