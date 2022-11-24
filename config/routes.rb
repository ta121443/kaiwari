Rails.application.routes.draw do
  get 'histories/index'
  get 'histories/new'
  get 'histories/create'
  get 'histories/edit'
  get 'histories/pudate'
  get 'histories/destroy'
  get 'histories/show'
  root 'static_pages#home'

  scope '/:session_id' do
    # static_pages系
    get '/top', to: 'static_pages#top'

    # groups
    resources :groups, only: [:index, :new, :create, :destory]
    # users
    resources :users, only: [:index, :new, :create, :destory]
    # histories
    resources :histories

    get 'calculations/select', to: 'calculations#select'
    get 'calculations/total', to: 'calculations#total'
  
  end
end
