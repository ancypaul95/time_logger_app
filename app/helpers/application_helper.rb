module ApplicationHelper

  def manager_or_employee
    current_user.manager? || current_user.employee?
  end
end
