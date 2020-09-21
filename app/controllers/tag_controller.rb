class TagController < ApplicationController
  def index
  end

  def show
    @ua = request.env["HTTP_USER_AGENT"]

    require 'openssl'
    require 'net/https'
    uri = URI.parse("https://mbwapi.herokuapp.com/")
    https = Net::HTTP.new(uri.host, uri.port)
    https.open_timeout = 10
    https.read_timeout = 10
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    https.verify_depth = 5
    begin
      response = nil
      https.start do
        response = https.get("/api/v1/mbw/tag/" + params[:id])
      end
      @tag = JSON.parse(response.body)["result"]
    end
  end
end
