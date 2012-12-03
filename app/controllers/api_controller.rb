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

  def app_search_by_keyword
    query = "%"+params[:keyword]+"%"

    # @apps = App.where("name ILIKE ? OR description ILIKE ? OR publisher ILIKE ? OR category ILIKE ?",query,query,query,query)
    @apps_name = App.where("name ILIKE ?",query)
    @apps_other = App.where("description ILIKE ? OR publisher ILIKE ? OR category ILIKE ?",query, query, query)
    @apps = @apps_name + @apps_other
    #@apps = App.where("name ILIKE ?",query)
    #@apps = App.where("name LIKE ?",query)
    respond_to do |format|
      format.json {render :json=>@apps }
    end
  end

  def app_search_by_keyword_with_usage
    query = "%"+params[:keyword]+"%"

    @apps = App.where("name ILIKE ? OR description ILIKE ? OR publisher ILIKE ? OR category ILIKE ?",query,query,query,query)
    #@apps = App.where("name LIKE ? OR description LIKE ? OR publisher LIKE ? OR category LIKE ?",query,query,query,query)

    #@apps = App.where("name ILIKE ?",query)
    #@apps = App.where("name LIKE ?",query)


    #profile = Profile.find(params[:user_id])
    counter_all = params[:health].to_f +
                  params[:productivity].to_f +
                  params[:education].to_f +
                  params[:lifestyle].to_f +
                  params[:social].to_f +
                  params[:game].to_f +
                  params[:weather].to_f

        @apps.each do |app|
           app[:weight] = calculate_prob(app,counter_all)
           if app.name =~ /#{params[:keyword]}/i
              app[:weight] +=0.00001
           end

          #app[:counter_all] = counter_all
        end

        @apps = @apps.sort_by{|a| -a[:weight]}
         #puts(counter_all)


    #    t.integer  "health"
    #t.integer  "productivity"
    #t.integer  "education"
    #t.integer  "lifestyle"
    #t.integer  "social"
    #t.integer  "game"
    #t.integer  "weather"



    respond_to do |format|
      format.json {render :json=>@apps }
    end
  end

  private
  def calculate_prob(app,counter_all)

  case app.category
      when "health"
      return params[:health].to_f/counter_all
    when "productivity"
      return params[:productivity].to_f/counter_all
    when "education"
      return params[:education].to_f/counter_all
    when "lifestyle"
      return params[:lifestyle].to_f/counter_all
    when "social"
      return params[:social].to_f/counter_all
    when "game"
      return params[:game].to_f/counter_all
    when "weather"
      return params[:weather].to_f/counter_all
    else
      return 0
    end
  end


end
