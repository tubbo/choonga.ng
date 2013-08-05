unless AdminUser.where(name: %w(admin@example.com admin@choonga.ng)).any?
  AdminUser.new(
    name: 'admin@choonga.ng',
    password: 'choongang',
    password_confirmation: 'choongang'
  ).save(validate: false)
end
