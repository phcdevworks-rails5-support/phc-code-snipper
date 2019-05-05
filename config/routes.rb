Phccodesnipper::Engine.routes.draw do

  # Routes - User Accounts
  mount Phcaccounts::Engine, :at => '/'

  # Routes - Engine
  namespace :script do
    resources :posts do
      resources :urls
    end
  end

end
