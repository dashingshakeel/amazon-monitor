class HttpJob < ApplicationJob
  queue_as :default
  require "net/http"
  require 'open-uri'
  require "nokogiri"

  def perform(url,id)
    doc = Nokogiri::HTML(open(url))
    doc.css('.totalReviewCount #acrCustomerReviewText').each do |link| 
      puts a = link.content
      log = Log.create(groupitem_id: id,reply: a) 
    end
    doc.css('#acrCustomerReviewText').each do |link| 
       a = link.content
       debugger
      a = a.split(a)[0]
      Log.create( groupitem_id: id ,reply: a)
      puts a
    end
  end
end
