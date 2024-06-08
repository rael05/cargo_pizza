class WelcomeController < ApplicationController
  def index
    @breadCrumb = t(:home)
    @pending_orders = Order.where("status = 'P' OR status = 'R'").limit(5)
    @recent_orders = Order.order(:created_at).limit(5)
  end
end
