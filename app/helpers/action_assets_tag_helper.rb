module ActionAssetsTagHelper
  
  def active_assets_tag name = :html, options = {}, &block
    options.reverse_merge! action_assets_attributes
    content_tag name, options, &block
  end
  
  def action_assets_attributes
    {data: {controller: params[:controller], action: params[:action],
      layout: controller.send(:_layout).virtual_path}}
  end
  
end