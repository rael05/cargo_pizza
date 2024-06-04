class WelcomeController < ApplicationController
  def index
    @breadCrumb = t(:home)
  end
end
