require 'rubygems'
require 'nokogiri'
require 'open-uri'

# step 1: get the price.
# url is the page which contains the price information of the ticket you need.
url = "http://www.priceline.com/airlines/fareResults.do?session_key=364A050A344B050A20141123153346199100173749&plf=pcln&jarmkey=3D4A050A3F4A050AObRu84msqUmE2kuYJZpnEC3505&INIT_SESSION=true"
doc = Nokogiri::HTML(open(url))
 puts doc.css("title").text
t1 = doc.css(".choose_price").first
price = t1.css(".dollar").text[/[0-9\.]+/]
puts price

my_price = 900

#step 2: if it reach the upper bound set before send an email.
puts my_price < price.to_i

