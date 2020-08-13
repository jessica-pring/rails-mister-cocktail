class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end
end
