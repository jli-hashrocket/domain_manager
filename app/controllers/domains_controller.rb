class DomainsController < ApplicationController
  def index
    @domains = Domain.all
  end

  def new
    @domain = Domain.new
  end

  def show
    @domain = Domain.find(params[:id])
  end

  def create
    ip = Domain.get_ip(domain_params[:hostname])
    new_params = domain_params.merge(ip_address: ip)
    @domain = Domain.create(new_params)
    if @domain.save
      redirect_to @domain, notice: 'Domain was saved'
    else
      render action: 'new'
    end
  end

  def edit
    @domain = Domain.find(params[:id])
  end

  def update
    @domain = Domain.find(params[:id])
    ip = Domain.get_ip(@domain.hostname)
    new_params = domain_params.merge(ip_address: ip)

    if @domain.update(new_params)
      redirect_to @domain, notice: 'Domain was updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @domain = Domain.find(params[:id])
    if @doman.destroy
      redirect_to domains_url, notice: 'Domain was successfully deleted'
    end
  end

  private
    def domain_params
      params.require(:domain).permit(:hostname, :ip_address, :account_id)
    end
end
