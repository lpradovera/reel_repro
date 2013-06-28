require 'net/http/pipeline'

host = 'localhost'
port = 5005

start = Time.now
Net::HTTP.start host, port do |http|
  http.pipelining = true

  reqs = []
  reqs << Net::HTTP::Get.new('/status')
  reqs << Net::HTTP::Get.new('/status')
  reqs << Net::HTTP::Get.new('/status')

  http.pipeline reqs do |res|
    puts res.code
    puts res.body[0..60].inspect
  end

  p Time.now - start
end