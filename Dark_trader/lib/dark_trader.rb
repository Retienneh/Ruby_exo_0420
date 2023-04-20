require 'nokogiri' 
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
crypto = []

1.upto(20) do |n|
    crypto_name = page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{n}]/td[2]/div/a[2]").text
    crypto_price = page.xpath("/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{n}]/td[5]/div/a/span").text
    crypto << Hash[crypto_name , crypto_price]
end

puts crypto 