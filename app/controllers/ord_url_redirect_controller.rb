class OrdUrlRedirectController < ApplicationController
  # 旧式サイトから301リダイレクトするためのコントローラー
  # あとで消す
  def article
    base = BaseWorker.new
    response = base.hit_mbw_api({ url: "/api/v1/mbw/our_article", params: { key: params[:id] } })
    case response.code.to_i
    when 301
      if JSON.parse(response.body)["type"] == "article"
        redirect_to '/article/' + JSON.parse(response.body)["key"], status: 301
      else
        redirect_to '/lyrics/' + JSON.parse(response.body)["key"], status: 301
      end
    when 404
      render status: 404
    else
      render status: 500
    end
  end

  def lyrics

  end
end