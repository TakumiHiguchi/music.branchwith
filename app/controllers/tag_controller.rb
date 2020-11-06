class TagController < ApplicationController
  before_action :heroku_normalization
  def index
    @ua = request.env["HTTP_USER_AGENT"]
    @page = {:title => "人気タグ"}
  end

  def show
    base = BaseWorker.new
    response = base.hit_mbw_api({ url: "/api/v1/mbw/tag/" + params[:id] })
    if response.present?
      @ua = request.env["HTTP_USER_AGENT"]
      @tag = JSON.parse(response.body)["result"]
      @page = {:title => @tag[:name]}
    else
      render status: 404
    end
  end
end
