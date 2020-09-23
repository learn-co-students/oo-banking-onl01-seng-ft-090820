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
    if (@sender.balance > @amount && self.status == "pending" && self.valid?)
      @sender.balance -= @amount 
      @receiver.deposit(@amount)
      @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    @status == "complete" && @sender.balance += @amount 
  end 

end
