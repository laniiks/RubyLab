class MarksController < ApplicationController
    def create
        @lab_report = LabReport.find(params[:lab_report_id])
        @mark = @lab_report.marks.create(mark_params)
    end

    private def mark_params
        params.required(:mark).permit(:points, :letter)
    end
end
