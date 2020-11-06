class ApplicationController < ActionController::Base
  def heroku_normalization
    url = request.domain
    path = request.fullpath
    if url =='herokuapp.com' then
      redirect_to('https://music.branchwith.com'+path.to_s) and return
    end
  end
end
