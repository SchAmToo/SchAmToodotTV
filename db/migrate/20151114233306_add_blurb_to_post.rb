class AddBlurbToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :blurb, :string
  end
end
