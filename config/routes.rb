ProLitConference::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users
  resources  :users, :only => [:new, :create]
  resources  :pages, :only => :show

  root :to => "pages#show", :id => -1
end
