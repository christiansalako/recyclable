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
{category: "glass" , descriptions: [{name: "Clear glass", recyclability: true }, {name: "Green glass", recyclability: true}, {name: "Brown glass", recyclability: true }, {name: "Perfume glass bottle", recyclability: true}, {name: "Aftershave glass bottle", recyclability: true}, {name: "Pyrex", recyclability: false }, {name: "Crystal", recyclability: false }, {name: "Drinking glass", recyclability: false }, {name: "others", recyclability: false }]},
{category: "paper" , descriptions: [{name: "Kitchen towel", recyclability: false }, {name: "Newspaper", recyclability: true}, {name: "White paper", recyclability: true }, {name: "Cardboard", recyclability: true}, {name: "Envelopes (incl. windows)", recyclability: true}, {name: "Sticky paper (incl. post-it notes and labels)", recyclability: false }, {name: "Shiny or glittery wrapping paper", recyclability: false }, {name: "Wet wipes", recyclability: false }, {name: "others", recyclability: false }]},
{category: "metal" , descriptions: [{name: "Drinks cans", recyclability: true }, {name: "Food tin", recyclability: true}, {name: "Biscuit tin", recyclability: true }, {name: "Aluminium Trays and tubes", recyclability: true}, {name: "Aluminium foil", recyclability: true}, {name: "Laminated foil (that spring back when you try to scrunch them)", recyclability: false }, {name: "Shiny or glittery wrapping paper", recyclability: false }, {name: "Crisp packets", recyclability: false }, {name: "Sweetie wrappers", recyclability: false }, {name: "others", recyclability: false }]}]

materials.each do |material|
    material[:descriptions].each do |description|
        Material.create(category: material[:category], name: description[:name], recyclability: description[:recyclability])
    end
end

