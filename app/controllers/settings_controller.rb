require 'erb'

class SettingsController < ApplicationController

  helper SettingsHelper
  # GET /settings
  # GET /settings.json
  def index
    @setting = Setting.first
    if @setting
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @setting }
      end
    else
      redirect_to new_setting_path
    end

  end



  # GET /settings/1
  # GET /settings/1.json
  def show
    @setting = Setting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setting }
    end
  end

  # GET /settings/new
  # GET /settings/new.json
  def new
    allowed = Setting.first.nil?
    if allowed
      @setting = Setting.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @setting }
      end
      reload_css
    end
  end

  # GET /settings/1/edit
  def edit
    @setting = Setting.find(params[:id])
  end


  # POST /settings
  # POST /settings.json
  def create
    allowed = Setting.first.nil?
    if allowed
      @setting = Setting.new(params[:setting])

      respond_to do |format|
        if @setting.save
          format.html { redirect_to settings_path, notice: 'Setting was successfully created.' }
          format.json { render json: @setting, status: :created, location: @setting }
        else
          format.html { render action: "new" }
          format.json { render json: @setting.errors, status: :unprocessable_entity }
        end
      end
      reload_css
    end
  end

  # PUT /settings/1
  # PUT /settings/1.json
  def update
    @setting = Setting.find(params[:id])

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        format.html { redirect_to settings_path, notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
    reload_css
  end

  def reload_css
    erb_text = File.open("app/views/settings/settings.css.less.erb").read
    new_less_renderer = ERB.new(erb_text)
    new_less_text = new_less_renderer.result()
    puts new_less_text
    #THIS OVERWRITES THE ERB!!!
    File.open("app/assets/stylesheets/bootstrap_and_overrides.css.less", 'w') {
        |f| f.write(new_less_text)
    }
    #guard should do its thing
    #or maybe I should precompile assets
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy

    respond_to do |format|
      format.html { redirect_to settings_url }
      format.json { head :no_content }
    end
  end
end
