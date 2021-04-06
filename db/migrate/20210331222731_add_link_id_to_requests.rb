class AddLinkIdToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :link_id, :integer
  end
end
