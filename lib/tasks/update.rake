require "net/http"
require 'open-uri'
require "nokogiri"
require "uri"
require "net/http"

namespace :update do
  desc "TODO"
  task :logs => :environment do

    Groupitem.all.each do |gi|
      uri = URI(gi.url)
      res = Net::HTTP.get_response(uri)
      doc = Nokogiri::HTML(res.body)
      doc.css('.totalReviewCount').each do |link| 
        puts a = link.content
        gi.log.update(reply: a)
      end
      doc.css('span#acrCustomerReviewText').each do |link| 
        puts a = link.content
        a = a.split(a)[0]
        if gi.log
         gi.log.update(reply: a)
        else
          gi.log.create(reply: a)
          puts a
        end
      end
    end
  end

end
