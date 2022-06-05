import json

data = {}

with open('example.json') as json_file:
    data = json.load(json_file)
    print(data['name'])

prettyJSON = json.dumps(data, indent=4)

print(prettyJSON)

myData = {
    'name': 'Noah Johnson',
    'DOB': 'January 16'
}

with open('data.txt', 'w') as outfile:
    json.dump(myData, outfile)

with open('data.txt') as my_json_file:
    myJSONData = json.load(my_json_file)
    print(myJSONData)
