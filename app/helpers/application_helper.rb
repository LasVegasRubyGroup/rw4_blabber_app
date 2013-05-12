module ApplicationHelper
  
  def flash_message
    unless flash.blank?
      [:notice, :error].each do |message|
        return content_tag(:div, flash[message], class: message) if flash[message].present?
      end
    end
  end
  
end
