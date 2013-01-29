class PitchingLine < ActiveRecord::Base
  set_table_name(:Pitching)

  belongs_to :player, :class_name => "Person", :foreign_key => :playerID
end