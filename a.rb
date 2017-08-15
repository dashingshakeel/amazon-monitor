require "nokogiri"
require "uri"
require "net/http"
uri = URI('https://www.amazon.com/gp/video/detail/B01IG0E1F0/ref=atv_hm_hom_1_c_pmpop_brws_2_2?ie=UTF8&pf_rd_i=home&pf_rd_m=ATVPDKIKX0DER&pf_rd_p=2977211762&pf_rd_r=EMYC3NQ8H0W0ZHYS6R55&pf_rd_s=center-6&pf_rd_t=12401')

res = Net::HTTP.get_response(uri)
doc = Nokogiri::HTML(res.body)
doc.css('a-row span.a-size-medium').each do |link| 
  puts link.content
end