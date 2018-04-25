class EventsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    if !session[:id]
      redirect_to '/users'
    else
      @user = User.find(session[:id])
      @yourevent = Event.where(host_id: session[:id]).order(sort_column + " " + sort_direction)
      @other_event = Event.where.not(host_id: session[:id]).order(sort_column + " " + sort_direction)
      @attending = Attendee.all
    end
  end

  def show
    if !session[:id]
      redirect_to '/users'
    else
      @user = User.find(session[:id])
      @event = Event.find(params[:id])
      @comment = Comment.where(event_id:@event.id)
    end
  end

  def create
    if !session[:id]
      redirect_to '/users'
    else
      @event = Event.new(events_params)
      @event.host_id = session[:id]
      if @event.save
        redirect_to :root
      else
        flash[:errors] = @event.errors.full_messages
        redirect_to :back
      end
    end
  end

  def edit
    if !session[:id]
      redirect_to '/users'
    else
      @event = Event.find(params[:id])
    end
  end

  def update
    if !session[:id]
      redirect_to '/users'
    else
      @event = Event.find(params[:id])
      if @event.update(events_params)
        redirect_to :root
      else
        flash[:errors] = @event.errors.full_messages
        redirect_to :back
      end
    end
  end

  def destroy
    if !session[:id]
      redirect_to '/users'
    else
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to :back
    end 
  end

  private
    def events_params
      params.require(:event).permit(:name, :date, :time, :city, :state)
    end

    def sort_column
      Event.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
