require 'open-uri'

def createStore
  Store.destroy_all
  puts "Creating store"
  store = Store.create(name: "Store Name",
                       description: "Test store for the store",
                       owner: "Zach Cotter",
                       email: "zach@zachcotter.com",
                       location: "Boston")
  open('http://consultants.acpet.edu.au/images/logo_placeholder.jpg', 'rb') {
      |photo_file| store.logo = photo_file
  }
  open('http://lorempixel.com/1800/600/nature/5', 'rb') {
      |photo_file| store.cover = photo_file
  }
  store.save
  puts "Created store"
end

categories = ['animals', 'city', 'nature', 'food', 'technics', 'transport']
unless ENV["KEEP_OLD_RECORDS"]
  Product.destroy_all
  Picture.destroy_all
  Category.destroy_all
  Store.destroy_all
  createStore()
  categories.each do |cat|
    Category.create(name: cat)
  end
end


numProducts = Integer(ENV["SEED_NUMBER"])

createStore()
puts "seeding #{numProducts} products"
for i in 1..numProducts do
  puts "creating product #{i}/#{numProducts}"
  name = Forgery(:lorem_ipsum).words(rand(6) + 1, {:random => true}).split(" ").map { |word| word.capitalize }.join(" ")
  description = Forgery(:lorem_ipsum).words(rand(200) + 1)
  a = 10**(rand(7))
  b = 10**(rand(7))
  price = Forgery(:monetary).money :min => [a, b].min, :max => [a, b].max
  quantity = rand(500) + 1
  cat = categories[rand(categories.length)]
  product = Product.create(name: name,
                           description: description,
                           price: price,
                           quantity: quantity)
  theCat = Category.find_by_name(cat)
  theCat.products.push(product)
  theCat.save
  x = rand(500) + 300
  y = rand(500) + 300
  numPics = rand(20) + 1
  puts "creating #{numPics} pics for this product"
  for j in 0..numPics do
    picture = product.pictures.create()
    open("http://lorempixel.com/800/500/#{cat}/", 'rb') {
        |photo_file| picture.photo = photo_file
    }
    picture.save
  end
end


