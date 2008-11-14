class SessionsController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by_email_and_password(params[:email], hashed_password(params[:password]))

    if @current_user
      session[:user_id] = @current_user.id
      redirect_to posts_path
    else
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
  end

end
