module API
  module V1
    class DomainsController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      respond_to :html, :json

      def index
        @domains = Domain.all
        respond_with @domains
      end

      def new
        @domain = Domain.new
      end

      def show
        @domain = Domain.find(params[:id])
        respond_with @domain
      end

      def edit
        @domain = Domain.find(params[:id])
        respond_with @domain
      end

      def create
        ip = Domain.get_ip(domain_params[:hostname])
        new_params = domain_params.merge(ip_address: ip)
        respond_with Domain.create(new_params)
      end

      def update
        @domain = Domain.find(params[:id])
        ip = Domain.get_ip(@domain.hostname)
        new_params = domain_params.merge(ip_address: ip)

        respond_with Domain.update(new_params)
      end

      def destroy
        @domain = Domain.find(params[:id])
        respond_with @domain.destroy
      end

      private
        def domain_params
          params.require(:domain).permit(:hostname, :ip_address, :account_id)
        end
    end
  end
end
