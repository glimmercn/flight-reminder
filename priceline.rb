require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'net/smtp'

message = <<EOF
From: SENDER <huangkandiy@gmail.com>
To: RECEIVER <huangkandiy@gmail.com>
Subject: purchase tickets now!
FYI
EOF

while true do
	# step 1: get the price.
	# url is the page which contains the price information of the ticket you need.
	url = "http://www.priceline.com/airlines/fareResults.do?session_key=364A050A344B050A20141123153346199100173749&plf=pcln&jarmkey=3D4A050A3F4A050AObRu84msqUmE2kuYJZpnEC3505&INIT_SESSION=true"
	doc = Nokogiri::HTML(open(url))
	 puts doc.css("title").text
	t1 = doc.css(".choose_price").first
	price = t1.css(".dollar").text[/[0-9\.]+/]
	puts price

	#step 2: if it reach the upper bound set before send an email.
	my_price = 800


	if my_price > price.to_i
		#Using Block
		smtp = Net::SMTP.new('smtp.gmail.com', 587 )
		smtp.enable_starttls
		smtp.start('gmail.com', 'huangkandiy@gmail.com', 'PASSWORD', :login) do |smtp|
			smtp.send_message message, 'huangkandiy@gmail.com', 'huangkandiy@gmail.com'
		end
		break
	end
	# next query is in k seconds
	k = rand(50..500)
	sleep(k)
end


