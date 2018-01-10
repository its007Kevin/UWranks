class RelationshipsController < ApplicationController
	def create
		user = User.find(params[:followed_id])
		current_user.follow(user)
		request.referrer
	end

	def destroy
		user = Relationship.find(params[:id]).followed
		current_user.unfollow(user)
		request.referrer
	end
end