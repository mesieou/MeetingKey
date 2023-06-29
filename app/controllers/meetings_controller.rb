class MeetingsController < ApplicationController

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to meeting_path(@meeting), notice: "Meeting was successfully created." }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end

    if @meeting.errors.any?
      @meeting.errors.full_messages.each do |message|
        puts message
      end
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_date_time, :end_date_time, :title, :description, :location, :objectives, :agenda)
  end
end
