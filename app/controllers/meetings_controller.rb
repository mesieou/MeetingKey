class MeetingsController < ApplicationController

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to @meeting
    else
      render :new
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_date_time, :end_date_time, :tile, :description, :location, :objectives, :agenda)
  end
end
