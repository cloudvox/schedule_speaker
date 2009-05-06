class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :summary
      t.text :description
      t.integer :location_id
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
