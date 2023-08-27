class TransfersController < ApplicationController
    include ApplicationHelper
    def perform
        @benficary=Benficary.find(params[:id])
        @trans = Transfer.new
    end

    def transaction
        @benficary=Benficary.find(params[:id])
        @trans = current_user.transfers.new(params_trans)
        if @trans.amount<=current_user.funds
            @benficary.transfers << @trans
            current_user.funds = current_user.funds - @trans.amount
            @benficary.balance = @benficary.balance + @trans.amount
            current_user.save
            @benficary.save
            redirect_to perform_transfer_path(@benficary), notice: "Fund Transered"
        else
            redirect_to perform_transfer_path(@benficary), notice: "Not enough fund in account"
        end
    end

    def params_trans
        params.require(:transfer).permit(:amount)
    end

    def history
        @benficary = Benficary.find(params[:id])
        @history=@benficary.transfers
        @history=sorting_table(@history) if params[:sort].present?
        @history=@history.paginate(page: params[:page], per_page: 10)
    end

    def index
        @trans=current_user.transfers
        sort_trans(@trans) if params[:sort].present?
    end

    def sort_trans(trans)
        case params[:sort]
        when "account_number"
          @trans=@trans.sort_by { |trans| trans.benficary.account_number}
          @trans=@trans.reverse if params[:direction] == 'desc'
        when "name"
          @trans=@trans.sort_by { |trans| trans.benficary.name }
          @trans=@trans.reverse if params[:direction] == 'desc'
        else
          @trans = sorting_table(trans)
        end
      end
end
