class CreateScientificDegrees < ActiveRecord::Migration
  def self.up
    create_table :scientific_degrees do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :scientific_degrees
  end
end
