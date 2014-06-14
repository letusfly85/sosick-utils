require "sosick/utils/version"
require "yaml"
require "sosick/utils/photo"
require "sosick/utils/favorite"
require "sosick/utils/validator"

module Sosick
  module Utils
    # Your code goes here...
    
    def self.initialize(mode)
      $sosick_utils_home=ENV['SOSICK_UTILS_HOME']
      $mode   = mode
      Validator::validate_arguments(mode)
      puts $mode
      $config = self.load_configuration

      self.connect_to_sosick
    end

    def self.load_configuration
      yaml_path = "#{$sosick_utils_home}/config/database.yml"
      yaml = YAML::load(File::open(yaml_path, 'r')::read)

      return yaml
    end

    def self.connect_to_sosick
      ActiveRecord::Base.establish_connection(
        :adapter  => 'mysql2',
        :database => $config[$mode]["database"],
        :host     => $config[$mode]["host"],
        :username => $config[$mode]["username"],
        :password => $config[$mode]["username"]
      )
    end

    def self.update
      @photos = Photo.all

      @photos.each do |photo|
        puts photo.photo_title
      end
    end

  end
end
