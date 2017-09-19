Rails.application.routes.draw do
  get 'welcome/index'
  
  #ATTN: resources should be plural
  #resources :articles  # first version
  resources :articles do  # second version
	resources :comments
  end
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
