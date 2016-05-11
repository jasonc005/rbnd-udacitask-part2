class LinkItem
  include Listable
  attr_reader :description, :site_name, :priority, :type

  def initialize(url, options={})
    @type = "link"
    @description = url
    @site_name = options[:site_name]
    @priority = options[:priority] || "low"
  end

  def format_name
    @site_name ? @site_name : ""
  end

  def details
    "site name: " + format_name +
    format_priority(@priority)
  end
end
