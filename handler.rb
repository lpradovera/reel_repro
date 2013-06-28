require 'reel'
require 'json'

class StatsHandler
  def self.handle(request)
    response = {}

    response[:number_of_calls]   = 42
    response[:status]            = 'ok'
    [:ok, "#{response.to_json}"]
  end
end

::Reel::Server.supervise '127.0.0.1', 5005 do |connection|
  while request = connection.request
    case request
    when Reel::Request
      status, body = StatsHandler.handle request
      connection.respond status, body
    end
  end
end

sleep