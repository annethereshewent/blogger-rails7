Rails.application.routes.draw do
  use_doorkeeper do 
    skip_controllers :application, :comments, :posts, :users
  end
  
  devise_for :users, controllers: {
    confirmations: 'users/confirmations'
  }



  get '/users/checkLogin'
  get '/users' => 'users#login'
  post '/users/validate'
  post '/users/checkLogin' => "users#checkLogin"
  get '/users/logout'
  post '/posts/:post_id/delete/' => "posts#delete", as: "delete_post"
  get '/posts/:post_id/fetch' => "posts#fetch", as: "fetch_post"
  patch '/users/:id/update' => "users#update", as: "update_user"
  get '/users/account' => 'users#account', as: 'user_account'
  root 'users#login'
  post '/users/verify'  => 'users#verify'
  post '/comments/:comment_id/reply' => 'comments#reply', as: 'comments_reply'
  get '/users/:id/tags/:tag' => 'posts#tags', as: 'user_tags'
  get '/users/:user_id/posts/:page' => 'posts#index', as: 'user_posts_page'
  post '/users/:user_id/friend' => 'users#add_friend', as: 'add_friend'
  get '/users/dashboard' => 'users#dashboard', as: 'user_dashboard'
  get '/users/checkRequests' => 'users#check_requests'
  get '/users/getRequests/:num' => 'users#get_requests'
  post '/users/:id/confirmFriend/:user_id' => 'users#confirm_friend'
  post '/posts/upload_images' => 'posts#upload_images', as: 'image_upload'
  get '/posts/:page/fetch_posts'  => 'users#fetch_posts',  as: 'fetch_posts'
  post '/users/:user_id/switch_theme' => 'users#switch_theme', as: 'switch_theme'
  get '/users/tags/:tag' => 'users#tags', as: 'dashboard_tags'
  get '/users/:user_id/isFriends' => 'users#isFriends'
  get '/users/get_user_id' => 'users#get_user_id'
  post '/posts/upload_image' => 'posts#upload_image', as: 'upload_image'
  get '/users/search/:search' => 'users#search', as: 'search'
  get '/users/:user_id/archive' => 'users#archive', as: 'user_archive'
  get '/users/:user_id/fetchArchivePosts' => 'users#fetch_archive_posts', as: 'archive_posts'
  post '/api/login' => 'api#login'
  post '/api/create_post' => 'api#create_post'
  get '/api/fetch_posts' => 'api#fetch_posts'
  get '/api/fetch_posts/:page' => 'api#fetch_posts'
  post '/api/register' => 'api_registration#register'
  get '/users/fetch_sidebar_posts' => 'users#fetch_sidebar_posts'
  post '/users/save_sidebar_settings' => 'users#save_sidebar_settings'
  get '/users/:user_id/posts/:page/fetch_sidebar_posts' => 'posts#fetch_sidebar_posts'
  get '/api/fetch_friends' => 'api#fetch_friends'
  get '/api/fetch_comments/:post_id' => 'api#fetch_comments'
  post '/api/post_comment' => 'api#post_comment'
  post '/api/find_user' => 'api#find_user'
  post '/api/find_email' => 'api#find_email'
  post "/api/delete_post/:post_id" => 'api#delete_post'
  post '/api/edit_post/:post_id' => 'api#edit_post' 
  post '/api/upload_image/' => 'api#upload_image'
  get '/api/tag_search/:tag_name' => 'api#tag_search'
  post '/api/verify' => 'api#verify'
  post '/api/update_user' => 'api#update_user'
  post '/api/switch_theme' => 'api#switch_theme'
  get '/api/fetch_blog_posts/:username' => 'api#fetch_blog_posts'
  get '/api/fetch_blog_posts/:username/:page' => 'api#fetch_blog_posts'
  get '/api/is_friends/:friend' => 'api#is_friends'
  get '/api/search/:search_term' => 'api#search'
  get '/api/fetch_user' => 'api#fetch_user'
  get '/api/archive/:username' => 'api#archive'
  post '/api/fetch_archive_posts/:username' => 'api#fetch_archive_posts'
  post '/api/save_sidebar_settings' => 'api#save_sidebar_settings'

  resources :users do
    resources :posts do
      resources :comments
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
