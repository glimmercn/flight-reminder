require 'rubygems'
require 'nokogiri'
require 'open-uri'

# step 1: get the price.
# url is the page which contains the price information of the ticket you need.
url = "http://www.kayak.com/flights/PVG-SFO/2015-05-24/SLC-PVG/2015-06-10"
doc = Nokogiri::HTML(open(url))
puts doc.css("title").text
doc.css(".mainInfoDiv").each do |item|
  price = item.css(".bookitprice").text[/\$[0-9\.]+/]
  puts "#{price}"

#step 2: compare the price.
  

#step 3: if it reach the upper bound set before send an email.
end
