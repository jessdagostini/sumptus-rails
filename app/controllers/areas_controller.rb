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
			redirect_to areas_path, notice: 'Pagamento criado com sucesso.'
		else
			redirect_to new_area_path, notice: "Erro ao gravar o pagamento :#{@area.errors.full_messages.join}"
		end
	end

	def edit
		busca_area
	end

	def update
		busca_area
		valores = area_params
		if @area.update(valores)
  			flash[:notice] = "Produto atualizado com sucesso"
  			redirect_to areas_path
		else
  			#render action: "edit"
  			render :edit
		end
	end

	def destroy
	    id = params[:id]
	    Area.destroy id
	    redirect_to areas_path
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

	# Criar as actions new, create, edit, update e delete
end
