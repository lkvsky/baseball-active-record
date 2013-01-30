class Team < ActiveRecord::Base
  set_table_name(:Teams)
  set_primary_keys(:yearID, :lgID, :teamID)

  belongs_to :managership, :primary_key => [:teamID, :yearID, :lgID], :foreign_key => [:teamID, :yearID, :lgID]
  belongs_to :manager, :class_name => "Person", :through => :managership
end