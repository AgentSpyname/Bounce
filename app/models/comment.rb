class Comment < ActiveRecord::Base
  include PublicActivity::Model  
tracked except: :update, owner: ->(controller, model) { controller && controller.current_user }  
belongs_to :status
belongs_to :user

     end

