class Vote < ActiveRecord::Base
  belongs_to :statement
  belongs_to :user
  validates :user, uniqueness: { scope: :statement, message: "has voted on this statement already" }

end
