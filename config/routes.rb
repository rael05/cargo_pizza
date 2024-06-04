Rails.application.routes.draw do
  resources :customers
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'welcome#index'
    devise_for :employees, controllers: {
      sessions: 'employees/sessions'
    }
    resources :products
    resources :pizza_parts
    get '/pizza_sizes', to: 'pizza_parts#index', as: 'pizza_sizes', category: 'S'
    get '/pizza_flavors', to: 'pizza_parts#index', as: 'pizza_flavors', category: 'F'
    get '/pizza_borders', to: 'pizza_parts#index', as: 'pizza_borders', category: 'B'
  end
end
