class Playership < ActiveRecord::Base
  set_table_name(:Appearances)

  belongs_to :player, :class_name => "Person", :foreign_key => :playerID, :primary_key => :playerID

  has_many :teams, :primary_key => [:teamID, :yearID, :lgID], :foreign_key => [:teamID, :yearID, :lgID]
end