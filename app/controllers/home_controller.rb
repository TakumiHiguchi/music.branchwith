class HomeController < ApplicationController
  def index
    require 'openssl'
    require 'net/https'
    require 'net/http'
    #prooflyからuser_key=music.branchwithの記事一覧を取得する
    uri = URI.parse("https://mbwapi.herokuapp.com/")
    https = Net::HTTP.new(uri.host, uri.port)
    https.open_timeout = 10
    https.read_timeout = 10
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    https.verify_depth = 5

    begin
      response = nil
      response1 = nil
      https.start do
        response = https.get("/api/v1/mbw/article?limit=20")
      end
      @articleDatas=JSON.parse(response.body)
      https.start do
        response1 = https.get("/api/v1/webgui/search?model=lyric&limit=20")
      end
      @poplyric=JSON.parse(response1.body)
      
    end
  end
end
