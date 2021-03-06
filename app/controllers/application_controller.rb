class ApplicationController < ActionController::Base
  # before_action :authorize, only: [:create, :edit, :update, :destroy, :new]
  protect_from_forgery with: :exception

  # include SessionsHelper
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
