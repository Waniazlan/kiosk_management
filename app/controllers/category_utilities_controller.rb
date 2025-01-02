class CategoryUtilitiesController < ApplicationController
  layout "adminapp"  # Use the "adminapp" layout for all actions in this controller
  before_action :set_category_utility, only: %i[ show edit update destroy ]
  # GET /category_utility

  def index
    @category_utilities = if params[:search].present?
      CategoryUtility.where("name ILIKE :query", query: "%#{params[:search]}%")
    else
      CategoryUtility.all
    end
  end

  # GET /category_utility/:id
  def show
  end

  def new
    @category_utility = CategoryUtility.new
  end
  # GET /category_utilitys/:id/edit
  def edit
  end

  def create
    @category_utility = CategoryUtility.new(category_utility_params)

    respond_to do |format|
      if @category_utility.save
        format.html { redirect_to @category_utility, notice: "category utility was successfully created." }
        format.json { render :show, status: :created, location: @category_utility }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_utility.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category_utility.update(category_utility_params)
        format.html { redirect_to @category_utility, notice: "category utility was successfully updated." }
        format.json { render :show, status: :ok, location: @category_utility }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_utility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_utility/:id
  #
  def destroy
    @category_utility.destroy!

    respond_to do |format|
      format.html { redirect_to category_utilities_path, status: :see_other, notice: "category utility was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_utility
      @category_utility = CategoryUtility.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_utility_params
      params.require(:category_utility).permit(:name)
    end
end
