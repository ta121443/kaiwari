class User < ApplicationRecord
  belongs_to :group, optional: true
  validates :name, presence: true
  validates :session_id, presence: true

end
