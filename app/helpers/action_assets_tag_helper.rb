module ActionAssetsTagHelper
  
  def action_assets_tag name = :html, options = {}, &block
    options.reverse_merge! action_assets_attributes
    content_tag name, options, &block
  end
  
  def action_assets_attributes
    layout = controller.send(:_layout)
    layout = layout.virtual_path if layout.respond_to? :virtual_path
    {data: {controller: params[:controller], action: params[:action],
      layout: layout}}
  end
  
end