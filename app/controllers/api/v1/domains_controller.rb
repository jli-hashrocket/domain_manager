module API
  module V1
    class DomainsController < ApplicationController
      protect_from_forgery except: :index
      respond_to :html, :json

      def index
        respond_with Domain.all
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
          params.require(:domain).permit(:hostname, :ip_address)
        end
    end
  end
end
