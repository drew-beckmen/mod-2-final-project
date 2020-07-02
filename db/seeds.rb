# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bcrypt'
require 'date'

User.destroy_all 
Activity.destroy_all 
ActivityType.destroy_all
Membership.destroy_all 
Group.destroy_all 
Goal.destroy_all 

# Password for seed data users is "password"

# at1 = ActivityType.create(name: "Board Game")
# at2 = ActivityType.create(name: "Draw")
# at3 = ActivityType.create(name: "Running")
# at4 = ActivityType.create(name: "Exercise")
# at5 = ActivityType.create(name: "Yoga")

# u1 = User.create(name: "Sylwia", username: "SYLWIA", contact: "sylwia@gmail.com", photo: "https://api.time.com/wp-content/uploads/2019/08/better-smartphone-photos.jpg", password: "password", password_confirmation: "password")
# u2 = User.create(name: "Alex", username: "ALEX", contact: "alex@gmail.com", photo: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", password: "password", password_confirmation: "password")
# u3 = User.create(name: "Vidhi", username: "VIDHI", contact: "vidhi@gmail.com", photo: "https://st3.depositphotos.com/1000816/18636/i/450/depositphotos_186364412-stock-photo-happy-business-woman-smiling-isolated.jpg", password: "password", password_confirmation: "password")

# g1 = Goal.create(target_hours: 5, user: u1, name: "Lose Weight", description: "Big Challenge", start_day: Date.today, end_day: Date.new(2021, 9, 20))
# g2 = Goal.create(target_hours: 5, user: u2, name: "New Year", description: "Lose Weight Challenge", start_day: Date.today, end_day: Date.new(2021, 5, 23))
# g3 = Goal.create(target_hours: 8, user: u3, name: "Learn Something", description: "Read Books", start_day: Date.today, end_day: Date.new(2021, 2, 28))

# a1 = Activity.create(activity_date: Date.yesterday, duration: 2, activity_type: at1, goal: g3, description: "Catan", rating: 4)
# a2 = Activity.create(activity_date: Date.today, duration: 3, activity_type: at2, goal: g3, description: "sketching", rating: 2)
# a3 = Activity.create(activity_date: Date.yesterday, duration: 0.5, activity_type: at3, goal: g1, description: "YMCA Workout", rating: 1)
# a4 = Activity.create(activity_date: Date.today, duration: 1, activity_type: at5, goal: g2, description: "Fancy Yoga Class", rating: 2)

# group1 = Group.create(name: "Yogies", creator_id: u2.id)
# group2 = Group.create(name: "Artists", creator_id: u3.id)

# member1 = Membership.create(group: group1, user: u2)
# member2 = Membership.create(group: group2, user: u3)


user_images = [
    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://avatars2.githubusercontent.com/u/273509?s=400&u=66cc2a005c432ba73aebf3495314bf5db0d98d96&v=4",
    "https://media.istockphoto.com/photos/-picture-id698262336?k=6&m=698262336&s=612x612&w=0&h=pd5ZutpzLOee7PV8aNMtStdagIsyKREKBnnTLZ9Bwgg=",
    "https://img.huffingtonpost.com/asset/59ef95bf1800004506dfc0a2.jpg?ops=scalefit_630_noupscale",
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1450297350677-623de575f31c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1590271326139-23ec91925a29?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://lh3.googleusercontent.com/proxy/6IRZo5-_5NmG3ltyYAHL01UqlBz81aAtzetAH3xMEPGLiInFYA_DQo1-Bo60hjAcJ7qIwznvo_cV12Ni-B4vst8PBfnQbj_bYCGNxd6YmNgT7Y4lRl-1y8yARXQYKSvlg9UFazDpBQRluqOSpj2_8b4",
    "https://miro.medium.com/max/3150/1*F1wQKihxgwsD60GMmMq2Aw.jpeg"
].cycle

user_names = [
    'Brian',
    'Mark',
    'Wilma',
    'Andrea',
    'Nora',
    'Roger',
    'Brianna',
    'Sigrid',
    'Carlota',
    'James',
    'Drew'
].cycle

user_user_names = [
    'Brian35',
    'MarkyMarkyMark',
    'wbs',
    'Drea58',
    'Noraaaaa',
    'Rog',
    'Bria957',
    'Siggy192',
    'Carlota',
    'TheJames',
    'TheDrew'
].cycle

user_emails = [
    'brian@brian.com',
    'mark@mark.com',
    'wilma@wilma.com',
    'drea@drea.com',
    'nora@nora.com',
    'rog@roger.com',
    'bria@brianna.com',
    'siggy@sigrid.com',
    'carlota@carlota.com',
    'james@aol.com',
    'drew@yahoo.com'
].cycle

user_abouts = [
    "I'm a fake profile",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words,",
    "I like fishing and swimming and hiking and running",
    "I'm good at sleeping",
    "All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.",
    "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.",
    "optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
    "I like to make music and code",
    "Hi, I'm Drew.  I built this app."
].cycle

