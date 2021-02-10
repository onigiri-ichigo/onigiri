class HomeController < ApplicationController
  def top
    @user=User.find_by(id:session[:user_id])
  end

  def about
  end
end
