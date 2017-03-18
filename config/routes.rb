Rails.application.routes.draw do

  devise_for :admins

  root 'main#home'

  get 'home' => 'main#home'

  get 'about' => 'main#about'

  get 'contact' => 'main#contact'

  get 'blog' => 'main#blog'

  get 'portfolio' => 'main#portfolio'

  get 'vlog' => 'main#videos'

  get 'blogpost/:id' => 'main#blogpost'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/admin' do
    resources :posts, :videos, :categories
  end
end
