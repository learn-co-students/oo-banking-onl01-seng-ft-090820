class Transfer
  
  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @status = "pending"
    @amount = amount  
    @receiver = receiver
    @sender = sender
  end 

  def valid?
    sender.valid? && receiver.valid? 
  end 

  def execute_transaction
    if sender.balance = 950

    else 
      puts "Transaction rejected. Please check you account balance."
  end 

  def reverse_transfer
  end 

end
