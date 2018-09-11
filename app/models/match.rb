class Match < ApplicationRecord

  belongs_to :matcher, foreign_key: "matcher_id", class_name: "User"
  belongs_to :matchee, foreign_key: "matchee_id", class_name: "User"

  validate :unique_match

  # validates that the match is unique
  def unique_match
    Match.all.each do |match|
      if (match.matcher_id == self.matcher_id) && (match.matchee_id == self.matchee_id) || (match.matcher_id == self.matchee_id) && (match.matchee_id == self.matcher_id)
        errors.add(:unique_match, "already exists")
      end
    end
  end

end
