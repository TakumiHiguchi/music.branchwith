class LyricsController < ApplicationController
  def index
    require 'openssl'
    require 'net/https'

    #prooflyからuser_key=music.branchwithの記事一覧を取得する
    uri = URI.parse("https://mbwapi.herokuapp.com/")
    https = Net::HTTP.new(uri.host, uri.port)
    https.open_timeout = 10
    https.read_timeout = 10
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    https.verify_depth = 5
    response = nil
    https.start do
      response = https.get("/api/v1/webgui/search?model=lyric&limit=20")
    end
    @lyricsData=JSON.parse(response.body)
  end

  def show
    require 'openssl'
    require 'net/https'
    @ua = request.env["HTTP_USER_AGENT"]
    #prooflyからuser_key=music.branchwithの記事一覧を取得する
    uri = URI.parse("https://mbwapi.herokuapp.com/")
    https = Net::HTTP.new(uri.host, uri.port)
    https.open_timeout = 10
    https.read_timeout = 10
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    https.verify_depth = 5
    response = nil
    response1 = nil
    https.start do
      response = https.get("/api/v1/webgui/lyrics/"+params[:id])
    end
    https.start do
      response1 = https.get("/api/v1/webgui/search?model=lyric&limit=20")
    end
    @poplyric=JSON.parse(response1.body)
    @lyric=JSON.parse(response.body)
  end
end
