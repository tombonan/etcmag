module ApplicationHelper
	def full_title(page_title = '')
    base_title = "Etcmag"
	    if page_title.empty?
	      base_title
	    else
	      page_title + ' | ' + base_title
	    end
  	end

  	def cp(path)
  		"active-nav" if current_page?(path)
	end
end
