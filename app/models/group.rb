class Group < ApplicationRecord
  validates :name, presence: true
  validates :session_id, presence: true

end
