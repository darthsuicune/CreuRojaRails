module VehicleServicesHelper
	#Service: Service for which the vehicles are requested
	#Assignment: Services for which the vehicle is already assigned
	def get_available_vehicles(service)
		availables = []
		Vehicle.all.each do |vehicle|
			#If the service already has the vehicle, ignore
			unless service.vehicles.include?(vehicle)
				is_available = true
				vehicle.services.each do |assignment|
					#If the assigned services match in time with the service wanted, mark it as not available
					if (service.base_time < assignment.end_time && service.end_time > assignment.base_time)
						is_available = false
					end
				end
				tag = "#{vehicle.indicative}, #{vehicle.license}"
				availables << [tag, vehicle.id] if is_available
			end
		end
		availables
	end
end
