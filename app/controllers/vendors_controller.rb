class VendorsController < ApplicationController

  before_action :authenticate_user

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params.require(:vendor).permit(:name, :stall, :owner, :type, :comments))
    if @vendor.save
      redirect_to vendors_path
    else
      render 'new'
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
       if @vendor.update_attributes(params.require(:vendor).permit(:name, :stall, :owner, :type, :comments))
      redirect_to vendors_path
    else
      render 'edit'
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    Vendor.where(vendor_id: @vendor.id).destroy
    redirect_to vendors_path
  end
end
