class CreateScientificRanks < ActiveRecord::Migration
  def up
    create_table :scientific_ranks do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :scientific_ranks
  end
end
