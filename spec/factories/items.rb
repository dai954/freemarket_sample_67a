FactoryBot.define do

  factory :item do
    name              {"yamada"}
    price          {"300"}
    status              {"新品、未使用"}
    descripstion  {"aaaaa"}
    burden    {"１〜２日で発送"}
    add_attribute(:method)    {"パピプペポ太郎"}
    area_id     {"1"}
  end

end