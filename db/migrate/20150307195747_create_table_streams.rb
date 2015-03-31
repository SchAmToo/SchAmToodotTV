class CreateTableStreams < ActiveRecord::Migration
    def change
    create_table :streams do |t|
      t.string :source
      t.string :streamuri

      t.timestamps
    end
  end
end
