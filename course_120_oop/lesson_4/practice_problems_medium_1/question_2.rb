# Alyssa created the following code to keep track of items for a shopping cart application she's writing:

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity
  end
end

=begin
Alan looked at the code and spotted a mistake. "This will fail when update_quantity is called", he says.
Can you spot the mistake and how to address it?

Answer:
The code will run - but @quantity will not be updated.
Alyssa might think she's calling a setter method for quantity on line 13 - but a setter method is not defined.
So in reality Alyssa is assigning the updated value to a local variable named quantity and the method will return
without updating any ivar.
=end
