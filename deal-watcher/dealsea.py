import urllib2
import time
import smtplib, random

SECOND_PER_MINUTE = 60


def send_mail(subject):
# The below code never changes, though obviously those variables need values.
  GMAIL_USERNAME = "do.not.hack.me.322@gmail.com" 
  GMAIL_PASSWORD = "2ghlmcl1hblsqt"
  RECIPIENT = "huangkandiy@gmail.com" 
  session = smtplib.SMTP('smtp.gmail.com', 587)
  session.ehlo()
  session.starttls()
  session.login(GMAIL_USERNAME, GMAIL_PASSWORD)
  
  headers = "\r\n".join(["from: " + "Do hackme",
                         "subject: " + subject,
                         "to: " + "me",
                         "mime-version: 1.0",
                         "content-type: text/html"])

  # body_of_email can be plaintext or html!                    
  content = headers + "\r\n\r\n" 
  session.sendmail(GMAIL_USERNAME, RECIPIENT, content)

#read product names;
pfile = open('products.txt', 'r')
products = [line.strip() for line in pfile]

#read deal websites;
webFile = open('websites.txt', 'r')
webs = [line.strip() for line in webFile]

need = [True] * len(products)
count = 1

while True in need:
  for address in webs:
    page = urllib2.urlopen(address).read()
    print('check ' + str(count) ) 
    count = count + 1

    for i in range(len(products)):
      product = products[i]
      if need[i]:
        if product in page:
          title = address + ' has ' + product
          print(product + " is found on " + address + ", going send an email")
          send_mail(title)
          need[i] = False
          break

  LB = 1
  UB = 3
  minute = random.randint(LB, UB)
  time.sleep(SECOND_PER_MINUTE * minute)
