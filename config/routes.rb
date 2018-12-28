Rails.application.routes.draw do
  
  resources :users do
    resources :posts
  end

  resources :posts do
  	 resources :marks
      member do
     	post 'rating'
      end
      collection do
      get 'best'
      end
  end

end
