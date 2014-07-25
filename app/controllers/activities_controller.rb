class ActivitiesController < ApplicationController
  def index
  	if current_user
  		ids = [current_user.id, *current_user.friends.map(&:id)]
@activities = PublicActivity::Activity.where(:owner_id => ids).limit(10).order("created_at DESC").paginate(page: params[:page], :per_page   => 10)
else
	
 
	@statuses = Status.all
end

  end



private
 # Never trust parameters from the scary internet, only allow the white list through.
def status_params
  params.require(:status).permit(:content,:picture)
  end

end