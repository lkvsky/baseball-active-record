class Managership < ActiveRecord::Base
  set_table_name(:Managers)

  belongs_to :manager, :class_name => "Person", :foreign_key => :managerID, :primary_key => :managerID
end