class EventsController < ApplicationController
  before_action :correct_user,only: :destroy
  

    def index
      @events = Event.paginate(:page => params[:page], :per_page => 1)
    end

    def show
      @event = Event.find_by(id: params[:id])
    end
    
    def create
      @event = current_user.events.build(event_params)

      if @event.save
         flash[:success] = "event created!"
         redirect_to root_url
        else
            @feed_items = []
            render 'pages/home'
      end
    end

    def destroy
      @event.destroy
      flash[:success] = "Micropost deleted"
      redirect_to request.referrer || root_url
    end

    private

    def event_params
      params.require(:event).permit(:title,:description,:location,:date)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end
end
