# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role, :name

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :role do |user|
      user.role.capitalize
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :role
      row :created_at
    end
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :role, as: :select, collection: User.roles.keys
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
