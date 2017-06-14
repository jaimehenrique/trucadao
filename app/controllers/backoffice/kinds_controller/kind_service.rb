class Backoffice::KindsController::KindService
  attr_accessor :kind

  def self.create(params_kind)
    @kind = Kind.new(params_kind)

    if @kind.valid?
      @kind.save!
    end

    @kind
  end
end