activity_names = [
    'Yoga',
    'Walking',
    'Running',
    'Stretching',
    'Biking',
    'Napping',
    'Meditating',
    'Playing a game',
    'Drawing',
    'Singing',
    'Calling a friend',
    'Swimming',
    'Breathing deeply',
    'Sleeping in',
    'Watching a movie',
    'Hiking',
    'Writing',
    'Baking',
    'Reading',
    'Taking phone-free time',
    'Petting an animal',
    'Listening to a podcast',
    'Listening to an audiobook',
    'Listening to music',
    'Playing an instrument',
    'Taking a social media hiatus',
    'Going to therapy',
    'Lifting',
    'Going to the beach'
]

group_names = [
    'Fantasy and science fiction readers',
    'Yogis',
    'Long distance cyclists',
    'Leisure',
    'Emotional wellness',
    'Physical wellness',
    'Music nerds',
    'NYC members',
    'Friends of furry friends',
    'Frog on Zsh!'
].cycle

group_descriptions = [
    'This is a virtual book club of fans of Science Fiction and Fantasy. Science fiction is a genre of fiction dealing with imaginary but more or less plausible (or at least non-supernatural) content such as future settings, futuristic science and technology, space travel, aliens, and paranormal abilities. Exploring the consequences of scientific innovations is one purpose of science fiction, making it a "literature of ideas".',
    'It is said that yoga and meditation can ward off stress and disease. Please share your thoughts on yoga and meditation.',
    'A page for all cyclists to connect and share cycling stories and tips.',
    'A group to share tips on relaxing and stopping to enjoy life.',
    'Some foods are known to make you feel emotionally better.',
    "Let's share some fitness ideas/routines!",
    'No politics, no fighting. Are you someone who read the liner notes of every album? This is for you',
    'Centered in the Big Apple',
    'DOGS!  CATS!  GERBILS!!!',
    'Need I say more?'
].cycle

group_images = [
    'https://images.squarespace-cdn.com/content/v1/5979efb7197aeafed276c1de/1588324189321-2PDOO8SM8MT1QF2NA0DG/ke17ZwdGBToddI8pDm48kAt72yGFwHZjoxtmj75n0VMUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYy7Mythp_T-mtop-vrsUOmeInPi9iDjx9w8K4ZfjXt2dvp1wM0jvciobd5mvjBb-PkjbbxSYDSdt-BIyUswy_5eG6v6ULRah83RgHXAWD5lbQ/How+to+write+a+science+fiction+story',
    'https://i0.wp.com/post.greatist.com/wp-content/uploads/sites/2/2019/09/GRT-female-yoga-by-water-1296x728-header-1296x728.jpg?w=1155&h=1528',
    'https://blog.mapmyrun.com/wp-content/uploads/2018/12/11-Must-Read-Cycling-Stories-of-2018-4.jpg',
    'https://spaceenoughandtime.files.wordpress.com/2017/05/leisure.jpg',
    'https://scontent-lga3-1.xx.fbcdn.net/v/t1.0-9/11133732_937326512984615_2201256766729390316_n.png?_nc_cat=110&_nc_sid=e3f864&_nc_ohc=BDgD5WnfwEwAX-iFPEK&_nc_ht=scontent-lga3-1.xx&oh=646152f0de6235385a70e3c254b50bcb&oe=5F25914D',
    'https://amp.thenational.ae/image/policy:1.719801:1523202284/lf09-APR-fitness.jpg?f=16x9&w=1200&$p$f$w=5dce02a',
    'https://static.fjcdn.com/pictures/For+the+music+nerds+eh_0a5f81_3833687.png',
    'https://imgs.6sqft.com/wp-content/uploads/2020/06/26105451/NYC-sunset-Lower-Manhattan.jpg',
    'https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F190517103414-01-grumpy-cat-file-restricted.jpg',
    'https://res.cloudinary.com/practicaldev/image/fetch/s--Vu1ydx2h--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://res.cloudinary.com/practicaldev/image/fetch/s--xSMU9PY---/c_imagga_scale%2Cf_auto%2Cfl_progressive%2Ch_420%2Cq_auto%2Cw_1000/https://dev-to-uploads.s3.amazonaws.com/i/0kqx6wkx6wz6blsrn882.png'
].cycle

activity_names.each {|aname| ActivityType.create(name: aname)}
11.times { User.create(name: user_names.next, contact: user_emails.next, username: user_user_names.next, password: 'password', password_confirmation: 'password', photo: user_images.next, about: user_abouts.next )} 
10.times { Group.create(name: group_names.next, description: group_descriptions.next, img_url: group_images.next)}

User.all.each do |user|
    groups = Group.all.shuffle
    Kernel.rand(1..6).times { user.groups << groups.pop }
end
