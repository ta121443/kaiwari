Rails.application.routes.draw do
  root 'static_pages#home'

  scope '/:session_id' do
    # static_pages系
    get '/top', to: 'static_pages#top'
  end
end
