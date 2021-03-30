Rails.application.routes.draw do
  get '/:hashid', to: 'links#show', as: :hashid
  resources :links
end
