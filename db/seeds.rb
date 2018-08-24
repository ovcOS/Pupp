require 'json'
require 'open-uri'

Puppy.destroy_all
User.destroy_all
Breed.destroy_all
breeds = [
  { name: 'affenpinscher' },
  { name: 'african' },
  { name: 'airedale' },
  { name: 'akita' },
  { name: 'appenzeller' },
  { name: 'basenji' },
  { name: 'beagle' },
  { name: 'bluetick' },
  { name: 'borzoi' },
  { name: 'bouvier' },
  { name: 'boxer' },
  { name: 'brabancon' },
  { name: 'briard' },
  { name: 'bulldog' },
  { name: 'bullterrier' },
  { name: 'cairn' },
  { name: 'cattledog' },
  { name: 'chihuahua' },
  { name: 'chow' },
  { name: 'clumber' },
  { name: 'collie' },
  { name: 'coonhound' },
  { name: 'corgi' },
  { name: 'cotondetulear' },
  { name: 'dachshund' },
  { name: 'dalmatian' },
  { name: 'dane' },
  { name: 'deerhound' },
  { name: 'dhole' },
  { name: 'dingo' },
  { name: 'doberman' },
  { name: 'elkhound' },
  { name: 'entlebucher' },
  { name: 'eskimo' },
  { name: 'germanshepherd' },
  { name: 'greyhound' },
  { name: 'groenendael' },
  { name: 'hound' },
  { name: 'husky' },
  { name: 'keeshond' },
  { name: 'kelpie' },
  { name: 'komondor' },
  { name: 'kuvasz' },
  { name: 'labrador' },
  { name: 'leonberg' },
  { name: 'lhasa' },
  { name: 'malamute' },
  { name: 'malinois' },
  { name: 'maltese' },
  { name: 'mastiff' },
  { name: 'mexicanhairless' },
  { name: 'mix' },
  { name: 'mountain' },
  { name: 'newfoundland' },
  { name: 'otterhound' },
  { name: 'papillon' },
  { name: 'pekinese' },
  { name: 'pembroke' },
  { name: 'pinscher' },
  { name: 'pointer' },
  { name: 'pomeranian' },
  { name: 'poodle' },
  { name: 'pug' },
  { name: 'puggle' },
  { name: 'pyrenees' },
  { name: 'redbone' },
  { name: 'retriever' },
  { name: 'ridgeback' },
  { name: 'rottweiler' },
  { name: 'saluki' },
  { name: 'samoyed' },
  { name: 'schipperke' },
  { name: 'schnauzer' },
  { name: 'setter' },
  { name: 'sheepdog' },
  { name: 'shiba' },
  { name: 'shihtzu' },
  { name: 'spaniel' },
  { name: 'springer' },
  { name: 'stbernard' },
  { name: 'terrier' },
  { name: 'vizsla' },
  { name: 'weimaraner' },
  { name: 'whippet' },
  { name: 'wolfhound' }
]

pup_sentences =  ["I enjoy chasing tennis balls all day long. Please bring one if you come play with me!",
                   "Not going to lie, I am a very lazy puppy. I love eating, sleeping, and cuddling.",
                   "Hello! I am a very active puppy, make sure you are fully energized before you pick me up!",
                   "My hobby number one is squirrel-chasing. However, I am indeed very clumsy, so I never caught one.",
                   "I am a very lovey puppy. I enjoy licking my owner's face every morning."]
pup_description = pup_sentences[rand(0..4)]

Breed.create!(breeds)

30.times  {
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::String.random(9))
}
gender_array = ['male', 'female']

200.times {
  breed = Breed.order("RANDOM()").first
  url = "https://dog.ceo/api/breed/#{breed.name}/images/random"
  dog_api = open(url).read
  dog_images = JSON.parse(dog_api)
  Puppy.create(name: Faker::Dog.name, user: User.order("RANDOM()").first, breed: breed, photo: dog_images['message'], gender: gender_array.sample, age: rand(1..3), description: pup_description)
}
