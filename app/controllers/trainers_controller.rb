class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all.order(:created_at)
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
  end

  def create
    trainer = Trainer.create(trainer_params)
    redirect_to "/trainers"
  end

private
  def trainer_params
    params.permit(:name, :age, :certified)
  end
end
