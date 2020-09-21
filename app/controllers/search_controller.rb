class SearchController < ApplicationController
  def index
    @ua = request.env["HTTP_USER_AGENT"]

    uri = URI.parse("https://mbwapi.herokuapp.com/")
    https = Net::HTTP.new(uri.host, uri.port)
    https.open_timeout = 10
    https.read_timeout = 10
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    https.verify_depth = 5

    model = params[:model]
    model = 'article' if params[:model].nil?
    begin
      https.start do
        @result = JSON.parse(https.get("/api/v1/mbw/search?model=" + model + '&q=' + params[:query] + '&limit=20').body)
      end
    rescue
      render file: "/public/404.html", layout: false, status: 404
    end
  end
end
