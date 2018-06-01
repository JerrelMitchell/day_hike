class Trail < ApplicationRecord
  has_many :trip_trails
  has_many :trips, through: :trip_trails

  def self.total_distance
    sum(:length)
  end

  def self.average_distance
    average(:length).to_f.round(2)
  end

  def self.longest_distance
    maximum(:length)
  end

  def self.shortest_distance
    minimum(:length)
  end
end
