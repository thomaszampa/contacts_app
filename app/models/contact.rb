class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  belongs_to :user

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def full_name
    full_name = first_name + " " + last_name
  end
end
