Teacher::Application.routes.draw do
  root :to => 'news#all'
  match ':controller(/:action(/:id))(.:format)'
end
