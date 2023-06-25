Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "calendar/view", to: "calendars#view"
  resources :meetings
end
