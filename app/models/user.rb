class User < ApplicationRecord
  belongs_to :group, optional: true
  has_many :histories
  validates :name, presence: true
  validates :session_id, presence: true
end
