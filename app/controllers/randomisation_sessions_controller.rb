class RandomisationSessionsController < ApplicationController
  before_action :set_randomisation_session, only: [:show, :edit, :update, :destroy, :join]

  # GET /randomisation_sessions
  # GET /randomisation_sessions.json
  def index
    @randomisation_sessions = RandomisationSession.all
  end

  # GET /randomisation_sessions/1
  # GET /randomisation_sessions/1.json
  def show
  end

  # GET /randomisation_sessions/new
  def new
    @randomisation_session = RandomisationSession.new
  end

  # GET /randomisation_sessions/1/edit
  def edit
  end

  # POST /randomisation_sessions
  # POST /randomisation_sessions.json
  def create
    @randomisation_session = RandomisationSession.new(randomisation_session_params)

    respond_to do |format|
      if @randomisation_session.save
        format.html { redirect_to @randomisation_session, notice: 'Randomisation session was successfully created.' }
        format.json { render :show, status: :created, location: @randomisation_session }
      else
        format.html { render :new }
        format.json { render json: @randomisation_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /randomisation_sessions/1
  # PATCH/PUT /randomisation_sessions/1.json
  def update
    respond_to do |format|
      if @randomisation_session.update(randomisation_session_params)
        format.html { redirect_to @randomisation_session, notice: 'Randomisation session was successfully updated.' }
        format.json { render :show, status: :ok, location: @randomisation_session }
      else
        format.html { render :edit }
        format.json { render json: @randomisation_session.errors, status: :unprocessable_entity }
      end
    end
  end

  def join
    redirect_to new_randomisation_session_randomisation_entry_path(@randomisation_session)
  end  

  # DELETE /randomisation_sessions/1
  # DELETE /randomisation_sessions/1.json
  def destroy
    @randomisation_session.destroy
    respond_to do |format|
      format.html { redirect_to randomisation_sessions_url, notice: 'Randomisation session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_randomisation_session
      @randomisation_session = RandomisationSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def randomisation_session_params
      params.require(:randomisation_session).permit(:name)
    end
end
