Rails.application.routes.draw do
  devise_for :users
  root to: "calendars#view"
  get "calendar/view", to: "calendars#view"
  resources :meetings
end
