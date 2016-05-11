class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :type

  def initialize(description, options={})
    @type = "todo"
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority] || "low"
  end

  def details
    "due: " + format_date(start_date: @due) +
    format_priority(@priority)
  end
end
