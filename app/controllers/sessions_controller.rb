require 'digest/sha2'

class SessionsController < ApplicationController
  def new
  end

  def create
    # find the User by the provided email and store it in the local variable
    user = User.find_by_email(params[:email])

    # checks the hash stored in the databse with the hash of the supplied password and stored salt
    if user.password_hash == Digest::SHA256.hexdigest(params[:password] + user.password_salt)
      session[:user_id] = user.id
      
      if session[:return_to]
        redirect_to session[:return_to]
        session[:return_to] = nil
      else
        redirect_to posts_path
      end
    else
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
    redirect_to posts_path
  end

end
