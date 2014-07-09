class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def show
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.create(account_params)
    if @account.save
      redirect_to @account, notice: 'Account was saved'
    else
      render action: 'new'
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      redirect_to @accounts_url, notice: 'Account was updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:id])
    if @account.destroy
      redirect_to accounts_url, notice: 'Account was successfully deleted'
    end
  end

  private
    def account_params
      params.require(:account).permit(:name)
    end
end
