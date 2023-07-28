class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: %i[ show edit update destroy ]
  before_action except: [:index, :show] do
    authorize_request(["admin"])
  end
  # GET /jobs or /jobs.json
  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true)
    @postulations = Postulation.all
  end

  # GET /jobs/1 or /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = Job.new(job_params)
    @job.user = current_user
    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: "Job was successfully created." }

      else
        format.html { render :new, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: "Job was successfully updated." }

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:name, :description)
    end

    def verify_ofert_user
      unless @job == current_user
        return root_path
      end
    end
end
