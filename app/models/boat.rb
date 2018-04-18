class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    # find(:all, :order => "id asc", :limit => 5)
    # self.find(:all, :limit => 5)

    order(id: :asc).limit(5)
  end
end
