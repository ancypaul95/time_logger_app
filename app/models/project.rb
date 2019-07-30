# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :manager, class_name: 'User'
  has_many :users, through: :project_users
  has_many :project_users, dependent: :destroy

  validates :name, presence: true
  accepts_nested_attributes_for :project_users, allow_destroy: true
end
