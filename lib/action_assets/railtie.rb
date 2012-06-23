require 'action_assets/helpers/action_assets_tag_helper'

module ActionAssets
  class Railtie < Rails::Railtie
    initializer "action_assets.helpers.action_assets_tag_helper" do
      ActionView::Base.send :include, ActionAssetsTagHelper
    end
  end
end