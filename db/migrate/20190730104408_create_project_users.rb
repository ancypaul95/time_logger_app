# frozen_string_literal: true

class CreateProjectUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_users do |t|
      t.float :time_log
      t.boolean :validate_log, default: false
      t.references :projects, foreign_key: true
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
