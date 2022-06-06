FactoryBot.define do
  factory :ordinary_user, class: User do
    name { 'not_admin' }
    email { "not_admin@example.com" }
    password { "123456" }
    admin {'false'}
  end
  factory :admin_user, class: User do
    name { 'admin' }
    email { "admin@example.com" }
    password { "123456" }
    admin {'true'}
  end
  factory :admin_test, class: User do
    name { 'test' }
    email { "test@example.com" }
    password { "123456" }
    admin {'true'}
  end
end
