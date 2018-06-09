class Denomination < ApplicationRecord

  def get_combination(a,b,c)

    result=[]
    temp=[]

    a.each do |i|
    	b.each do |j|
    		c.each do |k|
    		temp<<i
    		temp<<j
    		temp<<k

    result<< temp
    temp=[]
    	end
    end
    end
    return result
  end
end
