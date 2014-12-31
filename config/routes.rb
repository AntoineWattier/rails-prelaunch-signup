RailsPrelaunchSignup::Application.routes.draw do

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end

  devise_scope :user do
    root 'devise/registrations#new'
    put '/user/confirmation', to:'confirmations#update', as: :update_user_confirmation
  end

  devise_for :users, :controllers => { :registrations => "registrations", :confirmations => "confirmations" }

  get 'users/bulk_invite/:quantity', to: 'users#bulk_invite', as: :bulk_invite

  resources :users do
    get 'invite', on: :member
  end

end
