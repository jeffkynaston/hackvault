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
end
