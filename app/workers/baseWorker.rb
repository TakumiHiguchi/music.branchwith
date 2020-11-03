class BaseWorker
  def get_key
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    return (0...20).map { o[rand(o.length)] }.join
  end
  
  def hit_mbw_api(props)
    query = ""
    case Rails.env
      when 'test' then
        uri = URI.parse("http://localhost:3020" + props[:url])
        uri.query = URI.encode_www_form(props[:params]) if props[:params]
        http = http_setting(uri)
        begin
          http.start do
            query = '?' + uri.query if uri.query
            return http.get(uri.path + query)
          end
        end
      when 'development' then
        uri = URI.parse("http://mbw-api:3020" + props[:url])
        uri.query = URI.encode_www_form(props[:params]) if props[:params]
        http = http_setting(uri)
        begin
          http.start do
            query = '?' + uri.query if uri.query
            return http.get(uri.path + query)
          end
        end
      when 'production' then
        uri = URI.parse("https://mbwapi.herokuapp.com" + props[:url])
        uri.query = URI.encode_www_form(props[:params]) if props[:params]
        https = https_setting(uri)
        https.start do
          query = '?' + uri.query if uri.query
          return https.get(uri.path + query)
        end
    end
  end

  def https_setting(uri)
    https = Net::HTTP.new(uri.host, uri.port)
    https.open_timeout = 10
    https.read_timeout = 10
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    https.verify_depth = 5
    return https
  end
  def http_setting(uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = 10
    http.read_timeout = 10
    return http
  end
end
