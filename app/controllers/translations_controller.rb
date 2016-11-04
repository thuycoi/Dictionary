class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :edit, :update, :destroy]

  # GET /translations
  # GET /translations.json
  def index
    if params[:search].blank?
      # @gwords = Gword.where(["entry LIKE ?","%#{params[:search]}%"])
      @translations = Translation.all
      # @translations = Translation.joins("Left JOIN 'gwords' ON gwords.id = translations.gword_id").where(["gword.entry = ?", "%#{params[:search]}%"])
    else
      # @gwords = Gword.all
      # @gwords = @gwords.search(params[:search]
      @gwords = Gword.joins("LEFT JOIN Translations ON Translations.gword_id= gwords.id").where(["gwords.entry = ?", "#{params[:search]}"])
    end
  end


  # GET /translations/1
  # GET /translations/1.json
  def show
  end

  # GET /translations/new
  def new
    @translation = Translation.new
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations
  # POST /translations.json
  def create
    @translation = Translation.new(translation_params)

    respond_to do |format|
      if @translation.save
        format.html { redirect_to @translation, notice: 'Der Eintrag wurde erfolgreich angelegt.' }
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translations/1
  # PATCH/PUT /translations/1.json
  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to @translation, notice: 'Der Eintrag wurde erfolgreich bearbeitet.' }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy
    respond_to do |format|
      format.html { redirect_to translations_url, notice: 'Der Eintrag wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_params
      params.require(:translation).permit(:explain, :like, :gword_id, :vword_id)
    end
end
