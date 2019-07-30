# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  enum role: %i[manager employee]
  has_many :projects
  has_many :projects, through: :project_users

  validates :role, presence: true
  before_create :correct_user

  private

  def correct_user
    if User.find(manager_id).role != 'manager'
      errors.add(:name, 'cannot be created by unauthorized user')
    end
  end
  
end
