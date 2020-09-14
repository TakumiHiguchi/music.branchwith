class ArticleController < ApplicationController
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
    
        begin
          response = nil
          https.start do
            response = https.get("/api/v1/webgui/article/" + params[:id])
          end
          @article=JSON.parse(response.body)
          

          p @article
        end
    end
end
