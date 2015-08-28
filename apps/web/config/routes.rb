post '/talks', to: 'talks#create'
get '/talks/new', to: 'talks#new'
get '/talks', to: 'talks#index'
get '/', to: 'home#index'
# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
