require 'optimizely'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def optimizely_user
    session[:optimizely_user] ||= SecureRandom.hex
  end

  def optimizely_client 
    url = 'https://cdn.optimizely.com/json/9030030860.json'
    datafile = HTTParty.get(url).body
    Optimizely::Project.new(datafile)
  end

  protected

  def optimizely_variation
    optimizely_client.activate('tabish_experiment', optimizely_user);

    # TO DO: NEED TO INCLUDE AUDIENCE TARGETING
    # https://developers.optimizely.com/x/solutions/sdks/reference/index.html?language=ruby#targeting
    
    # FOR EXAMPLE: 

    # attributes = {
    #   'device' => 'iPhone',
    #   'adSource' => 'my_campaign'
    #   'index_page' => true
    # }
    
    # # Track a conversion event for the provided user with attributes
    # optimizely_client.track(event_key, user_id, attributes)
  end



end
