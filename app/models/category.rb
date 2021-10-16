class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ドライバー' },
    { id: 3, name: 'フェアウェイウッド' },
    { id: 4, name: 'ユーティリティ' },
    { id: 5, name: 'アイアンセット' },
    { id: 6, name: 'アイアン単品' },
    { id: 7, name: 'ウェッジ' },
    { id: 8, name: 'パター' },
    { id: 9, name: 'クラブセット' },
    { id: 10, name: 'メンズウェア' },
    { id: 11, name: 'レディースウェア' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
