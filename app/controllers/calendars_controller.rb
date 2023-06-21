class CalendarsController < ApplicationController
  def view
    @user = User.find_by(id: params[:user_id]) || current_user
    @meetings = Meeting.where(
      start_date_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
  end
end
