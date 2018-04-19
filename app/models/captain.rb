class Captain < ActiveRecord::Base
  has_many :boats


  def self.catamaran_operators
    # binding.pry
    # Catamaran is a classification
    # Captain.joins(:boats).where(:boats => { :name => ['Catamaran'] })

    # no idea. mayb if i thought about it in sql first
    # Captain.joins(:boats).classifications.where(:classifications => { :name => ['Catamaran'] })

    # Classification.joins(:boats,:captain).where("boat.captain_id = captain.id")

    # have to get to classifications from boats.

    # no idea

    # Captain.joins(:boats).group("boats.id").having("count(classifications.id) = 3")
    #
    # Boat.joins(:classifications).group("boats.id").having("count(classifications.id) = 3")
    # Boat.joins(:classifications, :captain).group("captains.id").having("classifications.name = 'Catamaran'")

    # got the boats of the captains of catarmarans, when i need the captain
    # Captain.joins(:classifications, :boats).group("captains.id").where("classifications.name = 'Catamaran'")

    # iterate over activerecord relation
    boats = Boat.joins(:classifications, :captain).group("captains.id").where("classifications.name = 'Catamaran'")

    # ans = boats.collect do |boat|
    #   Boat.find_by(name: boat)
    # end
    #
    # ans


  end
end
