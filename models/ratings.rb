# Ratings Class
require_relative '../mongoconnect'
require 'bcrypt'

class Rating < Api
  attr_accessor *[
    :id,
    :email_address,
    :film_name,
    :cinematography,
    :acting,
    :script,
    :directing,
    :ending,
    :statements,
    :filmmaker, 
    :questions_for_film_maker,
    :feedback_for_noirfest_team
  ]
  # doc is inherited from parent, represents the BSON doc
  attr_reader :articles

  # hash contains symbol keys
  def initialize(hash={})
    fields = [
      :email_address,
      :film_name,
      :cinematography,
      :acting,
      :script,
      :directing,
      :ending,
      :statements,
      :filmmaker, 
      :questions_for_film_maker,
      :feedback_for_noirfest_team     
    ]
    # Notice I'm creating the instance variables in the parent class.
    # First I tell the parent API about my Mongo collection which represents this class
    @COLLECTION_NAME = 'rating'
    # Now I pass in the fields that will be used as "filters" and the hash containing
    # the actual properties I want to set up. When API is done it will return newly created
    # child instance already populated with the right fields and methods!
    super(@COLLECTION_NAME, fields, hash, self)
  end
end
