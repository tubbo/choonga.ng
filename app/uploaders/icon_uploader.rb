# encoding: utf-8
#
# Uploads Service icon files to the server.
class IconUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  def store_dir
    "icons/#{model.name}"
  end

  def default_url
    "icons/web.png"
  end

  process :scale => [16, 16]
  def scale width, height
    # TODO: Scale with MiniMagick
  end

  def extension_white_list
    %w(png)
  end
end
