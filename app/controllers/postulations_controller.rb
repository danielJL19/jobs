class PostulationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job
    def create
        @postulation = @job.postulations.build(user_id: current_user.id)
        if @postulation.save
            redirect_to jobs_path, notice: "Te haz postulado satisfactoriamente"
        else
            redirect_to jobs_path, alert: "Hubo un error"
        end
    end

    def destroy

    end
    private 

    def set_job
        @job = Job.find(params[:id]) 
    end

    def postulation_params
        params.require(:postulation).permit(:job_id)
    end
    
end
