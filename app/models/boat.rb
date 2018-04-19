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
    # Classification.select{|d| d.boat.classifications.include?("Sailboat")}

    # https://stackoverflow.com/questions/15939639/activerecord-query-with-two-associated-models
    Boat.joins(:classifications).where(:classifications => { :name => ['Sailboat'] })
    # make it in classification then chain onto that here?
  end

  def self.with_three_classifications
    # dont even know how to see it manually

    # Boat.joins(:classifications).where(:classifications.size == 3)
    # idk

    # Project.joins(:vacancies).group("projects.id").having("count(vacancies.id)>0")
    # https://stackoverflow.com/questions/20183710/find-all-records-which-have-a-count-of-an-association-greater-than-zero
    # got it, but only by the power of googling. pluralizing a thing
    Boat.joins(:classifications).group("boats.id").having("count(classifications.id) = 3")

  end
end
