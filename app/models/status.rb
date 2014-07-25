class Status < ActiveRecord::Base
	  include PublicActivity::Model  
tracked except: :update, owner: ->(controller, model) { controller && controller.current_user }  
  
 has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "public/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :picture, :less_than => 1.megabytes



     belongs_to :user
     has_many :comments

end

