class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'お知らせ' },
    { id: 3, name: '授業' },
    { id: 4, name: '進学' },
    { id: 5, name: '就職' },
    { id: 6, name: '行事' },
    { id: 7, name: '奨学金' },
    { id: 8, name: 'その他' },
  ]
 end