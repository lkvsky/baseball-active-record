class BattingLine < ActiveRecord::Base
  set_table_name(:Batting)

  belongs_to :player, :class_name => "Person", :foreign_key => :playerID
end