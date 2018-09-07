require 'alchemy_cms'
require 'solidus_core'
require 'solidus_backend'
require 'solidus_support'

module Alchemy
  module Solidus
    class Engine < ::Rails::Engine
      engine_name 'alchemy_solidus'

      initializer 'alchemy_solidus.assets' do |app|
        app.config.assets.precompile += [
          'alchemy/solidus/alchemy_module_icon.png'
        ]
      end

      config.to_prepare do
        Alchemy.register_ability ::Spree::Ability
        ::Spree::Ability.register_ability ::Alchemy::Permissions

        Alchemy.user_class_name == 'Spree::User'
        Alchemy.current_user_method = :spree_current_user


        require 'alchemy/solidus/spree_user_extension'
        Spree::User.include Alchemy::Solidus::SpreeUserExtension

      end
    end
  end
end
