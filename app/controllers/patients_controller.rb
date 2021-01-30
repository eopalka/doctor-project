class PatientsController < ApplicationController

    def index
        @patients = Patient.all
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            redirect_to patient_path(@patient)
        else
            render :new
        end
    end

    def edit
        @patient = Patient.find(params[:id])
    end

    def update
        @patient = Patient.find(params[:id])
        @patient.update(patient_params)
        if @patient.valid?
            redirect_to patient_path
        else
            render :edit
        end
    end

    def destroy
        @patient = Patient.find(params[:id])
        @patient.destroy
        redirect_to patient_path
    end

    private
    
    def patient_params
        params.require(:patient).permit(:name, :age, :dob)
    end
end
