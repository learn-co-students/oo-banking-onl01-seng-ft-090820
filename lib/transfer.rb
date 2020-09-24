class Transfer

  attr_accessor :status, :sender, :receiver, :amount, :executions


  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
    @executions = 0
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction

    if @executions == 0

      if self.valid? == true && @sender.balance > @amount
       @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @executions = @executions + 1
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end

    else
      "Transaction already completed."
    end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    else
      "This transfer was never completed."
    end
  end





end
