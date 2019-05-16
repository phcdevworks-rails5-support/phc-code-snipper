Phccodesnipper::Engine.routes.draw do

  # Script Snippet Routes
  namespace :script do
    resources :snippets, class_name: 'Phccodesnipper::Script::Snippet' do
      resources :urls, class_name: 'Phccodesnipper::Script::Url'
    end
  end

  # PHCAccounts Routes
  mount Phcaccounts::Engine, :at => '/'

end
