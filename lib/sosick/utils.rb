require "sosick/utils/version"
require "yaml"
require "sosick/utils/user"
require "sosick/utils/photo"
require "sosick/utils/favorite"
require "sosick/utils/validator"

module Sosick
  module Utils
    
    # get connection to database
    def self.initialize(mode)
      $sosick_utils_home=ENV['SOSICK_UTILS_HOME']
      $mode   = mode
      Validator::validate_arguments(mode)
      $config = self.load_configuration

      self.connect_to_sosick
    end

    # get configuration
    def self.load_configuration
      yaml_path = "#{$sosick_utils_home}/config/database.yml"
      yaml = YAML::load(File::open(yaml_path, 'r')::read)

      return yaml
    end

    # connect to a database
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
      # search updated records
      @favorites = Favorite.where(:is_updated => "1")

      # by each record, update photo score
      @favorites.each do |favorite|
        puts favorite.id
        @favorite = Favorite.where(:id => favorite.id).first

        @photo = Photo.where(:id => favorite.photo_id).first
        if @photo.favarited_number.nil?
          @photo.favarited_number = 0
        end
        @photo.favarited_number += @favorite.favor_diff_number

        @user = User.where(id: @photo.model_id)
        unless @user.nil?
          pre_favarited_number_sum = @user.favarited_number_sum
          @user.update(:favarited_number_sum => pre_favarited_number_sum + @favorite_diff_number)
          @user.save
        end

        @favorite.favor_diff_number = 0
        @favorite.is_updated = "0"

        @favorite.save
        @photo.save
      end
    end
  end
end
