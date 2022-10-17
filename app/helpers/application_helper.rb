# frozen_string_literal: true

module ApplicationHelper
  def insert_login_logout_function
    user_signed_in? ? render(partial: 'shared/logout_function') : render(partial: 'shared/login_function')
  end
end
