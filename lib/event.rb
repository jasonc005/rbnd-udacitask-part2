class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :type
  attr_accessor :priority

  def initialize(description, options={})
    @type = "event"
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
    @priority = options[:priority] || "low"
  end

  def details
    "event dates: " + format_date(start_date: @start_date, end_date: @end_date) +
    format_priority(@priority)
  end
end
