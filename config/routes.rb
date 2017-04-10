Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins

  root 'main#home'

  get 'home' => 'main#home'
  get 'index', to: redirect('/home')

  get 'about' => 'main#about'

  get 'contact' => 'main#contact'

  get 'blog' => 'main#blog'
  get 'posts', to: redirect('/blog')

  get 'portfolio' => 'main#portfolio'

  get 'vlog' => 'main#videos'
  get 'videos', to: redirect('/vlog')

  get 'blogpost/:id' => 'main#blogpost'
  get 'blog/:id', to: redirect('/blogpost/%{id}')

  get 'admin', to: redirect('/admin/posts')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/admin' do
    resources :posts, :videos do
      member do
        post 'deploy'
      end
    end
    resources :categories
  end
end
