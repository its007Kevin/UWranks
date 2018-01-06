class PagesController < ApplicationController
	# back-end code for pages/index
  def index
  end

	# back-end code for pages/home
  def home
  end

	# back-end code for pages/profile
  def profile
  	# grab the username from the URL as :id\
  	if (User.find_by_username(params[:id])) 
  		@username = params[:id]
  	else
  		# redirect to error
  		redirect_to root_path, :notice => "User not found!"
  	end
  end

  # back-end code for pages/explore
  def explore
  end
end
