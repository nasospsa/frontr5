Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('posts')

  %w(sign_up sign_in).each do |action|
  	get action, controller: 'sessions', action: action
  end

  %w(create_user create_session).each do |action|
  	post action, controller: 'sessions', action: action
  end

  delete 'logout' => 'sessions#logout', as: 'logout'

  resources :posts
  resources :categories
  resources :pages
end
