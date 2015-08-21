class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admins = Admin.all
    respond_with(@admins)
  end

  def show
    respond_with(@admin)
  end

  def new
    @admin = Admin.new
    respond_with(@admin)
  end

  def edit
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.save
    respond_with(@admin)
  end

  def update
    @admin.update(admin_params)
    respond_with(@admin)
  end

  def destroy
    @admin.destroy
    respond_with(@admin)
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:Username, :Password)
    end
end
