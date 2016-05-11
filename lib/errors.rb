module UdaciListErrors
  # Error classes go here
  class InvalidItemType < StandardError
  end

  class IndexExceedsListSize < StandardError
  end

  class InvalidPriorityValue < StandardError
  end

  def is_valid_type? (type)
    types = ["todo","event","link"]
    if types.include? type
      true
    else
      raise InvalidItemType, "#{type} is not a valid item type."
    end
  end

  def is_valid_index? (index)
    if index <= @items.length
      true
    else
      raise IndexExceedsListSize, "#{index} is larger than the list size."
    end
  end

  def is_valid_priority? (priority)
    values = ["high","medium","low"]
    if values.include? priority
      true
    else
      raise InvalidPriorityValue, "#{priority} is an invalid priority value."
    end
  end
  
end
