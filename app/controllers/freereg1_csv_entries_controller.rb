class Freereg1CsvEntriesController < ApplicationController
  require 'chapman_code'
  require 'freereg_validations'
  require 'freereg_options_constants'
  skip_before_filter :require_login, only: [:show]
 
  def create
    get_user_info_from_userid
    @freereg1_csv_file = Freereg1CsvFile.find(session[:freereg1_csv_file_id])
    @freereg1_csv_entry = Freereg1CsvEntry.new(freereg1_csv_entry_params)
    @freereg1_csv_file.check_and_augment_def(params[:freereg1_csv_entry])
    year =  @freereg1_csv_entry.get_year(params[:freereg1_csv_entry])
    unless session[:error_id].nil?
      error_file = @freereg1_csv_file.batch_errors.find( session[:error_id])
      file_line_number = error_file.record_number
      line_id = error_file.data_line[:line_id]
    else
      file_line_number = @freereg1_csv_file.records.to_i + 1
      line_id = @freereg1_csv_file.userid + "." + @freereg1_csv_file.file_name.upcase + "." +  file_line_number.to_s
      @freereg1_csv_file.update_attributes(:records => file_line_number)
    end
    @freereg1_csv_entry.update_attributes(:register_type => @freereg1_csv_file.register_type,:year => year, :line_id => line_id,:record_type  => @freereg1_csv_file.record_type, :file_line_number => file_line_number)
    #need to deal with change in place
    unless @freereg1_csv_file.register.church.place.place_name == params[:freereg1_csv_entry][:place]
      #need to think about how to do this
    end
    church =  @freereg1_csv_file.register.church
    place = church.place
    @freereg1_csv_entry.church_name = church.church_name
    @freereg1_csv_entry.place = place.place_name
    @freereg1_csv_entry.county = place.chapman_code
    @freereg1_csv_file.freereg1_csv_entries << @freereg1_csv_entry
    @freereg1_csv_entry.save
    @freereg1_csv_file.calculate_distribution

    if @freereg1_csv_entry.errors.any?
      flash[:notice] = 'The creation of the record was unsuccessful'
      display_info
      render :action => 'error'
      return
    else
      software_version = SoftwareVersion.control.first
      search_version = ''
      search_version  = software_version.last_search_record_version unless software_version.blank?
      place = get_place_from_file(@freereg1_csv_file)
      place_id = place.id
      chapman_code = place.chapman_code
      SearchRecord.update_create_search_record(@freereg1_csv_entry,search_version,place)
      @freereg1_csv_file.backup_file
      #update file with date and lock and delete error
      @freereg1_csv_file.lock_all(session[:my_own])
      @freereg1_csv_file.modification_date = Time.now.strftime("%d %b %Y")

      if session[:error_id].nil?
        @freereg1_csv_file.records = @freereg1_csv_file.records.to_i + 1
        @freereg1_csv_file.calculate_date(params)
      else
        @freereg1_csv_file.error =  @freereg1_csv_file.error - 1
        @freereg1_csv_file.batch_errors.delete( @freereg1_csv_file.batch_errors.find(session[:error_id])) if @freereg1_csv_file.batch_errors.find(session[:error_id]).present?
      end
      display_info
      @freereg1_csv_file.save
      if  @freereg1_csv_file.errors.any?
        flash[:notice] = 'The update in entry data distribution contents was unsuccessful'
        redirect_to :action => 'error'
        return
      else
        session[:error_id] = nil
        flash[:notice] = 'The creation/update in entry contents was successful, backup of file made and locked'
        redirect_to freereg1_csv_entry_path(@freereg1_csv_entry)
        return
      end
    end
  end

  def destroy
    @freereg1_csv_entry = Freereg1CsvEntry.id(params[:id]).first
    if @freereg1_csv_entry.present?
      freereg1_csv_file = @freereg1_csv_entry.freereg1_csv_file
      freereg1_csv_file.freereg1_csv_entries.delete(@freereg1_csv_entry)
      @freereg1_csv_entry.destroy
      freereg1_csv_file.calculate_distribution
      freereg1_csv_file.recalculate_last_amended
      freereg1_csv_file.update_number_of_files
      flash[:notice] = 'The deletion of the record was successful'
      redirect_to freereg1_csv_file_path(freereg1_csv_file)
      return
    else
      go_back("entry",params[:id])
    end
  end

  def display_info
    if @freereg1_csv_entry.nil?
      @freereg1_csv_file = Freereg1CsvFile.id(session[:freereg1_csv_file_id]).first
    else
      @freereg1_csv_file = @freereg1_csv_entry.freereg1_csv_file
    end

    if @freereg1_csv_file.nil?
      flash[:notice] = "The entry you are trying to access is not found in the database. The entry or batch may have been deleted."
      redirect_to main_app.new_manage_resource_path
      return
    end
    @freereg1_csv_file_id =  @freereg1_csv_file.id
    @freereg1_csv_file_name =  @freereg1_csv_file.file_name
    @file_owner = @freereg1_csv_file.userid
    @register = @freereg1_csv_file.register
    #@register_name = @register.register_name
    #@register_name = @register.alternate_register_name if @register_name.nil?
    @register_name = RegisterType.display_name(@register.register_type)
    @church = @register.church #id?
    @church_name = @church.church_name
    @place = @church.place #id?
    @county =  @place.county
    @place_name = @place.place_name
    @user = get_user
    @first_name = @user.person_forename unless @user.blank?
  end



  def edit
    @freereg1_csv_entry = Freereg1CsvEntry.id(params[:id]).first
    if @freereg1_csv_entry.present?
      session[:freereg1_csv_entry_id] = @freereg1_csv_entry._id
      display_info
      @freereg1_csv_entry.multiple_witnesses.build
    else
      go_back("entry",params[:id])
    end
  end


  def error
    @error_file = BatchError.id(params[:id]).first
    if @error_file.present?
      get_user_info_from_userid
      session[:error_id] = params[:id]
      set_up_error_display
      if @freereg1_csv_file.nil?
        flash[:notice] = "The error appears to have become disconnected from its file. Contact system administration"
        redirect_to :action => 'show'
        return
      end
    else
      go_back("error",params[:id])
    end
  end

  def index
    display_info
    @freereg1_csv_entries = Freereg1CsvEntry.where(:freereg1_csv_file_id => @freereg1_csv_file_id ).all.order_by(file_line_number: 1)
  end

  def new
    session[:error_id] = nil
    display_info
    file_line_number = @freereg1_csv_file.records.to_i + 1
    line_id = @freereg1_csv_file.userid + "." + @freereg1_csv_file.file_name.upcase + "." +  file_line_number.to_s
    @freereg1_csv_entry = Freereg1CsvEntry.new(:record_type  => @freereg1_csv_file.record_type, :line_id => line_id, :file_line_number => file_line_number )
    @freereg1_csv_entry.multiple_witnesses.build
  end

  def set_up_error_display
    @freereg1_csv_file = @error_file.freereg1_csv_file
    @error_file.data_line[:record_type] = @error_file.record_type
    @error_file.data_line.delete(:chapman_code)
    @error_file.data_line.delete(:place_name)
    @freereg1_csv_entry = Freereg1CsvEntry.new(@error_file.data_line)
    @error_line = @error_file.record_number
    @error_message = @error_file.error_message
    @place_names = Array.new
    Place.where(:chapman_code => session[:chapman_code], :disabled.ne => "true").all.each do |place|
      @place_names << place.place_name
    end
    unless @freereg1_csv_file.nil?
      @freereg1_csv_file_name = @freereg1_csv_file.file_name
      @file_owner = @freereg1_csv_file.userid
      @register = @freereg1_csv_file.register
      @register_name = RegisterType.display_name(@register.register_type)
      @church = @register.church #id?
      @church_name = @church.church_name
      @place = @church.place #id?
      @county =  @place.county
      @place_name = @place.place_name
    end
    @user = get_user
    @first_name = @user.person_forename unless @user.blank?
  end

  def show
    @get_zero_year_records = "true" if params[:zero_record]== "true"
    @zero_year = "true" if params[:zero_listing] == "true"
    @freereg1_csv_entry = Freereg1CsvEntry.id(params[:id]).first
    if @freereg1_csv_entry.present?
      get_user_info_from_userid
      session[:freereg1_csv_entry_id] = @freereg1_csv_entry._id
      display_info
      @search_record = @freereg1_csv_entry.search_record 
      @forenames = Array.new
      @surnames = Array.new
      @entry = @freereg1_csv_entry
      @image_id = @entry.get_the_image_id(@church,@user,session[:manage_user_origin],session[:image_server_group_id],session[:chapman_code])
      @all_data = true
      @order,@array_of_entries, @json_of_entries = @freereg1_csv_entry.order_fields_for_record_type(@search_record[:record_type],@entry.freereg1_csv_file.def,current_authentication_devise_user.present?)  
    else
      go_back("entry",params[:id])
    end
  end

  def update
    @freereg1_csv_entry = Freereg1CsvEntry.id(params[:id]).first
    if @freereg1_csv_entry.present?
      @freereg1_csv_file = @freereg1_csv_entry.freereg1_csv_file
      @freereg1_csv_file.check_and_augment_def(params[:freereg1_csv_entry])
      params[:freereg1_csv_entry],sex_change = @freereg1_csv_entry.adjust_parameters(params[:freereg1_csv_entry], @freereg1_csv_file)
      @freereg1_csv_entry.update_attributes(freereg1_csv_entry_params)
      @freereg1_csv_entry.check_and_correct_county
      if @freereg1_csv_entry.errors.any?
        flash[:notice] = 'The update of the record was unsuccessful'
        render :action => 'edit'
        return
      else
        #update search record if there is a change
        software_version = SoftwareVersion.control.first
        search_version = ''
        search_version  = software_version.last_search_record_version unless software_version.blank?
        place = get_place_from_file(@freereg1_csv_file)
        @freereg1_csv_entry.search_record.destroy  if sex_change # updating the search names is too complex on a sex change it is better to just recreate
        @freereg1_csv_entry.search_record(true)   if sex_change#this frefreshes the cache
        SearchRecord.update_create_search_record(@freereg1_csv_entry,search_version,place)
        # lock file and note modification date
        @freereg1_csv_file.locked_by_transcriber = true if session[:my_own]
        @freereg1_csv_file.locked_by_coordinator = true unless session[:my_own]
        @freereg1_csv_file.modification_date = Time.now.strftime("%d %b %Y")
        @freereg1_csv_file.save
        @freereg1_csv_file.calculate_distribution
        flash[:notice] = 'The change in entry contents was successful, the file is now locked against replacement until it has been downloaded.'
        redirect_to freereg1_csv_entry_path(@freereg1_csv_entry)
      end
    else
      go_back("entry",params[:id])
    end
  end

  private

  def freereg1_csv_entry_params
    params.require(:freereg1_csv_entry).permit!
  end

end