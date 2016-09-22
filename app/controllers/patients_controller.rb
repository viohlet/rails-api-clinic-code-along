class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    # model names are always singular
    render json: @patients
  end

  def show
    @patient = Patient.find(params[:id])
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

  private

  # set patient?
  # patient_params - so we dont allow people to POST to anything. That params up
  # is the same as the one below. Only added some requirements

  def patient_params
    params.require(:patient).permit(:name, :sickness)
  end
end
