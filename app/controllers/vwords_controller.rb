class VwordsController < ApplicationController
  before_action :set_vword, only: [:show, :edit, :update, :destroy]

  # GET /vwords
  # GET /vwords.json
  def index
    @vwords = Vword.all
  end

  # GET /vwords/1
  # GET /vwords/1.json
  def show
  end

  # GET /vwords/new
  def new
    @vword = Vword.new
  end

  # GET /vwords/1/edit
  def edit
  end

  # POST /vwords
  # POST /vwords.json
  def create
    @vword = Vword.new(vword_params)

    respond_to do |format|
      if @vword.save
        format.html { redirect_to @vword, notice: 'Vword was successfully created.' }
        format.json { render :show, status: :created, location: @vword }
      else
        format.html { render :new }
        format.json { render json: @vword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vwords/1
  # PATCH/PUT /vwords/1.json
  def update
    respond_to do |format|
      if @vword.update(vword_params)
        format.html { redirect_to @vword, notice: 'Vword was successfully updated.' }
        format.json { render :show, status: :ok, location: @vword }
      else
        format.html { render :edit }
        format.json { render json: @vword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vwords/1
  # DELETE /vwords/1.json
  def destroy
    @vword.destroy
    respond_to do |format|
      format.html { redirect_to vwords_url, notice: 'Vword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vword
      @vword = Vword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vword_params
      params.require(:vword).permit(:wort)
    end
end
