Payga::Engine.routes.draw do

  get 'callback/index'

  root to: 'main#show'
  resource :main, only: [:show]
  resource :return, only: [:ok, :fail] do
    member do
      get :ok
      get :fail
    end
  end
  resources :callback, only: :index
end
