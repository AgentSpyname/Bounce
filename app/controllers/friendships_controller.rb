class FriendshipsController < ApplicationController
	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		@friendship.save
			flash[:notce] = "Following User"
			redirect_to profile_path(current_user.username)

	

	end
def destroy 
	@user = User.find_by_username(params[:id])
	@friendships = current_user.friendships.find(params[:id])
	@friendships.destroy
	flash[:notice] = "Unfollowed!"
	redirect_to profile_path(current_user.username)
end

end
