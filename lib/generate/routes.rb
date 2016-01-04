MatrackApp.router.draw do
  root "todolists#index"
  get "user", to: "sessions#index"
  post "user/create", to: "sessions#create"
  post "user/login", to: "sessions#login"
  get "/todolist", to: "todolists#show"
  get "/todolist/new", to: "todolists#new"
  post "/todolist", to: "todolists#create"
  put "/todolist", to: "todolists#update"
  delete "/todolist", to: "todolists#destroy"
end
