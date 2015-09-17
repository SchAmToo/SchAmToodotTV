require 'open-uri'
class Stream < ActiveRecord::Base


end

# https://api.twitch.tv/kraken/streams/milktea <--- stream: null == offline
#		twitch = open("https://api.twitch.tv/kraken/streams/shaboozey")
#		regextwitch = pullviewers.text.match(/"viewers":(\d*?),/)[1]
