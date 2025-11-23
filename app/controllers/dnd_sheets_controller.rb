class DndSheetsController < ApplicationController
  before_action :set_dnd_sheet, only: %i[ show edit update destroy ]

  # GET /dnd_sheets or /dnd_sheets.json
  def index
    @dnd_sheets = DndSheet.all
  end

  # GET /dnd_sheets/1 or /dnd_sheets/1.json
  def show
  end

  # GET /dnd_sheets/new
  def new
    @dnd_sheet = DndSheet.new
  end

  # GET /dnd_sheets/1/edit
  def edit
  end

  # POST /dnd_sheets or /dnd_sheets.json
  def create
    @dnd_sheet = DndSheet.new(dnd_sheet_params)

    respond_to do |format|
      if @dnd_sheet.save
        format.html { redirect_to @dnd_sheet, notice: "Dnd sheet was successfully created." }
        format.json { render :show, status: :created, location: @dnd_sheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dnd_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dnd_sheets/1 or /dnd_sheets/1.json
  def update
    respond_to do |format|
      if @dnd_sheet.update(dnd_sheet_params)
        format.html { redirect_to @dnd_sheet, notice: "Dnd sheet was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @dnd_sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dnd_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dnd_sheets/1 or /dnd_sheets/1.json
  def destroy
    @dnd_sheet.destroy!

    respond_to do |format|
      format.html { redirect_to dnd_sheets_path, notice: "Dnd sheet was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dnd_sheet
      @dnd_sheet = DndSheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dnd_sheet_params
      params.require(:dnd_sheet).permit(:name, :folk, :gender)
    end
end
