Rails.application.routes.draw do
  root to: 'invoice_files#index'

  resources :invoice_files
end
