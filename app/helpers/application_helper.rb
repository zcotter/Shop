module ApplicationHelper
  def style_tag(stylesheet)
    asset = Shop::Application.assets[stylesheet]
    environment = asset.instance_variable_get('@environment')
    logical_path = asset.logical_path
    pathname = asset.pathname
    clone = asset.class.new(logical_path, pathname, {})
    content_tag("STYLE", clone.body.html_safe, type: "text/css")
  end
end
