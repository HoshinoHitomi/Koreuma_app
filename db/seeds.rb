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
        profile_image: './app/assets/images/IK21317937_TP_V.jpg',
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
        profile_image: './app/assets/images/ichigoMDSCF0380_TP_V.jpg',
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
        profile_image: './app/assets/images/cafe201261759_TP_V.jpg',
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
        profile_image: './app/assets/images/mizuho2054_8_TP_V.jpg',
        introduction: 'おしゃれなお菓子を探しています。',
        sweet_like: 4,
        salty_like: 3,
        bitter_like: 3,
        sour_like: 3,
        spicy_like: 1,
        is_active: true
      },
    ])