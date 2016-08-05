# Copyright 2012 Trustees of FreeBMD
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
require 'chapman_code'
ActiveAdmin.register ImageList do

  menu :priority => 4

  action_item({ :only => :show, :if => proc{ image_list.asset_collection.nil? || AssetCollection.find(image_list.asset_collection).nil? } }) do
    link_to "Publish", publish_admin_image_list_path
  end


   index do
    column "Name", :sortable => :name do |il|
      link_to il.name, admin_image_list_path(il)
    end
    column :chapman_code
    column :difficulty
    column :created_at
  end

  
  show :title => :name do
    attributes_table do
      row :name
      row :chapman_code
      row :start_date
      row :end_date
      row :template do |il|
        t = Template.find(il.template)
        link_to t.name, admin_template_path(t) if t
      end
      row :register do |il|
        ac = AssetCollection.find(il.asset_collection)
        link_to ac.title, admin_register_path(ac) if ac
      end
      row :difficulty
      row :created_at
    end
    h3 "Files"
    table_for image_list.image_files do
      column("Name") do |f|
        link_to f.display_name, admin_image_file_path(f)
      end
      column("Image") do |f|
        link_to(image_tag(f.thumbnail_url), admin_image_file_path(f))
      end
    end
  end
  
  
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :start_date, :input_html => {:size => 10}
      f.input :end_date,  :input_html => {:size => 10}
      f.input :difficulty, :as => :select, :collection => { "Beginner" => 0, "Intermediate" => 1, "Advanced" => 2 }
      f.input :chapman_code, :as => :select, :collection => ChapmanCode::select_hash_with_parenthetical_codes
      f.input :template, :as => :select, :collection => Template.all
    end
    f.buttons
  end

  
  member_action :publish do
    @image_list=ImageList.find(params[:id])
    if @image_list.template.blank? 
      flash[:error] = "Template is required before an image list may be published."
      redirect_to edit_admin_image_list_path(@image_list)
    else
      flash[:notice] = "Image list #{@image_list.name} is now published for transcription."
      asset_collection = @image_list.publish_to_asset_collection
      redirect_to admin_register_path(asset_collection)
    end
#    logger.debug("Converting to image list")
#    image_list = @image_dir.convert_to_image_list
#    logger.debug("Converted to image list #{image_list.inspect}")
#    redirect_to admin_image_list_path(image_list)
  end


end