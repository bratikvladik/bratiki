class CreateScientificDegrees < ActiveRecord::Migration
  def change
    create_table :scientific_degrees do |t|
      t.string :name

      t.timestamps
    end
  end
end
