class ArticleController < ApplicationController
  def show
    base = BaseWorker.new
    response = base.hit_mbw_api({ url: "/api/v1/mbw/article/" + params[:id] })
    if response.present?
      @ua = request.env["HTTP_USER_AGENT"]
      @article = JSON.parse(response.body)
    else
      render status: 404
    end
  end
end
