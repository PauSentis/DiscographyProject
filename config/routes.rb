Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/lp/:id', to: 'lp#show', as: 'lp'
  delete '/deletelp', to: 'lp#delete'
  get '/artist/:id', to: 'artist#show', as: 'artist'
  delete '/deleteartist/:id', to: 'artist#delete'
  get '/newlp', to: 'lp#new'
  get '/editlp', to: 'lp#edit'
  post '/createlp', to: 'lp#create'
  post '/updatelp', to: 'lp#update'
  get '/newartist', to: 'artist#new'
  get '/editartist', to: 'artist#edit'
  post '/createartist', to: 'artist#create'
  post '/updateartist', to: 'artist#update'
end
