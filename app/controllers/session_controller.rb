class SessionController < ApplicationController
  before_action :is_authenticated?, only: [ :destroy ]

  def new
    redirect_to root_url if current_user
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]

    if password.blank?
      if user = User.where(email: email).take
        PasswordReset.new(user, flash.now).send_password_reset and return
      else
        flash.now[:error] = "Unable to find a user with that email address. Please try again."
      end
    else
      if user = User.authenticate(email, password)
        log_user_in(user) and return
      else
        flash.now[:error] = "Unable to sign you in. Please try again."
      end
    end

    render :new
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "You've logged out."
  end
end
