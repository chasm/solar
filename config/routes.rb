Solar::Application.routes.draw do
  resources :articles

  # User login/logout
  get    'login'  => 'session#new',     as: :login             # Login form
  post   'login'  => 'session#create'                          # Log user in (start session)
  delete 'logout' => 'session#destroy', as: :logout            # Log user out (end session)

  # Password reset (coded links)
  get   'reset/:code' => 'password#edit',  as: :reset          # Password reset form
  patch 'reset/:code' => 'password#update'                     # Reset users password

  # Dashboard
  root 'site#index'
end
