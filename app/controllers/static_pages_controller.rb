class StaticPagesController < ApplicationController
	before_action :signed_in_user, only: [:map]
	
	def map
		@hash = current_user.get_locations
		#Gmaps4rails.build_markers(current_user.get_locations) do |location,marker|
			#marker_picture = "assets/#{location.location_type}.png"
			#marker.lat location.latitude
			#marker.lng location.longitude
			#marker.picture({
			#	"url" => marker_picture,
			#	"width" => 36,
			#	"height" => 36
			#})
			#marker.infowindow render_to_string(
			#:partial => "/static_pages/marker_info_window", 
			#:locals => { :location => location })
		#end
	end

	def contact
	end
	
	def about
	end
end
