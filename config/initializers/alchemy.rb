Alchemy::Modules.register_module({
  engine_name: 'spree',
  name: 'solidus',
  navigation: {
    controller: 'spree/admin/orders',
    action: 'index',
    name: 'Shop',
    image: 'alchemy/solidus/alchemy_module_icon.png'
  }
})

Alchemy.user_class_name = 'Spree::User'
Alchemy.current_user_method = :spree_current_user
