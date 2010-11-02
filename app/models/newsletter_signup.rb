class NewsletterSignup < ActiveRecord::Base
  
  def export_columns(format=nil)
    %w(last_name first_name email street_address city state zip exported)
  end
  
  def parse_body(body)
    lines = body.split("\n")
    lines.each do |line|
      next if line.blank?
      field, value = line.split(":")
      send "#{field.downcase.gsub(' ', '_')}=", value.strip
    end
  end
  
end