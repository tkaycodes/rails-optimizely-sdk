require 'optimizely'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def optimizely_user
    session[:optimizely_user] ||= SecureRandom.hex
  end

  protected

  def render_optimizely_variation
    url = 'https://cdn.optimizely.com/json/9030030860.json'
    datafile = HTTParty.get(url).body
    optimizely_client = Optimizely::Project.new(datafile)
    # attributes = {'index_page': true}

    @variation = optimizely_client.activate('tabish_experiment', optimizely_user);

    if @variation == 'varA'
      render 'optimizely/index'
    end

    # TO DO: NEED TO INCLUDE AUDIENCE TARGETING
    # https://developers.optimizely.com/x/solutions/sdks/reference/index.html?language=ruby#targeting
    
    # attributes = {
    #   'device' => 'iPhone',
    #   'adSource' => 'my_campaign'
    # }
    
    # # Track a conversion event for the provided user with attributes
    # optimizely_client.track(event_key, user_id, attributes)

  end


end
