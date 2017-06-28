class AreasController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@areas = Area.order :id
	end

	def new
		@area = Area.new
	end

	def create
		@area = Area.new(area_params)

		if @area.save
			flash[:notice] = "Área criada com sucesso"
			redirect_to areas_path
		else
			flash[:notice] = "Erro ao gravar área :#{@area.errors.full_messages.join}"
			redirect_to new_area_path
		end
	end

	def edit
		busca_area
	end

	def update
		busca_area
		valores = area_params
		if @area.update(valores)
  			flash[:notice] = "Área atualizada com sucesso"
  			redirect_to areas_path
		else
  			#render action: "edit"
  			render :edit
		end
	end

	def destroy
	    id = params[:id]
	    if Area.destroy id
	    	flash[:notice] = "Área deletada"
	    	redirect_to areas_path
	    end
	end

	def show
		busca_area
	end

	private	
	def busca_area
		@area = Area.find(params[:id])
	end

	def area_params
      params.require(:area).permit(:area)
    end
end
