ProLitConference::Application.routes.draw do
  
  match 'pages/home' => 'high_voltage/pages#show', :id => 'home'
  root :to => 'high_voltage/pages#show', :id => 'home'

end
