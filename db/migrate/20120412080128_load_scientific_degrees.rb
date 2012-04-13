require "active_record/fixtures"
class LoadScientificDegrees < ActiveRecord::Migration
  def up
    down
    directory = File.join(File.dirname(__FILE__), "data")
    ActiveRecord::Fixtures.create_fixtures(directory, "scientific_degrees")
  end

  def down
    ScientificDegree.delete_all
  end
end


