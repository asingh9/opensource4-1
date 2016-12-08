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
for definition in definitions.find({"word" : "Capitaland"})

print "----------Find Record by Object ID"