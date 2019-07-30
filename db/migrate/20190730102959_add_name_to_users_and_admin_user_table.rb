# frozen_string_literal: true

class AddNameToUsersAndAdminUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, limit: 25
    add_column :admin_users, :name, :string, limit: 25
  end
end
