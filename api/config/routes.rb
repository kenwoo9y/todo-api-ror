Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :tasks
      resources :users
    end
  end
end
