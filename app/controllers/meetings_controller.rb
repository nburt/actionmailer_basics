class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
    @conference_rooms = ConferenceRoom.all
  end

  def create
    @meeting = Meeting.new(name: params[:meeting][:name])
    @meeting.reservations.build(reservation_params)
    @conference_rooms = ConferenceRoom.all
    if @meeting.save
      # Add your mailer code here
      MeetingMailer.meeting_scheduled.deliver
      redirect_to meetings_path
    else
      render :new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:starts_ad, :conference_room_id)
  end
end