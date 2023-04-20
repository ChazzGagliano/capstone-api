class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :carted_products

  def tax
  subtotal * 0.09
  end

  def total
  subtotal + tax
  end
  
end
