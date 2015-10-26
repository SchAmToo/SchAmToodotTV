module StreamsHelper
	
	def pause_or_play(stream)
		if Stream.live_streams.include?(stream)
			return "<i class = 'glyphicon glyphicon-play' ></i>".html_safe
		else
			return "<i class = 'glyphicon glyphicon-pause' ></i>".html_safe
		end
	end
end

#"<i class = 'glyphicon glyphicon-play' ></i>".html_safe