class UdaciList
  include UdaciListErrors
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    if is_valid_type?(type) && (options[:priority] ? is_valid_priority?(options[:priority]) : true)
      @items.push TodoItem.new(description, options) if type == "todo"
      @items.push EventItem.new(description, options) if type == "event"
      @items.push LinkItem.new(description, options) if type == "link"
    end
  end

  def delete(index)
    @items.delete_at(index - 1) if is_valid_index? (index)
  end

  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
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
