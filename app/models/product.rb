class Product < ApplicationRecord
  # def flavor
  #   description
  # end
  
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
