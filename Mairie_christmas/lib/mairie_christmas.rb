require 'nokogiri' 
require 'open-uri'

def names_collect
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    cities_names = page.xpath("//a[contains(@class, 'lientxt')]")
    a = []

    cities_names.each do |href|
        a << href.text
    end
    return a
end

def url_collect
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    cities_url = page.xpath("//a[contains(@class, 'lientxt')]")
    city_array = []

    cities_url.each do |href|
    cities_website = href.values[1].delete_prefix(".")
    city_array << cities_website
    end
    return city_array
end

def email_collect(url)
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com" + url))
    email_list = page.xpath('//td[text()="Adresse Email"]//following-sibling::td')
    l = []
    email_list.each do |href|
        l << href.text
    end
    return l
end

def all
    new = url_collect
    new_new = []

    for url in new do 
        new_new << email_collect(url)
    end
    return new_new
end

def final(names_collect, all)
    result = Hash[names_collect.zip (all)]
    return result
end

puts final(names_collect, all)






