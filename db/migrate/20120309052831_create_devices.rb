class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.text :identifier
      t.boolean :locate_enabled
    end
  end

  def self.down
    drop_table :devices
  end
end
