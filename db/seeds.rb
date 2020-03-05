require "open-uri"

puts "deleting old data"
Material.destroy_all
Product.destroy_all
User.destroy_all
puts "creating new users"
producer = User.create(email: "eva@gmail.com", password: "123456", producer: true)
consumer = User.create(email: "christian@gmail.com", password: "123456", producer: false)
default = User.create(email: "default@gmail.com", password: "123456", producer: true)
puts "creating new materials"
materials = [{category: "plastic" , descriptions: [{name: "PET", recyclability: true }, {name: "HDPE", recyclability: true}, {name: "PVC", recyclability: false }, {name: "LDPE", recyclability: false}, {name: "PP", recyclability: true}, {name: "PS", recyclability: false }, {name: "others", recyclability: false }]},
{category: "glass" , descriptions: [{name: "Clear glass bottle", recyclability: true }, {name: "Green glass bottle", recyclability: true}, {name: "Brown glass bottle", recyclability: true }, {name: "Perfume glass bottle", recyclability: true}, {name: "Aftershave glass bottle", recyclability: true}, {name: "Pyrex", recyclability: false }, {name: "Crystal", recyclability: false }, {name: "Drinking glass", recyclability: false }, {name: "others", recyclability: false }]},
{category: "paper" , descriptions: [{name: "Kitchen towel", recyclability: false }, {name: "Newspaper", recyclability: true}, {name: "White paper", recyclability: true }, {name: "Cardboard", recyclability: true}, {name: "Envelopes (incl. windows)", recyclability: true}, {name: "Sticky paper (incl. post-it notes and labels)", recyclability: false }, {name: "Shiny or glittery wrapping paper", recyclability: false }, {name: "Wet wipes", recyclability: false }, {name: "others", recyclability: false }]},
{category: "metal" , descriptions: [{name: "Drinks cans", recyclability: true }, {name: "Food tins", recyclability: true}, {name: "Biscuit tins", recyclability: true }, {name: "Aluminium Trays and tubes", recyclability: true}, {name: "Aluminium foil (if no food residue)", recyclability: true}, {name: "Laminated foil (that spring back when you try to scrunch them)", recyclability: false }, {name: "Shiny or glittery wrapping paper", recyclability: false }, {name: "Crisp packets", recyclability: false }, {name: "Sweetie wrappers", recyclability: false }, {name: "others", recyclability: false }]}]

materials.each do |material|
    material[:descriptions].each do |description|
        Material.create(category: material[:category], name: description[:name], recyclability: description[:recyclability])
    end
end

puts "creating products"
products = [{category: "soup" , descriptions: [{name: "Biona Organic Spiced Pumpkin Soup", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Biona Organic Hearty Lentil Soup", url: "https://cdn.shopify.com/s/files/1/1645/4125/products/12845_20BIONA_20Hearty_20Lentil_20Soup_20680g.png?v=1535639743"}, {name: "Amy's Kitchen Hearty Spanish Rice & Red Bean Soup", url: "https://images.unsplash.com/photo-1516317518460-4deaeea07922?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"}, {name: "Heinz Classic Carrot & Coriander Soup", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Heinz Spring Vegetable Soup", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Essential Waitrose Vegetable Soup", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Baxters Vegetarian Carrot & Butterbean Soup", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}]},
{category: "soft drinks" , descriptions: [{name: "Coca-Cola", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Schweppes Lemonade", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Fanta Orange", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Lucozade Energy Original", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Innocent Orange Juice", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Waitrose Chilled Smooth Orange Juice", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}, {name: "Tropicana Whole Fruit Orange", url: "https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png"}]}]
#{category: "cereals" , descriptions: [{name: "Mornflake Pure Organic Oats"}, {name: "Quaker Oats Jumbo Rolled Oats Porridge"}, {name: "Scott's Porage Original Porridge Oats "}, {name: "Flahavan's Organic Jumbo Oats"}, {name: "Essential Waitrose Porridge Oats With Wheatbran"}, {name: "Tree of Life Organic Porridge Oats"}, {name: "Essential Waitrose Porridge Oats"}]},
#{category: "chocolate and sweets" , descriptions: [{name: "Cadbury Mini Eggs Bag"}, {name: "Cadbury Dairy Milk Whole Nut"}, {name: "Snickers"}, {name: "Mars"}, {name: "Bounty"}, {name: "M&Ms"}, {name: "KitKat"}]}]

products.each do |product|
   product[:descriptions].each do |description|
     product = Product.new(category: product[:category], name: description[:name], user_id: default.id)
     file = URI.open(description[:url])
     product.photo.attach(io: file, filename: "product.png", content_type: 'image/png')
     product.save
    end
end   

Product.all.each_with_index do |product, index|
    case index
        when 0..1
            material = Material.where(name: "Clear glass bottle")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
            material = Material.where(name: "PET")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 2..6
            material = Material.where(name: "Food tins")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 7..13
            material = Material.where(name: "PET")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
            material = Material.where(name: "Cardboard")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 14..17
            material = Material.where(name: "Cardboard")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id) 
        else
            material = Material.where(name: "others")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
    end
    
end
puts "Happy days"
