from pymongo import MongoClient
import pprint

client = MongoClient()
db = client.csci2963
definitions = db.definitions

print "----------Find All----------------------"
for definition in definitions.find():
	print definition

print "----------Find One----------------------"
pprint.pprint(definitions.find_one())

print "----------Find Specific Record----------"
for definition in definitions.find({"word" : "Capitaland"}):
	print definition


print "----------Insert new Record-------------"
post = {"word" : "Bool out", "definition" : "To kick back and relax, usu. with friendly company"}
post_id = definitions.insert_one(post).inserted_id

print "----------Find Record by Object ID"
pprint.pprint(definitions.find_one({"_id" : post_id}))
