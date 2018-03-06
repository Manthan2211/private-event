module EventsHelper

	def past?
		@event.date < Time.now
	end
end
