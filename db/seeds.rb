require 'date'
require_relative './objectives_and_agendas.rb'
require_relative './transcript_summary_actions.rb'
puts "cleaning users, users, meetings, bookings and videos..."

User.destroy_all
Meeting.destroy_all
Booking.destroy_all
Video.destroy_all

now = DateTime.now
minutes = [0, 15, 30, 45, 60, 90]
start_of_month = DateTime.new(now.year, now.month, 1, 8, 0, 0)
end_of_month = (start_of_month >> 1) - 1

random_date_time_before_today = rand(start_of_month..now)
random_date_time_after_today = rand(now..end_of_month)

puts "creating users, videos, meetings, and bookings..."
30.times do
  user = User.create!(
    name: Faker::Name.name,
    password: "123456",
    email: Faker::Internet.email,
    job_title: Faker::Job.title,
    mobile: Faker::PhoneNumber.cell_phone
  )
  30.times do
    video = Video.create!(
      start_date_time: random_date_time_before_today,
      end_date_time: random_date_time_before_today + Rational(minutes.sample, 24 * 60),
      transcript: TRANSCRIPT,
      summary: SUMMARY,
      actions: ACTIONS
    )
    meeting_before_today = Meeting.new(
      start_date_time: random_date_time_before_today,
      end_date_time: random_date_time_before_today + Rational(minutes.sample, 24 * 60),
      title: TITLE.sample,
      location: "Room: #{Faker::Color.color_name}",
      objectives: OBJECTIVES.sample,
      agenda: AGENDAS.sample,
      video: video
    )
    Booking.create!(
      user: user,
      meeting: meeting_before_today,
      status: "accepted"
    )
    meeting_after_today = Meeting.new(
      start_date_time: random_date_time_after_today,
      end_date_time: random_date_time_after_today + Rational(minutes.sample, 24 * 60),
      title: TITLE.sample,
      location: "Room: #{Faker::Color.color_name}",
      objectives: OBJECTIVES.sample,
      agenda: AGENDAS.sample,
      video: video
    )
    Booking.create!(
      user: user,
      meeting: meeting_after_today,
      status: "accepted"
    )
  end
end
