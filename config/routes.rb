Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'

  get 'feedback' => 'home#feedback'

 

  resources :home, only: [:index, :new, :create]
  resources :rating_scores
  resources :personnel_ratings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
