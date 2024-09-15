class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = current_user.notifications.includes(event: :record)
  end


  # def index
  #   @notifications = current_user.notifications.unread # Scope for unread notifications
  # end

  # def mark_as_read
  #   byebug
  #   notification = current_user.notifications.find(params[:id])
  #   notification.update(read_at: Time.current)

  #   redirect_to notification.to_notification.url || root_path
  # end

end
