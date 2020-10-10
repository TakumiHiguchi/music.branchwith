class SearchController < ApplicationController
  def index
    base = BaseWorker.new
    response = base.hit_mbw_api({ url: "/api/v1/mbw/search", params: search_params })
    if response.present?
      @ua = request.env["HTTP_USER_AGENT"]
      @result = JSON.parse(response.body)
    else
      render status: 404
    end
  end

  def search_params
    params[:model] ||= 'article'
    query = { limit: 20, model: params[:model] }
    query[:q] = params[:query] if params[:query].present?
    query[:page] = params[:page] if params[:page].present?
    return query
  end
end
