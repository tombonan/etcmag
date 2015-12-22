module ApplicationHelper
	def full_title(page_title = '')
    base_title = "EtcMag"
	    if page_title.empty?
	      base_title
	    else
	      page_title + ' | ' + base_title
	    end
  	end

  	def cp(path)
  		"active-nav" if current_page?(path)
	end

	def mag
		if Issue.all.count > 0 
			"active-nav" if current_page?(Issue.last)
		end
	end
end
