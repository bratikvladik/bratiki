require "active_record/fixtures"
class LoadScientificRanks < ActiveRecord::Migration
  def up
    down
    directory = File.join(File.dirname(__FILE__), "data")
    ActiveRecord::Fixtures.create_fixtures(directory, "scientific_ranks")
  end

  def down
    ScientificRank.delete_all
  end
end


