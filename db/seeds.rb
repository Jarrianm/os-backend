clothing_sizes = [
  { size: "XS", quantity: 10 },
  { size: "S",  quantity: 15 },
  { size: "M",  quantity: 12 },
  { size: "L",  quantity: 8  }
]

shoe_sizes = (6..12).map { |n| { size: n.to_s, quantity: rand(3..10) } }

Product.where("category->>'name' = ?", "Clothes").find_each do |product|
  product.update!(sizes: clothing_sizes)
end

Product.where("category->>'name' = ?", "Shoes").find_each do |product|
  product.update!(sizes: shoe_sizes)
end

Product.where("category->>'name' IN (?)", [ "Electronics", "Furniture", "Miscellaneous" ]).find_each do |product|
  product.update!(sizes: [])
end
