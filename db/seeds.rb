
require 'json'
require 'open-uri'

User.destroy_all
Breed.destroy_all
Puppy.destroy_all

gender_array = ['male', 'female']

url = "https://dog.ceo/api/breeds/image/random"
dog_api = open(url).read
dog_images = JSON.parse(dog_api)
dog_pics = []

100.times {
 dog_pics << dog_images['message']

 }
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

Breed.create!(breeds)

30.times  {
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::String.random(9))
}

100.times {
  Puppy.create(name: Faker::Dog.name, user: User.order("RANDOM()").first, breed: Breed.order("RANDOM()").first, photo: dog_pics.sample, gender: gender_array.sample, age: rand(1..3))
}


