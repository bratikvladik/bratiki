class CreateMilitaryRanks < ActiveRecord::Migration
  def up
    create_table :military_ranks do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :military_ranks
  end
end
