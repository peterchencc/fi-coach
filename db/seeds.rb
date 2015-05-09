# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cities = City.create([{ name: '臺北' }, { name: '新北' },
  { name: '基隆' }, { name: '桃園' }, { name: '新竹' },
  { name: '苗栗' }, { name: '臺中' }, { name: '彰化' },
  { name: '雲林' }, { name: '南投' }, { name: '嘉義' },
  { name: '臺南' }, { name: '高雄' }, { name: '屏東' },
  { name: '宜蘭' }, { name: '花蓮' }, { name: '臺東' },
  { name: '澎湖' }, { name: '金門' }])


sports = Sport.create([{ name: '健身' }, { name: '跑步' }, { name: '瑜珈' }, { name: '網球' }])