class Salary < ActiveRecord::Base
  set_table_name(:Salaries)

  belongs_to :player, :class_name => "Person", :foreign_key => :playerID, :primary_key => :player_ID
end