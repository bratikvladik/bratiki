class CreatePairs < ActiveRecord::Migration
  def up
    create_table :pairs do |t|
      t.string :object
      t.string :kind
      t.integer :number
      t.string :teacher
      t.datetime :date_time
      t.string :place
      t.string :group

      t.timestamps
    end
  end

  def down
    drop_table :pairs
  end
end
