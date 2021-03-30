class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :short_url
      t.integer :click_count
      t.string :device
      t.string :ip

      t.timestamps
    end
  end
end
