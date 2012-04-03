CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],       # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['AWS_FOG_DIRECTORY']                     # required
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end