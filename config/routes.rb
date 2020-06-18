Rails.application.routes.draw do

  

  get '/users/new' => 'users#new'
  post '/users/' => 'users#create'
  get '/users/edit' => 'users#edit'
  get '/users/show'  => 'users#show'
  delete '/user/destroy' => 'users#destroy'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  resources :jounal_entries
 get '/' => 'jounal_entries#index'
  
  #resources :jounal_entries で以下のルートが生成されている
  # GET  /jounal_entries(.:format)	=> jounal_entries#index
  # POST /jounal_entries(.:format)	=> jounal_entries#create
  #	GET  /jounal_entries/new(.:format)	=> jounal_entries#new
  #	GET  /jounal_entries/:id/edit(.:format) => jounal_entries#edit
  #	GET  /jounal_entries/:id(.:format)	=> jounal_entries#show
  # PATCH /jounal_entries/:id(.:format) => jounal_entries#update
  # PUT  /jounal_entries/:id(.:format)	=> jounal_entries#update
  # DELETE /jounal_entries/:id(.:format)	=> jounal_entries#destroy
  # GET / => jounal_entries#index
  
  resources :payments
  resources :incomes
  resources :budgets

  #resources :spreadsheets
  get '/spreadsheets' => 'spreadsheets#index'
  post '/spreadsheets' => 'spreadsheets#index'

  get '/appsettings' => 'appsettings#index'
  
  get '/appsettings/pay_type_index' => 'appsettings#pay_type_index'
  get '/appsettings/pay_type_index/new' => 'appsettings#pay_type_new'
  post '/appsettings/pay_type_index' => 'appsettings#pay_type_create'
  delete '/appsettings/pay_type_index/:id' => 'appsettings#pay_type_destroy'
end
