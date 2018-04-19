class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    select(:name).distinct
  end

  def self.sailboats
    where(name: 'Sailboat')

  end

  def self.longest
      # Classification.joins(:boats)

      # Classification.joins(:boats).order("boats.name desc"

      # longest boat, not longest name
      # Classification.joins(:boats).order("LENGTH(boats.name) desc").first

      # prolly crap code bruh
      Boat.joins(:classifications).order(length: :desc).first.classifications
  end

end
