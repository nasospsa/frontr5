class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_auth
  after_action :save_to_session

  def store_auth
    RequestStore.store[:auth] = session[:auth]
  end

  def save_to_session
    auth = RequestStore.store[:auth]
    if auth[:access_token]
      puts 'need to save_to_session'
      puts auth
      session[:auth] = RequestStore.store[:auth]
    end
  end
end
