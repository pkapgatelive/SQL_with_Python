import pymongo


uri = "mongodb+srv://pkapgatelive:pkapgatelive@cluster0.akfdcaj.mongodb.net/?retryWrites=true&w=majority"

# Create a new client and connect to the server
client = pymongo.MongoClient(uri)

# Send a ping to confirm a successful connection
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
    
    #Database Creation
    database = client['ineuron']
    
    #Collection Creation
    collection = database['fsds_8th']

    #Create a new data entry
    data = {
        "class_name": "Full stack data science 2.0",
        "topic_name": "mongo db nosql",
        "today_datetime": "8th Jan 2023"
    }

    # Insert the data into the database
    collection.insert_one(data)
    print(data)

    many_data = [
        {"class name " : "full stack data science 2.0 " ,
        "topic name " : "mongo db nosql ",
        "todays date ": "8th jan 2023"
        },

        {"class name " : "full stack data science 2.0 " ,
        "topic name " : "mongo db nosql ",
        "todays date ": "9th jan 2023"
        },

        {"class name " : "full stack data science 2.0 " ,
        "topic name " : "mongo db nosql ",
        "todays date ": "10th jan 2023"
        },

        {"class name " : "full stack data science 2.0 " ,
        "topic name " : "mongo db nosql ",
        "todays date ": "11th jan 2023"
        },

        {"class name " : "full stack data science 2.0 " ,
        "topic name " : "mongo db nosql ",
        "todays date ": "12th jan 2023"
        },

        {"class name " : "full stack data science 2.0 " ,
        "topic name " : "mongo db nosql ",
        "todays date ": "13th jan 2023"
        },

        {"class name " : "full stack data science 2.0 " ,
        "topic name " : "mongo db nosql ",
        "todays date ": "14th jan 2023"
        },
    ]
    collection.insert_many(many_data)
    print(many_data) 

    
    
except Exception as e:
    print(e)