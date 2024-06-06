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
    get '/orders/size_info/:size_id' => 'orders#size_info', as: 'size_info'
    get '/orders/product_info/:product_id' => 'orders#product_info', as: 'product_info'
    get '/orders/customer_info/:customer_id' => 'orders#customer_info', as: 'customer_info'
    get '/orders/search_customers' => 'orders#search_customers', as: 'search_customers'
    get '/orders/new' => 'orders#new', as: 'new_order'
    get '/orders' => 'orders#index'
  end
end
