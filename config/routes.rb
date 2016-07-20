Payga::Engine.routes.draw do
  root to: 'main#show'
  resource :main, only: [:show]
end
