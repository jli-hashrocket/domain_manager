module API
  module V1
    class AccountsController < ApplicationController
      protect_from_forgery
      respond_to :html, :json

      def index
        @accounts = Account.all
        respond_with @accounts
      end

      def new
        @account = Account.new

      end

      def show
        @account = Account.find(params[:id])
        respond_with @account
      end

      def edit
        @account = Account.find(params[:id])
      end

      def create
        @account = Account.create(account_params)
        respond_with @account
      end

      def update
        @account = Account.update(account_params)
        respond_with @account
      end

      def destroy
        @account = Account.destroy(params[:id])
        respond_with @account
      end

      private
        def account_params
          params.require(:account).permit(:name)
        end
    end
  end
end
