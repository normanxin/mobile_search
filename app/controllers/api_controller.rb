class ApiController < ApplicationController
  def app_by_id
    @app = App.find(params[:id])
    respond_to do |format|
      format.json   {render :json=>@app }
    end
  end

  def app_all
    @apps = App.all
    respond_to do |format|
      format.json {render :json=>@apps }
    end
  end

  def app_by_recommendation

    profile = Profile.where(:user_id => params[:user_id]).first
    counter = profile.health

    @type_name = 'health'

    if counter<profile.productivity
      @type_name = "productivity"
      counter = profile.productivity
    end


    if counter<profile.education
        @type_name = "education"
        counter = profile.education
    end

    if counter<profile.lifestyle
      @type_name = "lifestyle"
      counter = profile.lifestyle
    end

    if counter<profile.social
      @type_name = "social"
      counter = profile.social
    end


    if counter<profile.game
      @type_name = "game"
      counter = profile.game
    end


    if counter<profile.weather
      @type_name = "weather"
      counter = profile.weather
    end

    @app = App.where(:category=>@type_name).order("counter DESC").first

    respond_to do |format|
      format.json {render :json=>@app }
    end

  end

  def user_by_id
    @user = User.find(params[:id])
    respond_to do |format|
      format.json {render :json=>@user }
    end
  end

  def user_all
    @users = User.all
    respond_to do |format|
      format.json {render :json=>@users }
    end
  end

  def friend_by_user_id
    @friends = User.where(:user_id => params[:user_id])
    respond_to do |format|
      format.json {render :json=>@friends }
    end
  end

  def profile_by_user_id
    @profile = Profile.find(params[:user_id])
    respond_to do |format|
      format.json {render :json=>@profile}
    end
  end

  def profile_update_by_user_id
    @profile = Profile.where(:user_id=>params[:user_id]).first
    @profile.profile_type = params[:profile_type] if !params[:profile_type].nil?
    @profile.health = params[:health] if !params[:health].nil?
    @profile.productivity = params[:productivity] if !params[:productivity].nil?
    @profile.education = params[:education] if !params[:education].nil?
    @profile.lifestyle= params[:lifestyle] if !params[:lifestyle].nil?
    @profile.social = params[:social] if !params[:social].nil?
    @profile.game = params[:game] if !params[:game].nil?
    @profile.weather = params[:weather] if !params[:weather].nil?

    @profile.save!

    respond_to do |format|
      format.json {render :json => @profile }
    end
  end

  def user_app_list_by_user_id
    @user_app_lists = UserAppList.where(:user_id=>params[:user_id])
    respond_to do |format|
      format.json {render :json=>@user_app_lists }
    end
  end


end
