# Patients Controller
class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all

    render json: @patients
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    render json: @patient
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      render json: @patient, status: :created, location: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    if @patient.update(patient_params)
      head :no_content
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy

    head :no_content
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:title, :author)
  end

  private :set_patient, :patient_params
end
