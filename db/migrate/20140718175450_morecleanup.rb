class Morecleanup < ActiveRecord::Migration
  def change
  	drop_table :likes
  	drop_table :votes
  	drop_table :likescs
  	drop_table :like_stores
  	drop_table :homepages
  end
end
