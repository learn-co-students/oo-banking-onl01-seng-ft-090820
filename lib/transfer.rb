class Transfer
  
  attr_accessor :sender, :receiver, :transfer, :amount, :status, :bankaccount
  
  def initialize(sender, receiver,amount)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end 

  def execute_transaction
    #binding.pry
    if valid? && @sender.balance >= @amount && @status == "pending" 
      @sender.balance -= @amount
      @receiver.balance += amount
      @status = "complete"
    elsif @sender.balance < @amount || @sender.status == "closed" || @receiver.status == "closed"
      @status = "rejected"
     "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      @status = "pending"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
