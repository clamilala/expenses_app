Rails.application.routes.draw do

  get ':id/destroy' => 'home#destroy'
  #homeコントローラーのtopアクションに飛ばす
  get 'home/top' => 'home#top'
  get '/' => 'home#top'
  post 'create' => 'home#create'
end
