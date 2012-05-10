module ApplicationHelper

	def diahora(d)
		begin
			return d.strftime("%m/%d/%y %H:%M")
		rescue
			return
		end
	end
end