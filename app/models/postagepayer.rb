class Postagepayer < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い（購入者負担）' },
    { id: 3, name: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items

  end