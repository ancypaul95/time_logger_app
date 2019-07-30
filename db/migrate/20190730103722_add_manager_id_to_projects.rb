class AddManagerIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :manager, index: true
    add_foreign_key :projects, :users, column: :manager_id
  end
end
