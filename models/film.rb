# Film Class
require_relative '../mongoconnect'
require 'bcrypt'

class Film < Api
  attr_accessor *[
    :project_title,
    :duration,
    :trailer_url,
    :synopsis,
    :country,
    :tags_descriptors,
    :submitter_biography,
    :language,
    :project_type,
    :genres,
    :first_time_film_maker,
    :directors,
    :producers,
    :key_cast,
    :other_credits
  ]
  # doc is inherited from parent, represents the BSON doc
  attr_reader :articles

  # hash contains symbol keys
  def initialize(hash={})
    fields = [
      :id,
      :project_title,
      :duration,
      :trailer_url,
      :synopsis,
      :country,
      :tags_descriptors,
      :submitter_biography,
      :language,
      :project_type,
      :genres,
      :first_time_film_maker,
      :directors,
      :producers,
      :key_cast,
      :other_credits,
      :created_at,
      :updated_at,
      :subscription_plan_id,
      :trial_period_end_date,
      :phone_number,
      :billing_address,
    ]
    # Notice I'm creating the instance variables in the parent class.
    # First I tell the parent API about my Mongo collection which represents this class
    @COLLECTION_NAME = 'film'
    # Now I pass in the fields that will be used as "filters" and the hash containing
    # the actual properties I want to set up. When API is done it will return newly created
    # child instance already populated with the right fields and methods!
    super(@COLLECTION_NAME, fields, hash, self)
  end
end
