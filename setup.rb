require_relative 'basket'

products = {
  "R01" => 32.95,
  "G01" => 24.95,
  "B01" => 7.95
}
 
delivery_rules = {
  under_50: 4.95,
  under_90: 2.95
}
 
offers = {
  red_widget_discount: true
}
 
basket = Basket.new(products: products, delivery_rules: delivery_rules, offers: offers)
["B01", "B01", "R01", "R01", "R01"].each { |code| basket.add(code) }
 
puts basket.total