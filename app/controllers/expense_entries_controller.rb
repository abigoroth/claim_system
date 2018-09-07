class ExpenseEntriesController < ApplicationController
  before_action :set_expense_entry, only: [:show, :edit, :update, :destroy]

  # GET /expense_entries
  # GET /expense_entries.json
  def index
    @expense_entries = ExpenseEntry.all
  end

  # GET /expense_entries/1
  # GET /expense_entries/1.json
  def show
  end

  # GET /expense_entries/new
  def new
    @expense_entry = ExpenseEntry.new
  end

  # GET /expense_entries/1/edit
  def edit
  end

  # POST /expense_entries
  # POST /expense_entries.json
  def create
    @expense_entry = ExpenseEntry.new(expense_entry_params)

    respond_to do |format|
      if @expense_entry.save
        format.html { redirect_to @expense_entry, notice: 'Expense entry was successfully created.' }
        format.json { render :show, status: :created, location: @expense_entry }
      else
        format.html { render :new }
        format.json { render json: @expense_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_entries/1
  # PATCH/PUT /expense_entries/1.json
  def update
    respond_to do |format|
      if @expense_entry.update(expense_entry_params)
		total = @user_monthly_approval.expense_entries.map{|x| x.total_expenses}.sum
		Rails.logger.debug("Total#{total}")
		@user_monthly_approval.update_attributes(grand_total: total)
        format.html { redirect_to @expense_entry, notice: 'Expense entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_entry }
      else
        format.html { render :edit }
        format.json { render json: @expense_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_entries/1
  # DELETE /expense_entries/1.json
  def destroy
    @expense_entry.destroy
    respond_to do |format|
      format.html { redirect_to user_monthly_approval_path(params[:user_monthly_approval_id]), notice: 'Expense entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_entry
      @expense_entry = ExpenseEntry.find(params[:id])
	  @user_monthly_approval = UserMonthlyApproval.find(@expense_entry.user_monthly_approval_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_entry_params
      params.require(:expense_entry).permit(:created, :description, :travel_distance, :travel_price, :food_price, :parking_price, :toll_price, :fixed_asset_price, :misc_price)
    end
end
