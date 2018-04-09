Rails.application.routes.draw do
  get 'new', to: 'games#new', as: :new
  get 'reset', to: 'games#reset', as: :reset
  post 'score', to: 'games#score', as: :score

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
