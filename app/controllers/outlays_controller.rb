class OutlaysController < ApplicationController
	before_action :authenticate_user!

	def index
		@outlays = Outlay.where(:user_id => current_user.id)
	end

	def new
		@outlay = Outlay.new

		@areas = Area.all

		@payforms = Payform.all
	end

	def create
		@outlay = Outlay.new(outlay_params)
		@outlay.user_id = current_user.id

		if @outlay.save
      		redirect_to outlays_path, notice: 'Despesa cadastrada com sucesso.'
    	else
      		redirect_to outlay_path(:new), notice: "Erro ao gravar despesa :#{@outlay.errors.full_messages.join}"
    	end
	end

	def edit
		search_outlay
		
		@areas = Area.all

		@payforms = Payform.all
	end

	def update
		search_outlay
		valores = outlay_params
		if @outlay.update(valores)
  			flash[:notice] = "Despesa atualizada com sucesso"
  			redirect_to outlays_path
		else
  			#render action: "edit"
  			render :edit
		end
	end

	def destroy
	    id = params[:id]
	    if Outlay.destroy id
	    	flash[:notice] = "Despesa deletada"
	    	redirect_to outlays_path
	    end
	end
	
	def relatorio
		search_outlays
		@areas = Area.all
		@payforms = Payform.all
	end

	private
	def search_outlays
		@outlays = Outlay.where(:user_id => current_user.id)
	end

	def search_outlay
		@outlay = Outlay.find(params[:id], :joins => :areas)
	end

	def outlay_params
      params.require(:outlay).permit(:area_id, :payform_id, :description, :cost, :payment_day)
    end
end
