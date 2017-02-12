# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )

module PatchedConnection
  def handle_response(resp)
      puts 'handle_response', resp['access-token'], resp.code
      RequestStore.store[:auth] = {
        access_token: resp['access-token'],
        client: resp['client'],
        uid: resp['uid']
      }

      super resp
    end
end

module ActiveResource
  class Connection
    prepend PatchedConnection
  end
end