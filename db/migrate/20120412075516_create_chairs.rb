class CreateChairs < ActiveRecord::Migration
  def up
    create_table :chairs do |t|
      t.string :name
      t.references :faculty

      t.timestamps
    end
    add_index :chairs, :faculty_id
  end

  def down
    drop_table :chairs
  end
end
