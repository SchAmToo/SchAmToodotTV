class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :login, :string
      t.column :hashed_password, :string
      t.column :email, :string
      t.column :salt, :string
      t.column :created_at, :datetime
      t.column :privacy, :string
    end
  end
end
