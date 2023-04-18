class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :user
  has_many :images
  has_many :orders

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  
  def flavor
   description
  end
 
  def tax
    tax = price * 0.09
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
  end
end
