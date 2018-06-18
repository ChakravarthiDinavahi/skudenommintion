class Denomination < ApplicationRecord
  serialize :sku_combination, Array
  validates :sku_combination, presence: true
  validates :sku_denomination, presence: true
  
    def self.get_combination(arrays)
      arrays.shift
      arrays.pop
      arrays=arrays.collect{|a| a.compact}
      first=arrays.first
      arrays.shift
      result=first.product(*arrays)
    end
end
