class HomeController < ApplicationController
  def index
    if user_signed_in?
      @users = User.all
      render
    else
      render 'devise/registrations/new'
    end
  end
end
