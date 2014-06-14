require "sosick/utils/version"
require "yaml"
require "sosick/utils/photo"
require "sosick/utils/favorite"

module Sosick
  module Utils
    # Your code goes here...
    
    def self.initialize
      $sosick_utils_home=ENV['SOSICK_UTILS_HOME']
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
        :database => $config["production"]["database"],
        :host     => "localhost",
        :username => "hoge",
        :password => "hoge"
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
