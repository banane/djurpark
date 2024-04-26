class HabitatsController < ApplicationController
  before_action :set_habitat, only: %i[ show update destroy ]

  # GET /habitats
  def index
    @habitats = Habitat.all

    render json: @habitats
  end

  # GET /habitats/1
  def show
    render json: @habitat
  end

  # POST /habitats
  def create
    @habitat = Habitat.new(habitat_params)

    if @habitat.save
      render json: @habitat, status: :created, location: @habitat
    else
      render json: @habitat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /habitats/1
  def update
    if @habitat.update(habitat_params)
      render json: @habitat
    else
      render json: @habitat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /habitats/1
  def destroy
    @habitat.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habitat
      @habitat = Habitat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def habitat_params
      params.require(:habitat).permit(:descriptors)
    end
end
