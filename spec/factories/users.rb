FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"123aaaa"}
    password_confirmation { password }
    first_name {"山田"}
    last_name {"太郎"}
    first_name_kana {"ヤマダ"}
    last_name_kana {"タロウ"}
    birthday {"1999-01-11"}
  end
end