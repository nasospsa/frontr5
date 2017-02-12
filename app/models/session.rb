class Session < ApplicationResource
  self.collection_name = "auth"

  attr_accessor :email, :password

  def sign_in
  	post(:sign_in)
  end

  def new?
  	false
  end
end