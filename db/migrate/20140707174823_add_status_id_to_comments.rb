class AddStatusIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :status_id, :integer
  end
end
