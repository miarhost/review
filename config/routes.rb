Rails.application.routes.draw do
  resources :marks
  resources :users do
   resources :posts
  end

end
