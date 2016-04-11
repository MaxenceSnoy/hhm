class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update,  :destroy]
  
  def index
    @contract = Contract.find(params[:contract_id])
  	@costs = Cost.all
  end

  def show
    @contract = Contract.find(params[:contract_id])
  end

  def new
  end

  def edit
    @contract = Contract.find(params[:contract_id])
  end
  def update
    @contract = Flat.find(params[:contract_id])

    respond_to do |format|
      if @cost.update(cost_params)
        format.html { redirect_to contract_cost_path(@contract.id, @cost.id), notice: 'Charges were successfully updated.' }
        format.json { render :show, status: :ok, location: @cost }
      else
        format.html { render :edit }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost
      @cost = Cost.find(params[:id])
    end

    def cost_params
      params.require(:cost).permit(:start_month_year, :end_month_year, :owner_charge, :renter_charge_private,
        :electricity, :property_mngt_cost, :cleaning_maintenance, :elevator, :water, :heating)
    end
end
