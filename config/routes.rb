ProLitConference::Application.routes.draw do
  devise_for :users
  resources  :users, :only => [:new, :create]

  match 'pages/home' => 'high_voltage/pages#show', :id => 'home'
  root :to => 'high_voltage/pages#show', :id => 'home'
end
