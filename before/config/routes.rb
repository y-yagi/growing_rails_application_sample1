Rails.application.routes.draw do
  resources :accounts do
    get :merge_form, on: :collection
    post :do_merge, on: :collection
  end

  root 'accounts#index'
end
