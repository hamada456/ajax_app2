Rails.application.routes.draw do
  root to: 'posts#index'
  # root to: 'posts#top' #http://localhost:3000/、でトップに行く
  # get 'index', to: 'posts#index' #http://localhost:3000/index、で部屋に行く

  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'posts#checked'
  # resources :posts, only: :destroy

  resources :posts do
    collection do
      delete 'destroy_all'
    end
  end

end
