class ArticleController < ApplicationController
  def show
    base = BaseWorker.new
    response = base.hit_mbw_api({ url: "/api/v1/mbw/article/" + params[:id] })
    if response.present?
      @ua = request.env["HTTP_USER_AGENT"]
      case response.code.to_i
      when 200
        @article = JSON.parse(response.body)
      when 301
        redirect_to '/article/' + JSON.parse(response.body)["key"], status: 301
      when 404
        render template: 'errors/error_404', status: 404, layout: 'error' and return
      else
        render template: 'errors/error_500', status: 500, layout: 'error' and return
      end
    else
      render template: 'errors/error_404', status: 404, layout: 'error' and return
    end
  end
end
