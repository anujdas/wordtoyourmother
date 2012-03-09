class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.float :accuracy
      t.datetime :time
      t.integer :device_id
    end

    add_index :locations, [:device_id], :name => :device_id_index
  end

  def self.down
    drop_table :locations
  end
end
