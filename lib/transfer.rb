class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true 
    else
      return false 
    end
  end
      
  def execute_transaction
    if @sender.balance >=  @amount && status == "pending" && valid?
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  

    end
  end

end