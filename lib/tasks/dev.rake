namespace :dev do
  task fake_product: :environment do
    Product.destroy_all
    1000.times do
      product = Product.new(
        name: FFaker::Product.unique.product_name,
        description: FFaker::Lorem::sentence(30),
        price: rand(3000),
        image: FFaker::Avatar.image
      )
      product.save!
    end

    puts "#{Product.all.count} products created"
  end
end