Phccodesnipper::Engine.routes.draw do

  # Routes - User Accounts
  mount Phcaccounts::Engine, :at => '/'

  # Routes - Engine
  namespace :script do
    resources :snippets, class_name: 'Phccodesnipper::Script::Snippet' do
      resources :urls, class_name: 'Phccodesnipper::Script::Url'
    end
  end

end
