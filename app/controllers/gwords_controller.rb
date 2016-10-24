class GwordsController < ApplicationController
  before_action :set_gword, only: [:show, :edit, :update, :destroy]

  # GET /gwords
  # GET /gwords.json
  def index
    @gwords = Gword.all
  end

  # GET /gwords/1
  # GET /gwords/1.json
  def show
  end

  # GET /gwords/new
  def new
    @gword = Gword.new
  end

  # GET /gwords/1/edit
  def edit
  end

  # POST /gwords
  # POST /gwords.json
  def create
    @gword = Gword.new(gword_params)

    respond_to do |format|
      if @gword.save
        format.html { redirect_to @gword, notice: 'Gword was successfully created.' }
        format.json { render :show, status: :created, location: @gword }
      else
        format.html { render :new }
        format.json { render json: @gword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gwords/1
  # PATCH/PUT /gwords/1.json
  def update
    respond_to do |format|
      if @gword.update(gword_params)
        format.html { redirect_to @gword, notice: 'Gword was successfully updated.' }
        format.json { render :show, status: :ok, location: @gword }
      else
        format.html { render :edit }
        format.json { render json: @gword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gwords/1
  # DELETE /gwords/1.json
  def destroy
    @gword.destroy
    respond_to do |format|
      format.html { redirect_to gwords_url, notice: 'Gword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gword
      @gword = Gword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gword_params
      params.require(:gword).permit(:word, :date)
    end
end
