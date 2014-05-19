class VendorsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :set_user, only: [:new, :create]

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
    @vendor = Vendor.new(params.require(:vendor).permit(:name, :stall, :owner, :location, :type, :site, :comments))
    @vendor.owner = @current_user.name
    if @vendor.save
      flash[:success] = "Your entry has been created!"
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
      if @vendor.update_attributes(params.require(:vendor).permit(:name, :stall, :owner, :location, :type, :site, :comments))
        flash[:success] = "Your entry has been updated!"
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

  def set_user
    @user = current_user
  end
end
