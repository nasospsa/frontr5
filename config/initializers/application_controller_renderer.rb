# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )

module PatchedConnection
  def handle_response(resp)
      puts 'ActiveResource::Connection-> handle_response'
      puts resp['access-token']
      puts resp.code

      begin
        RequestStore.store[:auth] = {
          access_token: resp['access-token'],
          client: resp['client'],
          uid: resp['uid']
        }
      rescue Exception => e
        puts "srry no session"
      end

      super resp
    end
end

module ActiveResource
  class Connection
    prepend PatchedConnection
  end
end