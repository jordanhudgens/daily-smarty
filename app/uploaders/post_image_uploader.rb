class PostImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :aws

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :homepage_thumb do
    process resize_to_fit: [300, 250]
  end

  version :feature_thumb do
    process resize_to_fit: [1000, 563]
  end

  version :guide_thumb do
    process resize_to_fit: [400, 225]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
