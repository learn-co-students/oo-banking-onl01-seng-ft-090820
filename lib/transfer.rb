class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def sender_valid?
    !!(sender.valid?)
  end

  def receiver_valid?
    !!(receiver.valid?)
  end


  def valid?
    sender_valid? && receiver_valid?
  end

  def execute_transaction
    if valid? && sender.balance > @amount && self.status == "pending"
      sender.withdrawal(amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.withdrawal(amount)
      sender.deposit(amount)
      @status = "reversed"
    end
  end

end
