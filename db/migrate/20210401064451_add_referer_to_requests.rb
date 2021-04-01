class AddRefererToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :referer, :string
  end
end
