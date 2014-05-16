class VendorsController < ApplicationController

  before_action :authenticate_user

  def index
    @vendors = Vendor.all.reverse
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
      flash[:success] = "Your entry has been created!"
      redirect_to vendors_path
    else
      render 'new'
    end
  end

  def edit
    if current_user.is_admin
    @vendor = Vendor.find(params[:id])
    end
  end

  def update
    @vendor = Vendor.find(params[:id])
      if @vendor.update_attributes(params.require(:vendor).permit(:name, :stall, :owner, :type, :comments))
        flash[:success] = "Your entry has been updated!"
        redirect_to vendors_path
      else
        render 'edit'
    end
  end

  def destroy
    if current_user.is_admin
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    Vendor.where(vendor_id: @vendor.id).destroy
    redirect_to vendors_path
  end
end
end
