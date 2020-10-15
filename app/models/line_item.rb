class LineItem < ActiveRecord::Base

  belongs_to :order
  belongs_to :product

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

  def product
    product = Product.find(self.product_id) # each line item has a product_id, find that product
  end

end
