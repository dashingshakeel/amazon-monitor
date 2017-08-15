class HttpJob < ApplicationJob
  queue_as :default
   require "net/http"
   require "uri"

  def perform(url,id)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    body = response.body
    puts body
    Log.create!(groupitem_id: id,reply: body)
  end
end
