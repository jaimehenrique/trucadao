class Site::Profile::AdsController < Site::ProfileController

  before_action :set_ad, only: [:edit, :update, :destroy]

  def index
    @ads = Ad.to_the(current_member)
  end

  def edit
      # Se Ad via before_action
  end

  def update
    if @ad.update(params_ad)
      redirect_to site_profile_ads_path, notice: "Anúncio atualizado com sucesso!"
    else
      render :edit
    end
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params_ad)
    @ad.member = current_member

    if @ad.save
      redirect_to site_profile_ads_path, notice: "Anúncio cadastrado com sucesso!"
    else
      render :new
    end
  end

  def destroy

    if @ad.destroy
      redirect_to site_profile_ads_path, notice: "Anúncio excluído com sucesso!"
    else
      render :index
    end
  end

    private

    def set_ad
      @ad = Ad.find(params[:id])
    end

    def params_ad
      params.require(:ad).permit(:id, :brand, :model, :kind_id, :price, :picture)
    end

end
