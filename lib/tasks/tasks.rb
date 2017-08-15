 require "net/http"
  require 'open-uri'
  require "nokogiri"

namespace :tasks do
  desc "Rake task to get data data"
  task :fetch => :environment do
   
  
Groupitems.all.each do |gi|
      doc = Nokogiri::HTML(open(gi.url))
      doc.css('.totalReviewCount').each do |link| 
        puts a = link.content
        gi.log.update(reply: a)
      end
    end
   
  end
end