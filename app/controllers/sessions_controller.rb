class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def sign_up
  end

  def sign_in
    @session = Session.new
  end

  def create_user
    render :sign_up
  end

  def create_session
    @session = Session.new session_params.to_h

    response = @session.sign_in.response
    if response.kind_of? Net::HTTPSuccess
      redirect_to :posts
    else
      render :sign_in
    end
  end

  def logout
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
