class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_one :quiz
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

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
    self.matchees.map { |e| [self, e] }.concat(self.matchers.map{ |e| [self, e] })
  end


end
