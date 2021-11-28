use databasename
db.collectionname.find()
show collections
show dbs
db
db.stats()

db.collectionname.
    insert()
    insertMany()
    insertOne()

*.find().pretty()
можно сперва определить doc = {...}

findOne
db.users.find({name: "Tom"}, {age: 1})
db.users.find().limit(3)
    .skip(3)
db.users.find().sort({name: 1})
var cursor = db.users.find()

db.users.count()
    .find(..).count()
    .distinct()
.find ({age: {$lt : 30}})
find ({$or : [{name: "Tom"}, {age: 22}]})


replaceOne
updateOne 
updateMany
.updateOne({name : "Tom", age: 25}, {$set: {age : 28}})
                                     $inc
                                     $unset
 $push $addToSet  $pop  for arrays fields

deleteOne()  /Many
db.users.drop()
db.dropDatabase()
