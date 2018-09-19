class UserMonthlyApprovalsController < ApplicationController
  before_action :set_user_monthly_approval, only: [:show, :add_expense, :edit, :update, :destroy, :update_status, :update_accept, :update_reject]

  # GET /user_monthly_approvals
  # GET /user_monthly_approvals.json
  def index
    @user_monthly_approvals = UserMonthlyApproval.all
  end

  # GET /user_monthly_approvals/1
  # GET /user_monthly_approvals/1.json
  def show
	@expense_entries = @user_monthly_approval.expense_entries
	@file_uploads = @user_monthly_approval.file_uploads
	@file_upload = @user_monthly_approval.file_uploads.build
	#total = @user_monthly_approval.expense_entries.map{|x| x.total_expenses}.sum
	#Rails.logger.debug("Total Expense#{total}")
	#@user_monthly_approval.update_attributes(grand_total: total)
	
  end
  
  def add_expense
	@expense = @user_monthly_approval.expense_entries.create!
	redirect_to @user_monthly_approval
	
  end
  
  def update_status
	@user_monthly_approval.update(status: "Submitted")
	redirect_to @user_monthly_approval
  end
  
  def update_accept
	@user_monthly_approval.update(status: "Accepted")
	redirect_to @user_monthly_approval
  end

  def update_reject
	@user_monthly_approval.update(status: "Rejected")
	redirect_to @user_monthly_approval
  end

  # GET /user_monthly_approvals/new
  def new
	if params[:month] and params[:year]
		@user_monthly_approval = UserMonthlyApproval.find_or_create_by(staff_id: current_staff.id ,created: "1-#{params[:month]}-#{params[:year]}")
	else
		@user_monthly_approval = UserMonthlyApproval.find_or_create_by(staff_id: current_staff.id ,created: "1-#{Time.now.month}-#{Time.now.year}")
	end
	if @user_monthly_approval.expense_entries.empty?
		5.times.each do
			@user_monthly_approval.expense_entries.create
		end
	end 
	@file_uploads = @user_monthly_approval.file_uploads.all
	@file_upload = @user_monthly_approval.file_uploads.build

	exist_data = current_staff.user_monthly_approvals.where(created_at: Date.today.beginning_of_month.midnight..Date.today.end_of_month.end_of_day, staff_id: current_staff.id).exists?
	
	if exist_data
		redirect_to claims_path, notice: "Claim for this month have existed. Not allowed to make another claim"
	end
  end

  # GET /user_monthly_approvals/1/edit
  def edit
	@file_uploads = @user_monthly_approval.file_uploads.all
	@file_upload = @user_monthly_approval.file_uploads.build
  end

  # POST /user_monthly_approvals
  # POST /user_monthly_approvals.json
  def create
    @user_monthly_approval = UserMonthlyApproval.new(user_monthly_approval_params)
	@user_monthly_approval.staff_id = current_staff.id
    respond_to do |format|
      if @user_monthly_approval.save
        format.html { redirect_to @user_monthly_approval, notice: 'User monthly approval was successfully created.' }
        format.json { render :show, status: :created, location: @user_monthly_approval }
      else
        format.html { render :new }
        format.json { render json: @user_monthly_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_monthly_approvals/1
  # PATCH/PUT /user_monthly_approvals/1.json
  def update
    respond_to do |format|
      if @user_monthly_approval.update(user_monthly_approval_params)
        format.html { redirect_to @user_monthly_approval, notice: 'User monthly approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_monthly_approval }
      else
        format.html { render :edit }
        format.json { render json: @user_monthly_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_monthly_approvals/1
  # DELETE /user_monthly_approvals/1.json
  def destroy
    @user_monthly_approval.destroy
    respond_to do |format|
      format.html { redirect_to claims_path, notice: 'User monthly approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_monthly_approval
      @user_monthly_approval = UserMonthlyApproval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_monthly_approval_params
      params.require(:user_monthly_approval).permit(:staff_id, :created, :status ,expense_entries_attributes: [:id, :created, :description, :travel_distance, :travel_price, :food_price, :parking_price, :toll_price, :fixed_asset_price, :misc_price, :_destroy])
    end
end
