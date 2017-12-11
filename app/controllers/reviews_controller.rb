class ReviewsController < ApplicationController
    before_action :set_review, only: [:destroy]

      @review = Review.new(review_params)
      @product = Product.find(params[:product_id])
      @review.product = @product
      @review.user = current_user
      if @review.save
        redirect_to @product, notice: 'Review was successfully created.'
      else
        render @product
      end

    def destroy
      @review.destroy
      redirect_to @review.product, notice: 'Review successfully deleted'
    end

    private

      def set_review
        @review = Review.find(params[:id])
      end

      def review_params
        params.require(:review).permit(:description)
      end
    end
