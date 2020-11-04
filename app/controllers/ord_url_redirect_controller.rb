class OrdUrlRedirectController < ApplicationController
  # 旧式サイトから301リダイレクトするためのコントローラー
  # あとで消す
  def article
    base = BaseWorker.new
    response = base.hit_mbw_api({ url: "/api/v1/mbw/our_article", params: { key: params[:id] } })
    case response.code.to_i
    when 301
      redirect_to '/article/' + JSON.parse(response.body)["key"], status: 301
    when 404
      render status: 404
    else
      render status: 500
    end
  end

  def feature

  end
end