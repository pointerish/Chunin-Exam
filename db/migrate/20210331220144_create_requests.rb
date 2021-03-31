class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :device
      t.string :ip

      t.timestamps
    end
  end
end
