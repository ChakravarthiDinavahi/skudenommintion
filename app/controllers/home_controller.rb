class HomeController < ApplicationController
  require 'csv'

  def index

  end

  def denomination

  end

  def proceesing
    respond_to do |format|
    if params[:attachment].present?
      file=params[:attachment]
      arrays = CSV.read(file.path)
      result=Denomination.get_combination(arrays)
      @denomination=Denomination.new
      @denomination.sku_denomination=params[:denomination].to_i
      @denomination.sku_combination=result
      @denomination.save
      format.html {render :combination}
    end
  end
end

  def combination

  end

end
