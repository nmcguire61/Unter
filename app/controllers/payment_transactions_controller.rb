class PaymentTransactionsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_payment_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @payment_transactions = PaymentTransaction.all
  end

  def show
  end

  def new
    @journey = Journey.find(params[:journey_id])
    @payment_transaction = PaymentTransaction.new
    @payment_transaction.journey = @journey
  end

  def edit
  end

  def create
    @payment_transaction = PaymentTransaction.new(payment_transaction_params)
    @journey = Journey.find(params[:journey_id])
    @payment_transaction.journey = @journey
      @payment_transaction.journey_cost = @payment_transaction.journey.passengers.inject(0) {|sum, passenger| sum + passenger.price.to_f}
  respond_to do |format|
    if @payment_transaction.save
      format.html { redirect_to @journey, notice: 'PaymentTransaction was successfully created.' }
      format.json { render :show, status: :created, location: @payment_transaction }
    else
      format.html { render :new }
      format.json { render json: @payment_transaction.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @payment_transaction.update(payment_transaction_params)
      format.html { redirect_to @payment_transaction, notice: 'PaymentTransaction was successfully updated.' }
      format.json { render :show, status: :ok, location: @payment_transaction }
    else
      format.html { render :edit }
      format.json { render json: @payment_transaction.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
  @payment_transaction.destroy
  respond_to do |format|
    format.html { redirect_to payment_transactions_url, notice: 'PaymentTransaction was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private

def set_payment_transaction
  @payment_transaction = PaymentTransaction.find(params[:id])
end

def payment_transaction_params
  params.require(:payment_transaction).permit(:journey_id, :journey_cost, :profit)
end

end