class AddRemoteUrLtoPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :remote_url, :string
  end
end
