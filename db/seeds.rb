require 'Forgery'
require 'open-uri'

Product.destroy_all
numProducts = rand(300) + 200
for i in 1..numProducts do
  name = Forgery(:lorem_ipsum).words(rand(6) + 1, {:random => true}).split(" ").map {|word| word.capitalize}.join(" ")
  description = Forgery(:lorem_ipsum).words(rand(200) + 1)
  a = 10**(rand(7))
  b = 10**(rand(7))
  price = Forgery(:monetary).money :min => [a,b].min, :max => [a,b].max
  quantity = rand(500) + 1
  product = Product.create(name: name,
                           description: description,
                           price: price,
                           quantity: quantity)
  x = rand(500) + 300
  y = rand(500) + 300
  numPics = rand(20) + 1


  for j in 0..numPics do
    picture = product.pictures.create()
    open("http://lorempixel.com/800/500/technics/", 'rb') {
        |photo_file| picture.photo = photo_file
    }
    picture.save
  end

end
