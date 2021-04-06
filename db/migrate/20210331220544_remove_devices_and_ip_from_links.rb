class RemoveDevicesAndIpFromLinks < ActiveRecord::Migration[6.1]
  def change
    remove_column :links, :device
    remove_column :links, :ip
  end
end
