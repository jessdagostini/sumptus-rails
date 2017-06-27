class OutlaysController < ApplicationController
	# Criar actions edit, update, delete, area (para mostrar somente gastos da area) e
	# payform (para mostrar gastos com tal pagamento)
	def index
		@outlays = Outlay.order :id
	end

	def new
		@outlay = Outlay.new

		@areas = Area.all

		@payforms = Payform.all
	end

	def create
		@outlay = Outlay.new(outlay_params)

		if @outlay.save
      		redirect_to outlay_path(@outlay), notice: 'Comentário criado com sucesso.'
    	else
      		redirect_to outlay_path(:new), notice: "Erro ao gravar o comentário :#{@outlay.errors.full_messages.join}"
    	end
	end

	def show
		search_outlays
	end

	private
	def search_outlays
		@outlay = Outlay.find(params[:id])
	end

	def outlay_params
      params.require(:outlay).permit(:area_id, :payform_id, :description, :cost)
    end
end
