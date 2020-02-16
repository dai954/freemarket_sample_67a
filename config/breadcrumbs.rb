crumb :root do
  link "トップページ",root_path
end

crumb :mypage do
  link "マイページ",users_path
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

crumb :address do
  link "住所登録", new_address_path
  parent :mypage
end

crumb :credit do
  link "クレジットカード追加", add_users_path
  parent :mypage
end
crumb :item do
  link "商品",item_path
end

crumb :edit do
  link "編集",edit_item_path
  parent :item
end

crumb :purchase do
  link "購入",purchase_item_path
  parent :item
end

crumb :new do
  link "出品",new_item_path
end

crumb :login do
  link "ログイン", login_users_path
end