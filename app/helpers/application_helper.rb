module ApplicationHelper
  
  include Pagy::Frontend
  
  def format_date(date, format = :long)
    date.blank? ? 'N/A' : date.to_s(format)
  end
end
