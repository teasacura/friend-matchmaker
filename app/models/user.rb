class User < ApplicationRecord
  has_secure_password

  # # matcher_matches "names" the Match join table for accessing through the matcher association
  has_many :matcher_matches, foreign_key: :matchee_id, class_name: "Match"
  # # source: :matcher matches with the belong_to :matcher identification in the Match model
  has_many :matchers, through: :matcher_matches, source: :matcher
  #
  # # matchee_matches "names" the Match join table for accessing through the matchee association
  has_many :matchee_matches, foreign_key: :matcher_id, class_name: "Match"
  # # source: :matchee matches with the belong_to :matchee identification in the Match model
  has_many :matchees, through: :matchee_matches, source: :matchee

  # prints out all matches (both names)
  def all_matches
    self.matchees.map { |e| [self.name, e.name] }.concat(self.matchers.map{ |e| [self.name, e.name] })
  end


end
