class HomeController < ApplicationController
  def index
    base = BaseWorker.new
    response_article = base.hit_mbw_api({ url: "/api/v1/mbw/article", params: { limit: 20 } })
    response_lyrics = base.hit_mbw_api({ url: "/api/v1/mbw/search", params: { limit: 20, model: 'lyric' } })
    if response.present?
      @ua = request.env["HTTP_USER_AGENT"]
      @articleDatas = JSON.parse(response_article.body)
      @poplyric = JSON.parse(response_lyrics.body)
    else
      render status: 404
    end
  end
end
