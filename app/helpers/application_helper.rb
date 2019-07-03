module ApplicationHelper
 def formato_data_hora(data)
      if data.present?
       data.strftime("%d/%m/%Y")
      end 
 end
 


end
