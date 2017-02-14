class Session < ApplicationResource
  self.collection_name = "auth"
  self.include_root_in_json = false

  def sign_in
    post :sign_in
  end

  def load_attributes_from_response(response)
  end
end
