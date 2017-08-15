require "uri"
require "net/http"
uri = URI('https://www.google.com.pk/search?q=whwnever+gem&oq=whwnever+gem&aqs=chrome..69i57j0l5.5930j0j7&sourceid=chrome&ie=UTF-8')

res = Net::HTTP.get_response(uri)
puts res.body