 class Basket
  def initialize(products:, delivery_rules:, offers:)
    @products = products
    @delivery_rules = delivery_rules
    @offers = offers
    @items = []
  end
 
  def add(product_code)
    @items << product_code
  end
 
  def total
    subtotal = calculate_subtotal
    subtotal = apply_offers(subtotal)
    delivery = calculate_delivery(subtotal)
    total = subtotal + delivery
 
    format("$%.2f", total)
  end
 
  private
 
  def calculate_subtotal
    @items.map { |code| @products[code] }.sum
  end
 
  def apply_offers(subtotal)
    red_count = @items.count("R01")
    if red_count >= 2
      red_price = @products["R01"]
      discounted_items = red_count / 2
      discount = (red_price / 2) * discounted_items
      subtotal - discount
    else
      subtotal
    end
  end
 
  def calculate_delivery(subtotal)
    case subtotal
    when 0...50 then @delivery_rules[:under_50]
    when 50...90 then @delivery_rules[:under_90]
    else 0.0
    end
  end
end