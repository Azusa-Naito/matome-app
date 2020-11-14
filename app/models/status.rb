class Status < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '事務局・運営' },
      { id: 3, name: '正社員講師・常勤講師' },
      { id: 4, name: '非常勤講師' },
    ]

  include ActiveHash::Associations
  has_many :teachers
end
