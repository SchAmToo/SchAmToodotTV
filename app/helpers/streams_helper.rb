module StreamsHelper
	
	def pause_or_play(stream)
		if stream.is_stream_live
			return "<i class = 'glyphicon glyphicon-play' ></i>".html_safe
		else
			return "<i class = 'glyphicon glyphicon-pause' ></i>".html_safe
		end
	end
end

#"<i class = 'glyphicon glyphicon-play' ></i>".html_safe