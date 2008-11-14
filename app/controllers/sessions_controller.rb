require 'digest/sha2'

class SessionsController < ApplicationController
  def new
  end

  def create
    # @current_user = User.find_by_email_and_password_hash(params[:email], params[:password])
    user = User.find_by_email(params[:email])

    if user.password_hash == Digest::SHA256.hexdigest(params[:password] + user.password_salt)
      session[:user_id] = user.id
      redirect_to posts_path
    else
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
  end

end
