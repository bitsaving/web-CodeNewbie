CodeNewbie::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :sessions
  root 'pages#index'
  devise_scope :user do 
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  # chat
  get    '/blog' => 'chat#index', as: 'chats'
  get    '/blog/new' => 'chat#new', as: 'new_chat'
  post   '/blog' => 'chat#create'
  get    '/blog/:slug' => 'chat#show', as: 'chat'
  get    '/blog/:slug/edit' => 'chat#edit', as: 'edit_chat'
  patch    '/blog/:slug' => 'chat#update'
  delete    '/blog/:slug' => 'chat#destroy', as: 'delete_chat'


  # blog
  # get    '/stories' => 'blog#index', as: 'blogs'
  # get    '/stories/new' => 'blog#new', as: 'new_blog'
  # get    '/stories/tags/:tag' => 'blog#index', as: 'blog_tag'
  # get    '/stories/:slug' => 'blog#show', as: 'blog'
  # get    '/stories/:slug/edit' => 'blog#edit', as: 'edit_blog'
  # patch  '/stories/:slug' => 'blog#update'
  # post   '/stories' => 'blog#create'

  # login
  get   '/login'  => 'sessions#new'
  get   '/logout' => 'sessions#destroy'
  
  # resources
  get   '/learn'           => 'resources#index', as: 'resources'
  get   '/learn/new'       => 'resources#new',   as: 'new_resource'
  post  '/learn'           => 'resources#create'
  get   '/learn/edit'      => 'resources#edit',  as: 'edit_resources'
  get   '/learn/:id'       => 'resources#show',  as: 'resource'
  patch '/learn/:id'       => 'resources#update'
  get   '/learn/tags/:tag' => 'resources#index', as: 'tag'

  # careers
  get   '/careers'             => 'jobs#index', as: 'jobs'
  get   '/careers/new'         => 'jobs#new',   as: 'new_job'
  post  '/careers'             => 'jobs#create'
  get   '/careers/edit'        => 'jobs#edit',  as: 'edit_jobs'
  get   '/careers/:id'         => 'jobs#show',  as: 'job'
  patch '/careers/:id'         => 'jobs#update'
  get   '/careers/tags/:tag'   => 'jobs#index', as: 'job_tag'

  # code
  get   '/challenges/:slug'    => 'challenges#show', as: 'challenge'

  # signing in stuff
  get   '/beta'  => 'pages#beta', as: 'beta'

  # admin panel
  get   '/admin' => 'sessions#admin_new'
  post  '/admin' => 'sessions#create_admin'

end