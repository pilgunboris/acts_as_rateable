class Rating < ActiveRecord::Base
  belongs_to :rate
  belongs_to :rateable, :polymorphic => true

  validates_presence_of :rate
  validates_presence_of :user_id
  validates_uniqueness_of :user_id, :scope => [:rateable_id, :rateable_type]

  ##
  # Return the specified array of Ratings in json format.
  #
  # Result looks like:  [{ "created_at" : "2012-05-20T14:15:36+04:00",
  #                        "rater_name" : "joan.toy",
  #                        "user_id"    : 12,
  #                        "score"      : 2 }, .. ]
  #
  def self.format(ratings)
    ratings.to_json(:only => [:user_id, :free_text, :rater_name, :created_at],
                    :methods => [:score])
  end

  ##
  # Returns this rating's score, e.g. 6
  #
  def score
    rate.score
  end
end