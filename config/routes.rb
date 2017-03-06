Rails.application.routes.draw do

  root 'main#home'

  get 'home' => 'main#home'

  get 'about' => 'main#about'

  get 'contact' => 'main#contact'

  get 'blog' => 'main#blog'

  get 'portfolio' => 'main#portfolio'

  get 'videos' => 'main#videos'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin/posts' => 'posts#index'
    resources :posts
end
