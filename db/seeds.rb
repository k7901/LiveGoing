# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hokkaido = Region.find_or_create_by(name: '北海道')
hokkaido.prefectures.find_or_create_by(name: '北海道')

tohoku = Region.find_or_create_by(name: '東北')
tohoku.prefectures.find_or_create_by(name: '青森')
tohoku.prefectures.find_or_create_by(name: '岩手')
tohoku.prefectures.find_or_create_by(name: '秋田')
tohoku.prefectures.find_or_create_by(name: '宮城')
tohoku.prefectures.find_or_create_by(name: '山形')
tohoku.prefectures.find_or_create_by(name: '福島')

kanto = Region.find_or_create_by(name: '関東')
kanto.prefectures.find_or_create_by(name: '東京')
kanto.prefectures.find_or_create_by(name: '神奈川')
kanto.prefectures.find_or_create_by(name: '埼玉')
kanto.prefectures.find_or_create_by(name: '千葉')
kanto.prefectures.find_or_create_by(name: '栃木')
kanto.prefectures.find_or_create_by(name: '群馬')
kanto.prefectures.find_or_create_by(name: '茨城')

chubu = Region.find_or_create_by(name: '中部')
chubu.prefectures.find_or_create_by(name: '静岡')
chubu.prefectures.find_or_create_by(name: '新潟')
chubu.prefectures.find_or_create_by(name: '長野')
chubu.prefectures.find_or_create_by(name: '愛知')
chubu.prefectures.find_or_create_by(name: '岐阜')
chubu.prefectures.find_or_create_by(name: '富山')
chubu.prefectures.find_or_create_by(name: '福井')
chubu.prefectures.find_or_create_by(name: '石川')
chubu.prefectures.find_or_create_by(name: '山梨')
chubu.prefectures.find_or_create_by(name: '三重')

kinki = Region.find_or_create_by(name: '近畿')
kinki.prefectures.find_or_create_by(name: '大阪')
kinki.prefectures.find_or_create_by(name: '兵庫')
kinki.prefectures.find_or_create_by(name: '京都')
kinki.prefectures.find_or_create_by(name: '奈良')
kinki.prefectures.find_or_create_by(name: '滋賀')
kinki.prefectures.find_or_create_by(name: '和歌山')

chugoku = Region.find_or_create_by(name: '中国')
chugoku.prefectures.find_or_create_by(name: '岡山')
chugoku.prefectures.find_or_create_by(name: '広島')
chugoku.prefectures.find_or_create_by(name: '鳥取')
chugoku.prefectures.find_or_create_by(name: '島根')
chugoku.prefectures.find_or_create_by(name: '山口')

shikoku = Region.find_or_create_by(name: '四国')
shikoku.prefectures.find_or_create_by(name: '香川')
shikoku.prefectures.find_or_create_by(name: '徳島')
shikoku.prefectures.find_or_create_by(name: '高知')
shikoku.prefectures.find_or_create_by(name: '愛媛')

kyushu = Region.find_or_create_by(name: '九州')
kyushu.prefectures.find_or_create_by(name: '福岡')
kyushu.prefectures.find_or_create_by(name: '佐賀')
kyushu.prefectures.find_or_create_by(name: '長崎')
kyushu.prefectures.find_or_create_by(name: '大分')
kyushu.prefectures.find_or_create_by(name: '熊本')
kyushu.prefectures.find_or_create_by(name: '宮崎')
kyushu.prefectures.find_or_create_by(name: '鹿児島')
kyushu.prefectures.find_or_create_by(name: '沖縄')

Admin.create!(
   email: 'live@going.com',
   password: '123456',
)
