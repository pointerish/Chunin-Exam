Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => 'links#new'
  get '/:hashid', to: 'links#show', as: :hashid
  resources :links
end
