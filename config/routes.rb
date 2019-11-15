Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  resources :payments
  get '/' => 'payments#index'
  
  #resources :payments で以下のルートが生成されている
  # GET  /payments(.:format)	=> payments#index
  # POST /payments(.:format)	=> payments#create
  #	GET  /payments/new(.:format)	=> payments#new
  #	GET  /payments/:id/edit(.:format) => payments#edit
  #	GET  /payments/:id(.:format)	=> payments#show
  # PATCH /payments/:id(.:format) => payments#update
  # PUT  /payments/:id(.:format)	=> payments#update
  # DELETE /payments/:id(.:format)	=> payments#destroy
  # GET / => payments#index
  
  get '/appsettings' => 'appsettings#index'
  
  get '/appsettings/pay_type_index' => 'appsettings#pay_type_index'
  get '/appsettings/pay_type_index/new' => 'appsettings#pay_type_new'
  post '/appsettings/pay_type_index' => 'appsettings#pay_type_create'
  delete '/appsettings/pay_type_index/:id' => 'appsettings#pay_type_destroy'
end
