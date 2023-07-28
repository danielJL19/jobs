class PostulationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job
    before_action :verify_postulation, only: %i[create]
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

    def verify_postulation
        if @job.postulations.exists?(user_id: current_user.id)
          redirect_to jobs_path, alert: 'Ya te has postulado a este trabajo'
        end
    end
      
end
