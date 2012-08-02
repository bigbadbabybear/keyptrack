class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :link_to_jira

	def link_to_jira
		"http://192.168.1.13:8080/browse"
	end

	def current_user
			
	end
end
