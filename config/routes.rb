Rails.application.routes.draw do
  get "projects", to: "project#index"

  get "todos", to: "project#index"
  post "todos", to: "project#create"

  get "/projects/:id/todo/:id", to: "project#index"
  patch "/projects/:projectId/todo/:todoId", to: "project#update"
end
