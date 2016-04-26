# == Schema Information
#
# Table name: benches
#
#  id          :integer          not null, primary key
#  description :string
#  lat         :float
#  lng         :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Bench < ActiveRecord::Base
  def self.in_bounds(northEast, southWest)
    Bench.where(:lat => southWest["lat"] .. northEast["lat"]).where(:lng => southWest["lng"] .. northEast["lng"]);
  end
end
