class ApplicationResource < ActiveResource::Base
  self.site = "http://localhost:3000"
  self.include_root_in_json = true

  def self.headers
    new_headers = RequestStore.store[:auth] || super
    puts new_headers.inspect
    new_headers
  end
end
