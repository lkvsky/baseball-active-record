class Person < ActiveRecord::Base
  set_table_name(:Master)
  set_primary_key(:lahmanID)

  has_many :playerships, :foreign_key => :playerID, :primary_key => :playerID
  has_many :played_teams, :class_name => "Team", :through => :playerships

  has_many :batting_lines, :foreign_key => :playerID, :primary_key => :playerID
  has_many :pitching_lines, :foreign_key => :playerID, :primary_key => :playerID

  has_many :salaries, :foreign_key => :playerID, :primary_key => :playerID

  has_many :managerships, :foreign_key => :managerID, :primary_key => :managerID
  has_many :managed_teams, :class_name => "Team", :through => :managerships

  # in 1000 at bats, they hit 300 (H), divide hits/at bats
  def self.good_batters
    good_batters = Person.select('Master.*, H/AB as batting_average')
    .where('AB >= 100')
    .joins(:batting_lines)
    .group(:lahmanID)

    good_batters.select! { |batter| batter.batting_average > 0.300 }
  end

  def self.longest_career
    Person.select('Master.*, MAX(yearID) - MIN(yearID) as career_length')
    .joins(:playerships)
    .group(:lahmanID)
    .order('career_length DESC')
    .first
  end

  def self.managed_most_players
    Person.select('Master.*')
    .includes(:managerships)
    .limit(10)
  end

  def self.manager_and_player
    Person.select('Master.*')
    .where('playerID <> "" AND managerID <> ""')
  end

  def best_year
    Person.select('Master.*, H/AB as batting_average, yearID')
    .where('AB <> 0')
    .where(:lahmanID => self.lahmanID)
    .joins(:batting_lines)
    .order('batting_average DESC')
    .first
    .yearID
  end
end