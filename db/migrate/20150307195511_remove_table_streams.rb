class RemoveTableStreams < ActiveRecord::Migration
  def change
  	drop_table :streams
  end
end
