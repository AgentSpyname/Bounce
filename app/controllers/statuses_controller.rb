class StatusesController < ApplicationController
 before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /statuses
  # GET /statuses.json
  def index
  if current_user
    @statuses = Status.paginate(page: params[:page], :order => 'statuses.created_at DESC',:per_page   => 10)
 ids = [current_user.id, *current_user.friends.map(&:id)]
@friends_statuses = Status.where(:user_id => ids).order("created_at DESC").paginate(page: params[:page], :order => 'statuses.created_at DESC',:per_page   => 10)
end

  end


  # GET /statuses/1
  # GET /statuses/1.json
  def show
         @status = Status.find(params[:id])
         @comments = @status.comments.all(:order => 'comments.created_at DESC')
         render action: :show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
     @status = Status.find(params[:id])
  end

  # POST /statuses
   def create
    @status = current_user.statuses.new(status_params)

    respond_to do |format|
      if @status.save

        format.html { redirect_to root_url, notice: 'Status was successfully created.' }
        format.json { render json: @status, status: :created, location: @status }
      else
        format.html { render action: "new" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])
    
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
   
  end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json

def destroy
  @status = Status.find_by_id(params[:id])
  @status.delete

    respond_to do |format|
      format.html { redirect_to statuses_url }
      format.json { head :no_content }
    end

  end


 
def comment
  if current_user
  @status = Status.find(params[:id])
  @comment = @status.comments.new(:user_id => current_user.id)
  @comment.save

end
end

end



private
 # Never trust parameters from the scary internet, only allow the white list through.
def status_params
  params.require(:status).permit(:content,:picture)
  end







