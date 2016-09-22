class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    # model names are always singular
    render json: @patients
  end
end
