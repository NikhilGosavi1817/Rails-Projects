class BenficariesController < ApplicationController
    include ApplicationHelper
    def new
        @benficary = Benficary.new()
    end

    def create
        @benficary = Benficary.new(params_ben)
        @account=Account.all
        if Account.exists?(account_number: @benficary.account_number)
            current_user.benficaries << @benficary
            redirect_to new_benficary_path, notice: "Benficary Created"
        else
            redirect_to new_benficary_path, notice: "Account not registered"
        end
    end

    def params_ben
        params.require(:benficary).permit(:account_number, :name, :balance)
    end

    def index
        @benficaries=Benficary.all
        @benficaries=sorting_table(@benficaries) if params[:sort].present?
        @benficaries=@benficaries.paginate(page: params[:page], per_page: 10)
    end
end
