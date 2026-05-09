namespace :db do
  desc "Fetch data from External API and populate model"
  task populate_products: :environment do
    url = "https://api.escuelajs.co/api/v1/products"
    response = Faraday.get(url)

    if response.success?
      data = JSON.parse(response.body)
      SIZES = [ "xs", "s", "m", "l" ]

      data.each do |item|
          Product.find_or_initialize_by(external_id: item["id"]).tap do |p|
            p.title       = item["title"]
            p.price       = item["price"]
            p.description = item["description"]
            p.category    = item["category"]
            p.images      = item["images"]
            p.sizes       = SIZES.map { |size| { size: size, quantity: rand(1..10) } }
            p.save
        end
      end
      puts "Successfully populated #{data.count} records."
    else
      puts "Failed to fetch data: #{response.status}"
    end
  end
end
