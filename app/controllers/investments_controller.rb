class InvestmentsController < ApplicationController
  include Secured

  before_action :logged_in?
  before_action only: [:index, :destroy, :update, :edit] {valid_action(Investment.find_by(id:params[:id]).try(:user_id))}
  before_action :set_investment, only: [ :destroy, :edit, :update]

   def update
    respond_to do |format|
      if @investment.update(investment_params)
        format.html do
           redirect_back(fallback_location:root_path, notice: 'Investment was successfully updated.')
        end
        format.json { render :show, status: :ok, location: @investment }
      else
        format.html { render :edit }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
      end
    end


  def edit; end

  def index
      @investments = Investment.all
  end


  def create
      @investment = Investment.new(investment_params)
      respond_to do |format|
      if @investment.save
        format.html do
          project = Project.find(@investment.project_id)
          owner = User.find(project.user_id)
          investor = User.find(@investment.user_id)
          ExampleMailer.donation_email_owner(owner,project, @investment).deliver_later
          ExampleMailer.donation_email_investor(investor,project, @investment).deliver_later
          redirect_to project_path(@investment.project_id), notice: 'Investment was successfully created.'
        end
        format.js
      else
        format.html { render :new, status: 422 }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @investment.destroy
      flash[:success] = "Investment deleted"
      #redirect_to project_path(session[:project_id])
      #redirect_to :back
      redirect_back(fallback_location: root_path)
  end


  private

 def set_investment
   @investment = Investment.find(params[:id])
  end

  def investment_params
    params.require(:investment).permit(:amount).merge(user_id: current_user.id, project_id: session[:project_id])
  end

end
