class InstagramController < ApplicationController
  before_action :heroku_normalization
  def index
    @ua = request.env["HTTP_USER_AGENT"]
  end
  def show

  end
end
