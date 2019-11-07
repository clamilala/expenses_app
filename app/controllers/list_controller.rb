class ListController < ApplicationController
  def top
    @payments = Payment.all.order(created_at: :desc)
  end
end
