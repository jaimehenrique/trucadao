class Site::HomeController < SiteController

  def index
    @kinds = Kind.order_by_description
    @ads = Ad.descending_order(15)
  end

end
