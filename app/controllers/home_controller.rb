class HomeController < ApplicationController
  def index
    base = BaseWorker.new
    response_article = base.hit_mbw_api({ url: "/api/v1/mbw/article?limit=20" })
    response_lyrics = base.hit_mbw_api({ url: "/api/v1/webgui/search?model=lyric&limit=20" })
    if response.present?
      @articleDatas = JSON.parse(response_article.body)
      @poplyric = JSON.parse(response_lyrics.body)
    else
      render status: 404
    end
  end
end
