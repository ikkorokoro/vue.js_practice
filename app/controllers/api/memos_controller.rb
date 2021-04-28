class Api::MemosController < ApplicationController
  def index
    @memos = Memo.order('created_at DESC')
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      render :show, status: :created #保存成功
    else
      render json: @memo.errors, status: :unprocessable_entity #unprocessable_entity バリデーションエラーの場合に返す
    end
  end

  private
  def memo_params
  params.permit(:title, :desctiption)
  end
end
