class CreateSexes < ActiveRecord::Migration
  def up
    create_table :sexes do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :sexes
  end
end
