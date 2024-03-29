setwd("F:/Masters/Semester 3/thesis/x17170885/Cleaning/")
library(dplyr)
library(plyr)
library(tidyverse)
df = read.csv("../Dataset/labels.csv",header = FALSE)
df1 = read.csv("../Dataset/MOCK_DATA.csv")
df2 = read.csv("../Dataset/images.csv",header = FALSE)

names(df) <- c('id','Name','Label','Confidence')
names(df1) <- c('id','City','Country','Latitude','Longitude')
names(df2) <- c('id','Name','UserID')
df2$id <- as.integer(df2$id)


df2 = df2 %>%
  left_join(df1, by=c("id"))

df = df %>%
  left_join(df2, by=c("Name"))


df = df[,c(-1,-5)]

nature = c("Travel", "Outdoors", "Nature", "Wilderness", "Rock", "Bush", "Weather",
           "Cloud", "Sky", "Landscape", "Scenery", "Tree", "Flower", "Rose", "Blossom", 
           "Ruins", "Bird", "Soil", "Animal", "Sunset", "Dusk", "Red Sky", "Sunrise", 
           "Grassland", "Field", "Yard", "Land", "Countryside", "Plant", "Wildlife", "Lawn", "Turtle",
           "Animal", "Reptile", "Tortoise", "Wood", "Dog", "Snow", "Hill", "Farm", "Plateau", 
           "Tree Trunk", "Skylight", "Sunlight", "Ground", "Rainforest", "Waterfall", "Stream", 
           "Lighting", "Mountain", "Frost", "Ice", "Park", "Toad", "Lizard", "Amphibian", 
           "Adventure", "Squirrel", "Mammal", "Pet", "Sheep", "Dinosaur", "Skeleton", "Canine", 
           "Insect", "Spider", "Bear", "Sparrow", "Duck", "Frog", "Butterfly", "Bee", "Leaf", "Fog",
           "Sea Turtle", "Horse", "Mountain", "Smoke", "Snail", "Slope", "Cave", "Cat", "Ant", "Ox",
           "Cow")

adventure = c( "Crowd", "Car", "Sedan", "Vehicle", "Transportation",
              "Airplane", "Bus", "Automobile", "Road", "Highway","Freeway",
              "Sport", "Sports", "Scenery", "Bike", "Airport", "Aircraft", "Airfield", "Tire", 
              "Bicycle", "Helmet", "Cyclist", "Jet", "Airliner", "Flight", "Warplane", "Pyramid", 
              "Wheel", "Sports Car", "Car Wheel", "Camping", "Mountain Tent", "Truck", "Traffic Light", 
              "Train", "Railway", "Buggy", "Sports Car", "Kart", "Skateboard", "Motorcycle", 
              "Graffiti", "Race Car")

beach = c("Sea", "Nature", "Ocean", "Water", "Wilderness", "Rock", "Bush", "Weather",
          "Cloud", "Sky", "Landscape", "Sea Waves", "Boat", "Flood", "Lake", "Coast", "Dock", 
          "River", "Sea Life", "Waterfront", "Watercraft", "Beach")

architecture = c("Building", "Architecture", "Amusement Park", "Theme Park", "Construction", 
                 "Church","Temple", "Sculpture", "Art", "Archaeology",
                 "Statue", "Housing", "House", "Mansion", "Villa", "City", "Urban", "Rural",
                 "Metropolis", "Office Building", "Spire", "Apartment Building", "Canal", "Chair",
                 "Furniture", "Flooring", "Rocking Chair", "Floor", "Stained Glass", "Altar", "Apse",
                 "Lamp", "Light", "Candle", "Book", "Tent", "Interior Design", "Indoors", "Shop", 
                 "Stage", "Handrail", "Window Display", "Window", "Table", "Desk", "Roof", "Tower", 
                 "Dome", "Path", "Walkway", "Sidewalk", "Home Decor", "Monastery", "Red Carpet",
                 "Bench", "Downtown", "Wall", "Brick", "Fench", "Town", "Path", "Roof", "Sidewalk",
                 "Fireplace", "Clock Tower", "Logo", "Symbol", "Trademark", "Dome", "Mosque",
                 "Train Station", "Terminal", "Train Track", "Rail", "Suburb", "Town", "Tarmac",
                 "Construction Crane", "Dam", "Fountain", "Shelter", "Room", "Pillar", "Spire",
                 "Bell Tower", "Lighthouse", "Steeple", "Garden", "Lobby", "Shrine", "Auditorium",
                 "Bathroom", "Bathtub")

clothing = c("Apparel", "Footwear", "Shoe", "Clothing", "Tie","Accessory", "Accessories", "Suit", 
             "Overcoat", "Coat", "Sunglasses", "Hat", "Fashion", "Pants", "Shorts", "Skirt", 
             "Long Sleeve", "Blazer", "Jacket", "Goggles", "Wristwatch", "Jewelry", "Jeans", "Sleeve",
             "T-Shirt", "Cap", "Baseball Cap", "Bikini")

food = c("Food", "Pasta", "Noodle", "Dish", "Meal", "Vermicelli", "Egg", "Burger", 
         "Bread", "Bun", "Sweets", "Grass", "Vegetation", "Fruit", "Cherry", "Poultry", "Chicken", 
         "Seasoning", "Sandwich", "Orange", "Citrus Fruit", "French Toast", "Toast", "Breakfast",
         "Vegetable", "Stew", "Bowl", "Pizza", "Bean", "Steak", "Ribs", "Cutlery", "Spoon", "Lunch",
         "Cornbread", "Pancake", "Pita", "Glass", "Wine", "Beverage", "Alcohol", "Wine Glass", "Red Wine",
         "Bottle", "Sprout", "Fries", "Lentil", "Fork", "Garlic", "Burrito", "Dessert", "Cake",
         "Birthday Cake", "Dining Table", "Food Court", "Vessel", "Apple", "Produce", "Restaurant",
         "Cafeteria", "Coffee Cup", "Coffee", "Chocolate", "Milk", "Drink", "Cocktail", "Seafood", 
         "Fish", "Lobster", "Spaghetti", "Watermelon", "Dinner", "Soda", "Coke", "Beer", "Cola", "Bakery",
         "Banana")

df$Category = ifelse(is.element(df$Label, nature),"Nature", 
                     ifelse(is.element(df$Label, adventure),"Adventure", 
                            ifelse(is.element(df$Label, beach),"Beach", 
                     ifelse(is.element(df$Label, food),"Food", 
                            ifelse(is.element(df$Label, architecture),"Architecture", 
                                   ifelse(is.element(df$Label, clothing),"Clothing","none"))))))


df$Name = as.factor(df$Name)
write.csv(df, "../Dataset/dataset.csv",row.names = FALSE)
