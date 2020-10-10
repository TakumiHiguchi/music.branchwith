class LyricsController < ApplicationController
  def show
    base = BaseWorker.new
    response_lyrics = base.hit_mbw_api({ url: "/api/v1/webgui/lyrics/" + params[:id] })
    response_lyrics_list = base.hit_mbw_api({ url: "/api/v1/webgui/search", params: { limit: 20, model: 'lyric' } })
    if response.present?
      @ua = request.env["HTTP_USER_AGENT"]
      @lyric = JSON.parse(response_lyrics.body)
      @poplyric = JSON.parse(response_lyrics_list.body)
    else
      render status: 404
    end
  end
end
