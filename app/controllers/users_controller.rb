class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_attendee
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Signup Complete. Please Check Your Email"
      redirect_to root_path
    else
      flash[:error] = "Failed to Signup"
      render :action => :new
    end
  end
end
