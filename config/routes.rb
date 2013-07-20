Shop::Application.routes.draw do
  resources :products do
    resources :pictures
  end

end
