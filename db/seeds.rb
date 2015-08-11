# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create!(title: 'The RSpec Book', 
  description:
    %{<p>
    	The RSpec Book is one of the most coprehensive books available on test-driven development
    	Every Ruby programmer should add this to their toolbox.
      </p>},
    image_url: 'achbd.jpg',
    price: 38.95)