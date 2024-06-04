Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'welcome#index'
    devise_for :employees, controllers: {
      sessions: 'employees/sessions'
    }
    resources :products
    resources :pizza_parts
  end
end
