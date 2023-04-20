require_relative '../lib/dark_trader'

describe "the_crypto_scrapper method" do 

    it "gives cryptocurrencies names" do 
    expect(crypto_scrapping).to_not be_empty
    #expect(crypto_scrapping).to have_key("XRP")
    end

end