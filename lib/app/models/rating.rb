class Rating < ActiveRecord::Base
  belongs_to :rate
  belongs_to :rateable, :polymorphic => true

  validates_uniqueness_of :user_id, :scope => [:rateable_id, :rateable_type]

  ##
  # Parse the specified array of Posts in the requested format.
  #
  # === Parameters
  #
  # [ratings] the array of Rating records
  # [output] the requested output format, must be :xml or :json
  #
  # @return the "ratings" in the requested structure, e.g. xml format string
  #
  def self.parse_as(ratings, output = :json)
    if output == :json
      ratings.to_json(:only => [:user_id, :rater_name, :created_at],
                      :methods => [:score])
    elsif output == :xml
      ratings.to_xml(:only => [:user_id, :rater_name, :created_at],
                     :methods => [:score])
    end
  end

  ##
  # Returns this rating's score, e.g. 6
  #
  def score
    rate.score
  end
end
