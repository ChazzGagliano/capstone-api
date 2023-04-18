class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def tax
  subtotal * 0.09
  end

  def total
  subtotal + tax
  end
  
end
