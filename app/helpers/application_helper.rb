module ApplicationHelper

	def current_resource
		current_uri = request.env['PATH_INFO']
			new_path_arr = current_uri.split("")
			new_path_arr.shift(1)
			if new_path_arr.include?("/")
				slash_pos = new_path_arr.index("/")
				new_path_arr.pop(new_path_arr.length-slash_pos)
			end
			return new_path_arr.join("")
	end

	def new_current_resource
		return "/" + current_resource + "/new"	
	end

	def current_uri
		current_uri = request.env['PATH_INFO']
	end

	def current_class?(test_path)
	  return 'current' if request.path == test_path
	  return 'current' if "/#{current_resource}" == test_path
	  ''
	end

	def current_filter?(filter)
		if params["sort_info"] == nil 
			return 'filter-active' if filter == 'a-z'
		end
		if params["sort_info"]
	  	return 'filter-active' if filter == params["sort_info"]["sort_direction"]
	  end
	  ''
	end

	def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end
