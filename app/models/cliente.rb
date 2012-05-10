class Cliente < ActiveRecord::Base
	has_many :tareas
	has_many :ventas
	has_many :citas

	def self.filtrar(search)  
	  if search  
	    where('nombre LIKE ? OR 
	    	   ciudad LIKE ? OR
	    	   cp LIKE ? OR
	    	   direccion LIKE ?',
	    	    "%#{search}%","%#{search}%","%#{search}%","%#{search}%")
	  else  
	    scoped
	  end  
	end 

end
