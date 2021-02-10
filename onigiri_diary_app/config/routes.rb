Rails.application.routes.draw do
  post 'mailer/create'=>'mailer#create'

  post 'likes/:post_id/create'=>'likes#create'
  post 'likes/:post_id/destroy'=>'likes#destroy'
  
  get 'users/index'
  get 'users/own_posts'=>'users#own_posts'
  get 'users/:id/edit'=>'users#edit'
  get 'users/:id/destroy'=>'users#destroy'
  get 'users/:id'=>'users#show'
  get '/signup'=>'users#signup_form'
  get '/login'=>'users#login_form'
  get '/logout'=>'users#logout'
  post '/signup'=>'users#signup'
  post '/login'=>'users#login'
  post '/logout'=>'users#logout'
  post '/users/:id/update'=>'users#update'

  get 'posts/index'
  get 'posts/create'=>'posts#create_form'
  get 'posts/:id/edit'=>'posts#edit'
  get 'posts/:id/destroy'=>'posts#destroy'
  get 'posts/:id'=>'posts#show'
  post 'posts/create'=>"posts#create"
  post 'posts/:id/update'=>'posts#update'

  get '/'=>"home#top"
  get "/about"=>"home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
