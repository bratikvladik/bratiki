class CreateFaculties < ActiveRecord::Migration
  def up
    create_table :faculties do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :faculties
  end
end
