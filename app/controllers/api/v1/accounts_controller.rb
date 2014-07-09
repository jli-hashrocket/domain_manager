module API
  module V1
    class AccountsController < ApplicationController
      protect_from_forgery except: :index
      respond_to :html, :json

      def index
        respond_with Account.all
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
        respond_with Account.create(account_params)
      end

      def update
        respond_with Account.update(account_params)
      end

      def destroy
        respond_with Account.destroy(params[:id])
      end

      private
        def account_params
          params.require(:account).permit(:name)
        end
    end
  end
end
