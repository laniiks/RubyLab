class LabReportsController < ApplicationController
    def index
        @lab_report = LabReport.all
    end

    def new
        @lab_report = LabReport.new
    end

    def show
        @lab_report = LabReport.find(params[:id])
    end

    def create
        # render plain: params[:lab_reports].inspect
        @lab_reports = LabReport.new(lab_reports_params)


        if (@lab_reports.save)
            redirect_to @lab_reports
        else 
            render 'new'
        end
    end



    def edit
        @lab_reports = LabReport.find(params[:id])
    end

    def update
        @lab_reports = LabReport.find(params[:id])
        if (LabReport.find(params[:id]).update(lab_reports_params))
            redirect_to @lab_reports
        else 
            render 'edit'
        end
    end

    def destroy
        @lab_reports = LabReport.find(params[:id])

        @lab_reports.destroy
        redirect_to lab_reports_path
    end

    private def lab_reports_params
        params.required(:lab_reports).permit(:title, :description)
    end
end
