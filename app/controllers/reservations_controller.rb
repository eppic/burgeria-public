class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
    @available_tables = Table.all
    @business_hours = BusinessHour.all
  end

  def show
  end

  def new
    @reservation = Reservation.new
    @available_tables = Table.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to @reservation, notice: 'Deine Reservierung wurde erstellt!'
    else
      @available_tables = Table.all
      render :new
    end
  end

  def edit
    @available_tables = Table.all
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: 'Deine Reservierung wurde aktualisiert'
    else
      @available_tables = Table.all
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    flash[:notice] = "Deine Reservierung wurde gelöscht."
    redirect_to reservations_path, status: :see_other
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :reservation_time, :name, :email, :table_id)
  end
end