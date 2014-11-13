class SessionsController < ApplicationController
  def create
    #raise env['omniauth.auth'].to_yaml
    #user = User.from_omniauth(env['omniauth.auth'])
    user = User.find_for_google_oauth2(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end
end
