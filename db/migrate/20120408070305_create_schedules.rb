class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.string :last_name_with_initials
      t.datetime :date_time
      t.integer :number
      t.string :object
      t.string :place
      t.string :kind
      t.string :group

      t.timestamps
    end
  end
  def self.down
    drop_table :users
  end
end
