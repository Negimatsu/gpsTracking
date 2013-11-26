class HomeController < ApplicationController

  helper :home
  def index
    @users = User.all
  end

end
