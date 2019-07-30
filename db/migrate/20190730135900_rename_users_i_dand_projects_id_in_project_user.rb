class RenameUsersIDandProjectsIdInProjectUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :project_users, :users
    add_reference :project_users, :user, foreign_key: true
    remove_reference :project_users, :projects
    add_reference :project_users, :project, foreign_key: true
  end
end
