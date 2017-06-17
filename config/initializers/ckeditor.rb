Ckeditor.setup do |config|
  require 'ckeditor/orm/active_record'
  config.image_file_types = %w(jpg jpeg png gif tiff)
  config.attachment_file_types = %w(doc docx xls odt ods pdf rar zip tar tar.gz swf)

  # Override parent controller CKEditor inherits from
  # By default: 'ApplicationController'
  # config.parent_controller = 'MyController'

  # Asset model classes
  # config.picture_model { Ckeditor::Picture }
  # config.attachment_file_model { Ckeditor::AttachmentFile }

  # Paginate assets
  # By default: 24
  # config.default_per_page = 24

  # Customize ckeditor assets path
  # By default: nil
  # config.asset_path = 'http://www.example.com/assets/ckeditor/'

  # To reduce the asset precompilation time, you can limit plugins and/or languages to those you need:
  # By default: nil (no limit)
  # config.assets_languages = ['en', 'uk']
  # config.assets_plugins = ['image', 'smiley']

  config.js_config_url = 'ckeditor/config.js'
  config.cdn_url = "//cdn.ckeditor.com/4.7.0/standard/ckeditor.js"
end
