class Site::KindsController < SiteController

  def show
      @kinds = Kind.order_by_description
      @ads = Ad.where_kind(params[:id])
  end

end
