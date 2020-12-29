Rails.application.routes.draw do
  root to: 'posts#top' #http://localhost:3000/、でトップに行く
  get 'index', to: 'posts#index' #http://localhost:3000/index、で部屋に行く
  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'posts#checked'
end
