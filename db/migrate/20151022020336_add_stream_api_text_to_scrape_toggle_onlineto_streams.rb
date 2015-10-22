class AddStreamApiTextToScrapeToggleOnlinetoStreams < ActiveRecord::Migration
  def change
  	  	add_column :streams, :toggle_live, :boolean
  		add_column :streams, :stream_api_url, :string
  		add_column :streams, :text_to_scrape, :string
  end
end
