FactoryBot.define do

  factory :user do
    id           {1}
    name              {"yamada"}
    email          {"a@gmail.com"}
    password              {"aaaaaaaa"}
    password_confirmation  {"aaaaaaaa"}
  end

end