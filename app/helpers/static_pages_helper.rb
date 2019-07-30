# frozen_string_literal: true

module StaticPagesHelper
  def get_username
    current_user.name ? current_user.name.humanize : current_user.role.humanize
  end
end
