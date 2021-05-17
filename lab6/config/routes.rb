Rails.application.routes.draw do
  root 'lab_reports#index', as: 'home'

  get 'about' => 'pages#about'

  resources :lab_reports do 
    resources :marks
  end
end


