require 'pry'
class CashRegister
    attr_accessor :total, :discount,:items,:last_item
    attr_reader :items
    def initialize(*discount)
        @total=0
        @discount=discount[0]
        @items=[]
    end
    def add_item(title,price,*quantity)
        
        if quantity==[]
            self.total+=price
           self.items=self.items<<title
           self.last_item=price
        else
            self.total+=quantity[0]*price
            self.last_item=price*quantity[0]
            quantity[0].times do |i|
                self.items=self.items<<title
            end
        end
    end
    def apply_discount
        if self.discount==nil
            "There is no discount to apply."
        else 
            remaining=(100-self.discount.to_f)/100
            puts remaining
            self.total=remaining*self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        end
        
    end
    def void_last_transaction
        self.total-=last_item
    end
end
r1=CashRegister.new
r1.add_item('eggs',1000)
r2=CashRegister.new(40)
r2.add_item('milk',2000)
