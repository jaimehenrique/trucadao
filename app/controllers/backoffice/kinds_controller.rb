class Backoffice::KindsController < BackofficeController
  before_action :set_kind, only: [:edit, :update]

  def index
    @kinds = Kind.all
  end

  def new
    @kind = Kind.new
  end

  def create
    @kind = KindService.create(params_kind)
    unless @kind.errors.any?
          redirect_to backoffice_kinds_path,
          notice: "Kind (#{@kind.description}) successfully registered!"
    else
     render :new
    end
  end

  def edit
  end

  def update
    if @kind.update(params_kind)
      redirect_to backoffice_kinds_path,
      notice: "Kind (#{@kind.description}) successfully updated!"
    else
      render :edit
    end
  end

  private

    def set_kind
      @kind = Kind.find(params[:id])
    end

    def params_kind
      params.require(:kind).permit(:description)
    end
end
