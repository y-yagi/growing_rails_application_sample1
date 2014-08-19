class AccountMergesController < ApplicationController
  def new
    build_merge
  end

  def create
    build_merge
    if @merge.save
      redirect_to @merge.target
    else
      render 'new'
    end
  end

  private
    def build_merge
      @merge ||= AccountMerge.new(account_merge_params)
    end

    def account_merge_params
      params.require(:account_merge).permit(:source_id, :target_id)
    end
end
