
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
#Product.create(user_id: default.id, )
products = [{category: "soup" , descriptions: [{name: "Biona Organic Spiced Pumpkin Soup"}, {name: "Biona Organic Hearty Lentil Soup"}, {name: "Amy's Kitchen Hearty Spanish Rice & Red Bean Soup"}, {name: "Heinz Classic Carrot & Coriander Soup"}, {name: "Heinz Spring Vegetable Soup"}, {name: "Essential Waitrose Vegetable Soup"}, {name: "Baxters Vegetarian Carrot & Butterbean Soup"}]}]

products.each do |product|
    product[:descriptions].each do |description|
        Product.create(category: product[:category], name: description[:name], user_id: default.id)
    end
end  

Product.all.each_with_index do |product, index|
    case index
        when 0..1
            material = Material.where(name: "Clear glass bottle")[0]
        when 2..6
            material = Material.where(name: "Food tins")[0]
        else
            material = Material.where(name: "others")[0]
    end
    ProductMaterial.create(product_id: product.id, material_id: material.id)
end
puts "Happy days"
#Product.create(name: "Amy's Kitchen Hearty Spanish Rice & Red Bean Soup", category: "Soup")
#Product.create(name: "Biona Organic Spiced Pumpkin Soup", category: "Soup")

