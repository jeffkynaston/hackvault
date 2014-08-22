module ApplicationHelper
	def new_current_resource
		current_uri = request.env['PATH_INFO']
		if current_uri == "/"
			return ""
		elsif current_uri =~ /user/
			return ""
		else
			new_path_arr = current_uri.split("")
			new_path_arr.shift(1)
			if new_path_arr.include?("/")
				slash_pos = new_path_arr.index("/")
				new_path_arr.pop(new_path_arr.length-slash_pos)
			end
			return "/" + new_path_arr.join("") + "/new"
		end
	end

	def current_uri
		current_uri = request.env['PATH_INFO']
	end
end
