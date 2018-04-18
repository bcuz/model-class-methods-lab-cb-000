class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    # find(:all, :order => "id asc", :limit => 5)
    # self.find(:all, :limit => 5)
    order(id: :asc).limit(5)
  end

  def self.dinghy
     where("length <?", 20)
  end
  def self.ship
     where("length >=?", 20)
  end

  def self.last_three_alphabetically
    # order(name: :asc).limit(3)
    # opposite direction
    order(name: :desc).limit(3)

  end

  def self.without_a_captain
    where(captain_id: nil)
  end

  def self.sailboats
    # idk

  end
end
