Shop::Application.routes.draw do
  resources :stores


  resources :categories

  resources :products do
    resources :pictures
  end

end
