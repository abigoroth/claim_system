Rails.application.routes.draw do
  resources :file_uploads
  resources :documents
  devise_for :staffs
  resources :expense_entries
  resources :user_monthly_approvals do
  member do
	get :add_expense
	get :update_status
	get :update_accept
	get :update_reject
  end
  end
  resources :admins
  resources :staffs
  resources :companies
  resources :claims
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/claims') 
  #get 'claims/index'
end
 