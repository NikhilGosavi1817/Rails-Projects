class TendersController < ApplicationController
    def perform
        @project = Project.find(params[:id])
        @tender = Tender.new()
    end

    def tend
        @project = Project.find(params[:id])
        @tender = @project.tenders.new(params_tender)
        @project.tenders << @tender
        @project.increment!(:number_of_tenders)
        redirect_to projects_path(@project), notice: "Tender Created"
    end

    def params_tender
        params.require(:tender).permit(:company_name, :cost)
    end

    def reject
        @tender = Tender.find(params[:id])
    end

    def change
        @tender = Tender.find(params[:id])
        if @tender.update(change_params)
            @tender.status  = "rejected"
            @tender.save
            redirect_to project_path(@tender.project_id), notice: "Tender Rejected"
        end
    end

    def change_params
        params.require(:tender).permit(:note)
    end

    def accept
        @project = Project.find(params[:id])
        @tenders = @project.tenders.where.not(status: :rejected)
        a=[]
        @tenders.each do |tender|
            a.push(tender.cost)
        end
        @tender = @project.tenders.where(cost: a.min)
        @tender.update(status: :selected)
        @tenders = @tenders.where.not(status: :selected)
        @tenders.each do |tender|
            tender.status  = "closed"
            tender.save
        end
        @project.update(status: :finished)
        redirect_to project_path(@project), notice: "Tender Selected"
    end
end
