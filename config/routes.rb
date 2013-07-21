Shop::Application.routes.draw do
  resources :categories

  resources :products do
    resources :pictures
  end

end
