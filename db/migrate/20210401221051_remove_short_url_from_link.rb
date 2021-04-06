class RemoveShortUrlFromLink < ActiveRecord::Migration[6.1]
  def change
    remove_column :links, :short_url
  end
end
