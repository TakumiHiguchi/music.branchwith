class BaseWorker
  def get_key
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    return (0...20).map { o[rand(o.length)] }.join
  end
  
  def hit_mbw_api(props)
    require 'openssl'
    require 'net/https'

    uri = URI.parse("https://mbwapi.herokuapp.com/")
    https = Net::HTTP.new(uri.host, uri.port)
    https.open_timeout = 10
    https.read_timeout = 10
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_PEER
    https.verify_depth = 5
    begin
      response = nil
      https.start do
        response = https.get(props[:url])
      end
      return response
    end
  end
end
