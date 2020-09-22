require 'pry'

class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid? && sender.balance > @amount
  end
  
  def execute_transaction
    if @status == "pending" && self.valid?
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender,@receiver = @receiver,@sender
      @status = "pending"
      self.execute_transaction
      @status = "reversed"
    end
  end
  
end
