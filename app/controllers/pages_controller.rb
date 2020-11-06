class PagesController < ApplicationController
  before_action :heroku_normalization
  layout 'application'
  def privacy
    @ua = request.env["HTTP_USER_AGENT"]
  end

  def contact
    @ua = request.env["HTTP_USER_AGENT"]
  end
end
