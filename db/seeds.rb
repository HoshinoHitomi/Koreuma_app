# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'kore@uma',
  password: 'koreuma'
  )

Genre.create!([
  {name: '米、ごはん'},
  {name: 'パン'},
  {name: '麺'},
  {name: 'スイーツ'},
  {name: 'お菓子'},
  {name: '飲み物'}
  ])

Shop.create!([
  {
    email: 'ramen@tanaka',
    password: 'ramentanaka',
    name: 'ラーメン田中',
    shop_image: File.open('./app/assets/images/Yamasha181026124_TP_V.jpg'),
    introduction: '創業80年、こだわりのスープと自家製麺が決め手です',
    address: '千葉県　松戸市',
    phone_number: '0000000',
    working_time: '月～金 11:00～20:00、土日祝 11:00～23:00',
    is_active: true
  },
  {
    email: 'sweet@cafe',
    password: 'sweetcafe',
    name: 'スウィートカフェ',
    shop_image: File.open('./app/assets/images/ogasuta458A7801_TP_V.jpg'),
    introduction: '甘いお菓子をたくさん作っています！',
    address: '千葉県　柏市',
    phone_number: '1111111',
    working_time: '年中無休 10:00～22:00',
    is_active: true
  },
  {
    email: 'kona@mono',
    password: 'konamono',
    name: '粉MONO',
    shop_image: File.open('./app/assets/images/TSUoisisouokonomiyaki_TP_V.jpg'),
    introduction: 'お好み焼きやタコ焼きなどの粉物が自慢です',
    address: '千葉県　松戸市',
    phone_number: '2222222',
    working_time: '年中無休',
    is_active: true
  },
  {
    email: 'bistro@kyu',
    password: 'bistro',
    name: 'ビストロきゅう',
    shop_image: File.open('./app/assets/images/ogasuta458A7801_TP_V.jpg'),
    introduction: 'おしゃれなフレンチレストランです',
    address: '赤坂',
    phone_number: '3333333',
    working_time: '11:00～23:00',
    is_active: true
  },
  ])

User.create!([
  {
    name: 'ラーメンまる',
    email: 'ramen@maru',
    password: 'ramenmaru',
    profile_image: File.open('./app/assets/images/IK21317937_TP_V.jpg'),
    introduction: 'ラーメンが好き。',
    sweet_like: 1,
    salty_like: 4,
    bitter_like: 1,
    sour_like: 3,
    spicy_like: 4,
    is_active: true
  },
  {
    name: '甘味大好きさん',
    email: 'sweet@like',
    password: 'sweetlike',
    profile_image: File.open('./app/assets/images/ichigoMDSCF0380_TP_V.jpg'),
    introduction: '甘い物が大好き！',
    sweet_like: 4,
    salty_like: 2,
    bitter_like: 1,
    sour_like: 3,
    spicy_like: 1,
    is_active: true
  },
  {
    name: 'like cafe',
    email: 'like@cafe',
    password: 'likecafe',
    profile_image: File.open('./app/assets/images/cafe201261759_TP_V.jpg'),
    introduction: 'カフェ巡りがブームです。素敵なカフェを共有したいです。',
    sweet_like: 4,
    salty_like: 3,
    bitter_like: 3,
    sour_like: 3,
    spicy_like: 1,
    is_active: true
  },
  {
    name: '琥珀',
    email: 'ko@haku',
    password: 'kohaku',
    profile_image: File.open('./app/assets/images/mizuho2054_8_TP_V.jpg'),
    introduction: 'おしゃれなお菓子を探しています。',
    sweet_like: 4,
    salty_like: 3,
    bitter_like: 3,
    sour_like: 3,
    spicy_like: 1,
    is_active: true
  },
])

