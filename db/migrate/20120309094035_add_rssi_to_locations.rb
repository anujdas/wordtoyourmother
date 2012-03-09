class AddRssiToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :rssi, :integer
  end

  def self.down
    remove_column :locations, :rssi
  end
end
