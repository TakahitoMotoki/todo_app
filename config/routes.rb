Rails.application.routes.draw do
  authenticated :user do
    root to: 'users#index', as: :user_root
  end

  root to: 'welcome#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registerations: 'users/registerations',
    passwords: 'users/passwords'
  }

  post "/tasks/create/:id" => "tasks#create"
  patch "/tasks/complete/:task_id" => "tasks#complete"
  delete "/tasks/delete/:task_id" => "tasks#delete"
end
