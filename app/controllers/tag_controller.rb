class TagController < ApplicationController
  def index
  end

  def show
    base = BaseWorker.new
    response = base.hit_mbw_api({ url: "/api/v1/mbw/tag/" + params[:id] })
    if response.present?
      @ua = request.env["HTTP_USER_AGENT"]
      @tag = JSON.parse(response.body)["result"]
    else
      render status: 404
    end
  end
end
