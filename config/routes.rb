Rails.application.routes.draw do
  devise_for :users

	 resources :answers
  resources :questions
   resources :surveys do
   collection do
     post :result  
   end
end
  
  root to: "surveys#index"
	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
