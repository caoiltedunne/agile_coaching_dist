class RandomisationEntriesController < ApplicationController
  before_action :set_randomisation_entry_details

  # GET /randomisation_entries
  # GET /randomisation_entries.json
  def index
    @randomisation_entries = RandomisationEntry.all
  end

  # GET /randomisation_entries/1
  # GET /randomisation_entries/1.json
  def show
  end

  def show_random_match
  end  

  # GET /randomisation_entries/new
  def new
    @randomisation_entry = RandomisationEntry.new
    @randomisation_entry.randomisation_session = @randomisation_session
  end

  # GET /randomisation_entries/1/edit
  def edit
  end

  # POST /randomisation_entries
  # POST /randomisation_entries.json
  def create
    @randomisation_entry = RandomisationEntry.new(randomisation_entry_params)
    @randomisation_entry.randomisation_session = @randomisation_session
    last_internal_order = @randomisation_session.randomisation_entries.order(:interal_order).size
    @randomisation_entry.internal_order =(last_internal_order + 1)

    respond_to do |format|
      if @randomisation_entry.save
        format.html { redirect_to show_random_match_randomisation_session_randomisation_entry_path(@randomisation_session,@randomisation_entry), notice: 'Randomisation entry was successfully created.' }
        format.json { render :show, status: :created, location: @randomisation_entry }
      else
        format.html { render :new }
        format.json { render json: @randomisation_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /randomisation_entries/1
  # PATCH/PUT /randomisation_entries/1.json
  def update
    respond_to do |format|
      if @randomisation_entry.update(randomisation_entry_params)
        format.html { redirect_to @randomisation_entry, notice: 'Randomisation entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @randomisation_entry }
      else
        format.html { render :edit }
        format.json { render json: @randomisation_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /randomisation_entries/1
  # DELETE /randomisation_entries/1.json
  def destroy
    @randomisation_entry.destroy
    respond_to do |format|
      format.html { redirect_to randomisation_entries_url, notice: 'Randomisation entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_randomisation_entry_details
      @randomisation_session = RandomisationSession.find(params[:randomisation_session_id])
      @randomisation_entry = RandomisationEntry.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def randomisation_entry_params
      params.require(:randomisation_entry).permit(:object, :action, :randomisation_session_id,:randomisation_session)
    end
end
