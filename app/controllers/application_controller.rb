class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :jira_link

	def jira_link
		return "http://192.168.1.13:8080/browse/"
	end
end
