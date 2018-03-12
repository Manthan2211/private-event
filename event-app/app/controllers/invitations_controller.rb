class InvitationsController < ApplicationController
  
  def create
    @event = Event.find(params[:attended_event_id])
    current_user.attend(@event)
    respond_to do |format|
      format.html { render :controller => 'events', :action => 'index'  }
      format.js{render inline: "location.reload()"}
    end
  end

  def destroy
    @event = Invitation.find(params[:id]).attended_event
    current_user.unattend(@event)
    respond_to do |format|
      format.html { render :controller => 'events', :action => 'index'  }
      format.js {render inline: "location.reload()"}

    end
  end
end
