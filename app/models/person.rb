class Person < ActiveRecord::Base
  set_table_name(:Master)
  set_primary_key(:lahmanID)

  has_many :playerships, :foreign_key => :playerID
  has_many :played_teams, :class_name => "Team", :through => :playerships

  has_many :batting_lines, :foreign_key => :playerID
  has_many :pitching_lines, :foreign_key => :playerID

  has_many :salaries, :foreign_key => :playerID

  has_many :managerships, :foreign_key => :managerID
  has_many :managed_teams, :class_name => "Team", :through => :managerships
end