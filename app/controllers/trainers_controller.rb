class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all.order(:created_at)
  end

  def show
    @trainer = Trainer.find(params[:id])
  end
end
