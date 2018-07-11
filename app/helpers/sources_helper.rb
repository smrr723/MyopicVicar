module SourcesHelper

  def bread(source)  
    case source.source_name
      when 'Image Server'
        breadcrumb = ":sources_image_source"
      when 'Other Server1'
        breadcrumb = ":sources_other_server1"
      when 'Other Server2'
        breadcrumb = "sources_other_server2"
      when 'Other Server3' 
        breadcrumb = "sources_other_server3"
    end
    breadcrumb
  end

end
