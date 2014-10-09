require 'socket'

class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: Rails.application.secrets.http_basic_auth_user, 
    password: Rails.application.secrets.http_basic_auth_password, 
    realm: Socket.gethostname unless Rails.env.test?
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
