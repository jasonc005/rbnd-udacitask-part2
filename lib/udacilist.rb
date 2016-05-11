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

  def display_table(items)
    rows = []
    items.each_with_index do |item, position|
      rows << [position+1, item.type, item.description, item.details]
      rows << :separator
    end
    rows.delete_at(rows.length - 1)

    table = Terminal::Table.new :title => @title, :headings => ['','Type','Description','Details'], :rows => rows
    puts table
    puts "\n\n"
  end

  def all
    display_table(@items)
  end

  def filter (item_type)
    filtered_array = @items.select {|item| item.type == item_type}
    if filtered_array.length > 0
      display_table(filtered_array)
    else
      puts "There are no items of type #{item_type}"
    end
  end

  def change_priority (index, priority)
    @items[index-1].priority = priority
  end

end
