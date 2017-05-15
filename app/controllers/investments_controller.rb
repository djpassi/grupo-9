class InvestmentsController < ApplicationController

  def index
    @investments = Investment.all
  end


  def create
    @investment = Investment.new(investment_params)

    respond_to do |format|
     if @investment.save
       format.html do
         redirect_to project_path(@investment.project_id), notice: 'Investment was successfully created.'
       end
     else
       format.html { render :new, status: 422 }
       format.json { render json: @investment.errors, status: :unprocessable_entity }
     end
   end
  end

  private

  def investment_params
    params.require(:investment).permit(:amount).merge(user_id: current_user.id, project_id: session[:project_id])
  end


end
