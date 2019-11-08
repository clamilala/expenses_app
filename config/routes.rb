Rails.application.routes.draw do

  resources :payments
  get '/' => 'payments#index'
  
  #get 'list/top' => 'list#top'

  #get ':id/destroy' => 'payment#destroy'
  #homeコントローラーのtopアクションに飛ばす
  #get 'payment/top' => 'payment#top'
  #get '/' => 'payment#top'
  #post 'create' => 'payment#create'
end