puts "creating products"
products = [{category: "soup" , descriptions: [{name: "Biona Organic Spiced Pumpkin Soup", url: "https://www.ocado.com/productImages/831/83102011_0_640x640.jpg?identifier=d4a86003b13c76d8cb183ecec4b7bad8"}, {name: "Biona Organic Minestrone Soup", url: "https://www.ocado.com/productImages/831/83107011_0_640x640.jpg?identifier=6d21a3b85e305c14d6319f5a72883947"}, {name: "Amy's Kitchen Hearty Spanish Rice & Red Bean Soup", url: "https://www.ocado.com/productImages/739/73934011_0_1280x1280.jpg?identifier=4e9a55b8f2a70cfbfad0b7dc1820ab96"}, {name: "Essential Waitrose Cream of Tomato Soup", url: "https://www.ocado.com/productImages/134/13476011_0_640x640.jpg?identifier=bf8c320faba67502a3d6685a979ecef6"}, {name: "Daylesford Organic Minestrone Soup with Chicken", url: "https://www.ocado.com/productImages/864/86441011_0_640x640.jpg?identifier=a4267ad129f52c5df14e187d99584da5"}, {name: "Ossa Organic Ginger & Turmeric Soup", url: "https://www.ocado.com/productImages/398/398011011_0_1280x1280.jpg?identifier=c7eb88aa4a924589459c79e040fccee8"}, {name: "PRESS Protein Pea & Mint Soup", url: "https://www.ocado.com/productImages/501/501579011_0_640x640.jpg?identifier=3a8b140048328857c11c2fd486ad2ce0"}]},
{category: "chocolate and sweets" , descriptions: [{name: "Cadbury Dairy Milk", url: "https://www.ocado.com/productImages/309/30998011_0_640x640.jpg?identifier=6143f4345af2df2a60f80f642b5bb623"}, {name: "Cadbury Mini Eggs Bag", url: "https://www.ocado.com/productImages/205/20584011_0_640x640.jpg?identifier=582b8325e727ecacc16997e2cde4d3b4"}, {name: "Cadbury Twirl Bites", url: "https://www.ocado.com/productImages/671/67103011_0_640x640.jpg?identifier=610aaa4c8051599c1c75ef387b99adaa"}, {name: "Cadbury Dairy Milk Whole Nut", url: "https://www.ocado.com/productImages/309/30999011_0_640x640.jpg?identifier=6e7d72c50e8d6f5c703e3c722cd5cf0c"}, {name: "Snickers Chocolate Bar", url: "https://www.ocado.com/productImages/273/273919011_0_640x640.jpg?identifier=96ef6b607a2924639cf6570d225ecabb"}, {name: "Mars Chocolate Bars", url: "https://www.ocado.com/productImages/273/273921011_0_640x640.jpg?identifier=fba4a0d798a20a7019a8d827fb2a7201"}, {name: "Bounty Milk Chocolate Bars", url: "https://www.ocado.com/productImages/846/84694011_0_640x640.jpg?identifier=92aa727e0e44d85bc49b9dd121674a59"}, {name: "Twix Chocolate Bar", url: "https://www.ocado.com/productImages/277/277299011_0_640x640.jpg?identifier=9436083f324db774ca156cbf7345eff4"}, {name: "Lindt Excellence Chocolate 70%", url: "https://www.ocado.com/productImages/113/11332011_0_640x640.jpg?identifier=9775622f09a1033214236d8709257cc3"}, {name: "Lindt Excellence Intense Orange", url: "https://www.ocado.com/productImages/340/34050011_0_640x640.jpg?identifier=a0310886d8a916378e02d3d9f6fe6ffd"}, {name: "Green & Black's Milk", url: "https://www.ocado.com/productImages/150/15055011_0_640x640.jpg?identifier=b1ba9af2c819fd2024d90381902b7f64"}, {name: "Green & Black's 70% Dark", url: "https://www.ocado.com/productImages/168/16884011_0_640x640.jpg?identifier=e708518f0e8037323542da6d7eec040d"}]},
{category: "cereals" , descriptions: [{name: "Quaker Oats Porridge", url: "https://www.ocado.com/productImages/180/18047011_0_1280x1280.jpg?identifier=1e8d40059de71e9562d63421ca591ca0"}, {name: "Scott's Porage Original Porridge Oats", url: "https://www.ocado.com/productImages/182/18287011_0_1280x1280.jpg?identifier=d75b0f2a06e8bc4a392ae6b79a9fe8ec"}, {name: "Waitrose Duchy Organic Jumbo Rolled Oats", url: "https://www.ocado.com/productImages/193/19398011_0_1280x1280.jpg?identifier=3d8e80fa6b9a3455c088b78b1d90dfe9"}, {name: "Flahavan's Organic Jumbo Oats", url: "https://www.ocado.com/productImages/506/50689011_0_640x640.jpg?identifier=76d95aac76394675b65cdf3c68804c7b"}, {name: "Essential Waitrose Porridge Oats", url: "https://www.ocado.com/productImages/100/10067011_0_1280x1280.jpg?identifier=6f0575c1e4a34b145b07dd10dec62713"}, {name: "Rude Health Naked Barley Porridge", url: "https://www.ocado.com/productImages/399/399262011_0_1280x1280.jpg?identifier=17a07c649c6c520f0b139583be4c7d85"}, {name: "Rude Health Organic Porridge 5 Grain 5 Seed", url: "https://www.ocado.com/productImages/420/42049011_0_640x640.jpg?identifier=1c3ee760554a587f59aa92c17bfd6b6c"}, {name: "Quaker Oat So Simple Golden Syrup Porridge", url: "https://www.ocado.com/productImages/328/328149011_0_640x640.jpg?identifier=1fdc116dc038ea9c5a3968416b5282d3"}]}]
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
            material = Material.where(name: "Clear glass")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
           # material = Material.where(name: "PET")[0]
           # ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 2..3
            material = Material.where(name: "Food tin")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 4..6
            material = Material.where(name: "Cardboard")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
            material = Material.where(name: "others")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 7..14
            material = Material.where(name: "others")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 15..16
            material = Material.where(name: "Cardboard")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id) 
            material = Material.where(name: "Aluminium foil")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 17..18
            material = Material.where(name: "Aluminium foil")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id) 
            material = Material.where(name: "White paper")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 19..21
            material = Material.where(name: "Cardboard")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 22
            material = Material.where(name: "White paper")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        when 23
            material = Material.where(name: "others")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)  
        when 24..26
            material = Material.where(name: "Cardboard")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
            material = Material.where(name: "others")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
        else
            material = Material.where(name: "others")[0]
            ProductMaterial.create(product_id: product.id, material_id: material.id)
    end
    
end
puts "Happy days"
