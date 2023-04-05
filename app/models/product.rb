class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  
  def flavor
   description
  end
 
  def tax
    tax = price * 0.09
    p tax
  end

  def is_discounted
    if price >= 10
     return false
    else 
    return true
    end
  end

  def total
    total = price + tax
    p total
  end
end
