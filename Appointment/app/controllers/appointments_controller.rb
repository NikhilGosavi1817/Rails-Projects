class AppointmentsController < ApplicationController
    def perform
        @doctor = Doctor.find(params[:id])
        @appoint = Appointment.new()
    end

    def doct
        @doctor = Doctor.find(params[:id])
        @appoint = current_user.appointments.new(params.require(:appointment).permit(:date, :from, :to))
        # binding.pry
        if Appointment.exists?(date: @appoint.date) && !current_user.appointments.exists?(date: @appoint.date)
            @appoints=Appointment.where(date: @appoint.date)
            @appoints.each do |appoint|
                # binding.pry
                if @appoint.from.to_i<appoint.to.to_i
                    redirect_to doctors_path, notice: "Slot unavailable"
                    return;
                end
            end
            @doctor.appointments << @appoint
            redirect_to doctors_path, notice: "Appointment Created"
        elsif !Appointment.exists?(date: @appoint.date) && !current_user.appointments.exists?(date: @appoint.date)
            @doctor.appointments << @appoint
            redirect_to doctors_path, notice: "Appointment Created"
        else
            redirect_to doctors_path, notice: "can't create appointment twice a day"
        end
    end

    def params_appoint
        params.require(:appointment).permit(:date, :from, :to)
    end

    def index
        @appointments=Appointment.all
    end
end
# @appoint.from.to_i<=@appoints.first.to.to_i
# current_user.appointments.where(date: @appoint.date)
# if @appoint.created_at.strftime("%H")