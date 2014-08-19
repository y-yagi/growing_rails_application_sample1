class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def merge_form
    @source_missing = false
    @target_missing = false
  end

  def do_merge
    source_id = params[:source_id]
    target_id = params[:target_id]

    @source_missing = true if source_id.blank?
    @target_missing = true if target_id.blank?

    if source_id.present? && target_id.present?
      source = Account.find(source_id)
      target = Account.find(target_id)
      Account.transaction do
      target.update_attributes!(credits: target.credits + source.credits)
        source.subscriptions.each do |subscription|
          subscription.update_attributes!(account: target)
        end

        AccountMailer.account_merge_notification(source, target).deliver
        source.destroy
      end
      redirect_to target
    else
      render 'merge_form'
    end
  end

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :email, :credits)
    end
end
