class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by({ "username" => params["username"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "#{@user["username"]} is now logged in, see username in top right"
        redirect_to "/places"
      else
        flash["notice"] = "Sorry, invalid username or password."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Sorry, invalid username or password."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
  