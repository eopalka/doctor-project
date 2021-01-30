class AppointmentsController < ApplicationController

    def index
        @appointments = Appointment.all
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = Appointment.new(appointment_parms)
        if @appointment.save
            redirect_to appointment_path(@appointment)
        else
            render :new
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def update
        @appointment = Appointment.find(params[:id])
        if @appointment.update(appointment_parms)
            @appointment.valid?
            redirect_to appointment_path
        else 
            render :edit
        end
    end

    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        redirect_to appointment_path
    end

    private

    def appointment_params
        params.require(:appointment).permit(:datetime, :doctor_id, :patient_id)
    end
end
