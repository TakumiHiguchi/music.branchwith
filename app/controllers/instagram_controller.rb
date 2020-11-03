class InstagramController < ApplicationController
  def index
    @ua = request.env["HTTP_USER_AGENT"]
  end
  def show

  end
end
