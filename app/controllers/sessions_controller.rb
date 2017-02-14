class SessionsController < ApplicationController
  before_action :authenticate!, except: [:logout]
  before_action :set_session, only: [:sign_up, :sign_in]

  def sign_up
    @session = Session.new email:'', password: '', password_confirmation: ''
  end

  def sign_in
    @session = Session.new email:'', password: ''
  end

  def create_session
    if session_params.has_key? :password_confirmation
      @session = Session.new session_params.to_h
      unless @session.save
        return render :sign_up
      end
    else
      @session = SessionSignIn.new session_params.to_h
      begin
        @session.save
      rescue ActiveResource::UnauthorizedAccess => e
        @session.errors.add :base, 'Wrong Credentials. Please try again.'
        return render :sign_in
      end
    end

    puts @session.inspect
    redirect_to :posts
  end

  def logout
    session[:auth] = nil
    redirect_to :sign_in
  end

  private

  def set_session
    @session = Session.new
  end

  def authenticate!
    puts RequestStore.store[:auth].inspect
    if RequestStore.store[:auth] && RequestStore.store[:auth]['access_token']
      redirect_to posts_path
    end
  end

  def session_params
    params.require(:session).permit(:email, :password, :password_confirmation)
  end
end
