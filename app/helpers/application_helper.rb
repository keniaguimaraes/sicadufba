module ApplicationHelper
 def formato_data_hora(data)
      if data.present?
       data.strftime("%d/%m/%Y  %T")
      end 
 end
 def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
      end
    }

    messages
 end
end
