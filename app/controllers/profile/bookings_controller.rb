module Profile
  class BookingsController < ApplicationController
    before_action :authenticate_user!
     #si je suis un utilisateur lambda

     def new


      @offer = Offer.find(params[:booking][:offer_id])
      @offer = recipe.offers
      @booking = Booking.new
    end

    def create
      @offer = Offer.find(params[:booking][:offer_id])
      @booking = @offer.bookings.build(booking_params)
      @booking.user = current_user
      @booking.save
      if @booking.save
        redirect_to profile_offers_path
      else
        render :new
      end
    end

    def booking_params
      params.require(:booking).permit(:quantity, :offer_id)

    end

  end
end
