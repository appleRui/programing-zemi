class FortunesController < ApplicationController
  before_action :set_fortune, only: %i[ show edit update destroy ]

  # GET /fortunes or /fortunes.json
  def index
    @fortunes = Fortune.all
  end

  # GET /fortunes/1 or /fortunes/1.json
  def show
  end

  # GET /fortunes/new
  def new
    @fortune = Fortune.new
  end

  # GET /fortunes/1/edit
  def edit
  end

  # POST /fortunes or /fortunes.json
  def create
    @fortune = Fortune.new(fortune_params)

    respond_to do |format|
      if @fortune.save
        format.html { redirect_to @fortune, notice: "Fortune was successfully created." }
        format.json { render :show, status: :created, location: @fortune }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fortune.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fortunes/1 or /fortunes/1.json
  def update
    respond_to do |format|
      if @fortune.update(fortune_params)
        format.html { redirect_to @fortune, notice: "Fortune was successfully updated." }
        format.json { render :show, status: :ok, location: @fortune }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fortune.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fortunes/1 or /fortunes/1.json
  def destroy
    @fortune.destroy
    respond_to do |format|
      format.html { redirect_to fortunes_url, notice: "Fortune was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fortune
      @fortune = Fortune.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fortune_params
      params.require(:fortune).permit(:content, :tweet_id)
    end
end
