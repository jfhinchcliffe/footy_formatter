# require 'httparty'

class Cat < ActiveRecord::Base
  
  def picture
    # Was hitting the giphy API... might resurrect at some stage
    # response = HTTParty.get(random_picture)
    # json = JSON.parse(response.body)
    # json["data"][0]["images"]["fixed_height"]["url"]
    random_picture
  end
  
  private
  
  def random_picture
    [
      "http://i.imgur.com/PSAV8.gif",
      "http://media0.giphy.com/media/26tPf302sLnlgmQCc/giphy.gif",
      "http://media4.giphy.com/media/f2Y2yrwrUcr9C/giphy.gif",
      "http://i.imgur.com/TBNu0iI.gif",
      "https://media0.giphy.com/media/3osxYaZU8dek0F9LVK/giphy.gif",
      "http://i.imgur.com/dEqJLlp.jpg",
      "http://images.hellokids.com/_uploads/_tiny_galerie/20100207/glitter-paddy-dog-source_gx7.gif",
      "http://heaven.internetarchaeology.org/ANIMALS/a1038.gif"
    ].shuffle.first
  end
  
end