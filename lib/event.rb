require 'time'
require 'pry'

class Event
	attr_accessor :start_date, :length, :title, :attendees

	def initialize(start_date, length, title, attendees)
		@start_date = Time.parse(start_date)
		@length = length.to_i
		@title = title
		@attendees = attendees
	end

	def postpone_24h
		@start_date += 60*60*24
	end

	def end_date
		@end_date = @start_date + 60*@length
	end

	def is_past?
		return @start_date < Time.now ? true : false
	end

	def is_future?
		!self.is_past?
	end

	def is_soon?
	 (@start_date - Time.now)/60 <= 30 ? true : false if is_future?
	end

	def to_s
		puts "Titre : #{@title}"
		puts "Date de début : #{@start_date}"
		puts "Durée : #{@length} minutes"
		puts "Invités : #{@attendees.join(', ')}"
	end

	def self.find_by_email(email)
		@email = email
		puts "Voici l'utilisateur correspondant à cet email : #{@email.self}"
	end

end

e = Event.new("2019-01-13 09:00", '10', "standup quotidien", ['julie@julie.com', 'jean@jean.com'])
puts e.end_date