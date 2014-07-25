class ProfilesController < ApplicationController

  def index

      @users  = User.search(params[:search]).order('first_name ASC').paginate(:per_page => 10, :page => params[:page])
  end

  def show
 

    @user = User.find_by_username(params[:id])
    if @user

   @activities = PublicActivity::Activity.where(:owner_id => @user).limit(10).order("created_at DESC").paginate(page: params[:page], :per_page   => 10)

      render action: :show


    else
   
    end
  end

  def friends
      @user = User.find_by_username(params[:id])
       @friendships = @user.friendships.paginate(:page => params[:page], :per_page => 10)
  end

  def befriends
      @user = User.find_by_username(params[:id])
       @inverse_friends =@user.inverse_friends.paginate(:page => params[:page], :per_page => 10)
  end

end
