class Transfer
  
  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize(sender, reciever, amount)
    @status = "pending"
    @amount = amount  
    @receiver = receiver
    @sender = sender
  end 

  def valid?
  end 

  def execute_transaction
  end 

  def reverse_transfer
  end 

end
