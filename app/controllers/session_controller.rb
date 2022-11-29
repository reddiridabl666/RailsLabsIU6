class SessionController < ApplicationController
  def login; end

  def authorize
    user = User.find_by_username(params[:username])
    return redirect_to_login if user.nil?
    return redirect_to_login unless user.authenticate params[:password]
    redirect_to input_path
  end

  private

  def redirect_to_login
    redirect_to root_path, flash: {alert: "Wrong login or password"}
  end
end