Food.create!([
  {
    shop_id: 1,
    genre_id: 3,
    image: File.open('./app/assets/images/Yamasha181026124_TP_V.jpg'),
    name: '田中ラーメン',
    introduction: 'ラーメン田中の看板メニューです。スタンダードな醤油ラーメンになります。',
    taste: 2,
    price: 700,
    calorie: 1000,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 1
  },
  {
    shop_id: 1,
    genre_id: 3,
    image: File.open('./app/assets/images/IK21317926_TP_V.jpg'),
    name: '濃厚こってり味噌ラーメン',
    introduction: 'こだわりにこだわった究極の味噌ラーメンです。',
    taste: 2,
    price: 700,
    calorie: 1000,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 1
  },
  {
    shop_id: 1,
    genre_id: 3,
    image: File.open('./app/assets/images/ra-men0I9A9581_TP_V.jpg'),
    name: 'トンデモもやしそば',
    introduction: 'これでもか！ともやしを乗せた一品です。',
    taste: 2,
    price: 500,
    calorie: 800,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 1
  },
  {
    shop_id: 2,
    genre_id: 4,
    image: File.open('./app/assets/images/OG458A8096_TP_V.jpg'),
    name: 'ほっとケーキ',
    introduction: '北海道産の牛乳をふんだんにつかいました！優しい甘さが特徴です！',
    taste: 1,
    price: 800,
    calorie: 800,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 2
  },
  {
    shop_id: 2,
    genre_id: 4,
    image: File.open('./app/assets/images/0I9A2333_TP_V.jpg'),
    name: 'おやさいケーキ',
    introduction: '野菜を使った体にいいケーキです！ダイエットにいいかも？',
    taste: 1,
    price: 1000,
    calorie: 300,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 2
  },
  {
    shop_id: 2,
    genre_id: 6,
    image: File.open('./app/assets/images/ellycollection076_TP_V.jpg'),
    name: 'ローズヒップティー',
    introduction: 'スウィートカフェ特製のローズヒップティーです。ほのかな甘みでリラックス…',
    taste: 1,
    price: 100,
    calorie: 0,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 1
  },
  {
    shop_id: 2,
    genre_id: 6,
    image: File.open('./app/assets/images/elly21515B1844_TP_V.jpg'),
    name: 'スウィートマカロン',
    introduction: 'スウィートカフェのマカロン！4個入りです。',
    taste: 1,
    price: 400,
    calorie: 0,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 0
  },
  {
    shop_id: 2,
    genre_id: 5,
    image: File.open('./app/assets/images/chocolateFTHG6695_TP_V.jpg'),
    name: 'ビター生チョコ',
    introduction: 'スウィートカフェでも珍しい苦めの生チョコです！甘いものが苦手な方でも楽しめるメニューとして作りました!',
    taste: 3,
    price: 300,
    calorie: 300,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 2
  },
  {
    shop_id: 3,
    genre_id: 1,
    image: File.open('./app/assets/images/BIS_hanbaguo_TP_V.jpg'),
    name: 'ハンバーグ',
    introduction: '肉のうまみあふれるハンバーグです。こだわりのデミグラスソースで召し上がれ。',
    taste: 2,
    price: 1300,
    calorie: 500,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 1
  },
  {
    shop_id: 3,
    genre_id: 1,
    image: File.open('./app/assets/images/PAK14_bistoroqchikientoakawine_TP_V.jpg'),
    name: 'ローストチキン',
    introduction: 'やわらかいお肉',
    taste: 2,
    price: 1400,
    calorie: 400,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 1
  },
  {
    shop_id: 3,
    genre_id: 1,
    image: File.open('./app/assets/images/PAK21_bistroQichigosarada_TP_V.jpg'),
    name: 'サラダ',
    introduction: 'いちごを乗せたサラダ。程よい酸味がアクセント。',
    taste: 4,
    price: 1100,
    calorie: 100,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 0
  },
  {
    shop_id: 4,
    genre_id: 1,
    image: File.open('./app/assets/images/TSUoisisouokonomiyaki_TP_V.jpg'),
    name: '粉物お好み焼き',
    introduction: '粉物看板メニューのお好み焼きです。',
    taste: 2,
    price: 600,
    calorie: 1000,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 1
  },
  {
    shop_id: 4,
    genre_id: 1,
    image: File.open('./app/assets/images/TCPAKU0649_TP_V.jpg'),
    name: '豚玉',
    introduction: '普通の豚玉です。',
    taste: 2,
    price: 600,
    calorie: 900,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 1
  },
  {
    shop_id: 4,
    genre_id: 1,
    image: File.open('./app/assets/images/PAK86_takoyakidekiageari15122810_TP_V.jpg'),
    name: 'タコ焼き',
    introduction: 'オーソドックスなタコ焼きです。',
    taste: 2,
    price: 300,
    calorie: 600,
    status: 1,
    sale_dates: '2021-8-30',
    food_temperature: 1
  },
])