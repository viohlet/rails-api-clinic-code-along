class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :update, :destroy]

  def index
    @patients = Patient.all
    # model names are always singular
    render json: @patients
  end

  def show
    # @patient = Patient.find(params[:id])
    render json: @patient
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      render json: @patient, status: :created
    # this if its to find out if method is truthy or falsy.
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  def update
    render json: @patient
    if @patient.update(patient_params)
      head :no_content
    # this if its to find out if method is truthy or falsy.
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # @patient = Patient.find(params[:id])
    if @patient.destroy
      head :no_content
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  private

  # set patient?
  def set_patient
    # this is a method^
    @patient = Patient.find(params[:id])
  end
  # patient_params - so we dont allow people to POST to anything. That params up
  # is the same as the one below. Only added some requirements

  def patient_params
    params.require(:patient).permit(:name, :sickness)
  end
end
