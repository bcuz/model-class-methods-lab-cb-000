class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    select(:name).distinct
  end

  def self.sailboats
    where(name: nil)

  end

end
