# pandas df for practice with group_by on several columns and on index
df = pd.DataFrame({'A' : ['foo', 'bar', 'foo', 'bar',
                          'foo', 'bar', 'foo', 'foo'],
                   'B' : ['one', 'one', 'two', 'three',
                          'two', 'two', 'one', 'three'],
                   'C' : np.random.randn(8),
                   'D' : np.random.randn(8)})

df

     A      B         C         D
0  foo    one  0.469112 -0.861849
1  bar    one -0.282863 -2.104569
2  foo    two -1.509059 -0.494929
3  bar  three -1.135632  1.071804
4  foo    two  1.212112  0.721555
5  bar    two -0.173215 -0.706771
6  foo    one  0.119209 -1.039575
7  foo  three -1.044236  0.271860


# find and replace because I haven't figured out how to lambda this yet
food_ing_df = food_df.dropna(axis=0, subset=['categories_en'])
food_ing_df = food_ing_df.dropna(axis=0, subset=['energy_100g'])
food_ing_df = food_ing_df.dropna(axis=0, subset=['proteins_100g'])
food_ing_df = food_ing_df.dropna(axis=0, subset=['carbohydrates_100g'])
food_ing_df = food_ing_df.dropna(axis=0, subset=['saturated-fat_100g'])
food_ing_df = food_ing_df.dropna(axis=0, subset=['fiber_100g'])
food_ing_df = food_ing_df.dropna(axis=0, subset=['fat_100g'])
food_ing_df = food_ing_df.dropna(axis=0, subset=['sugars_100g'])
food_ing_df

# removing spurious characters from category lists for mapping function
# made coconut it's own category 
# moved item treenuts to seed_nut (changed category from seed)
# changed category sugar to sweet
Oil = ['Oilcrops', 'Oil']
Grain = ['Pulse', 'Cereal', 'Rice', 'Barley', 'Oat', 'Maize', 'Bean', 'Rye', 'Millet', 'Sorghum', 'Wheat', 'Lentil', 'Lentil'] but not beer but not coffee but not chocolate
Spice = ['Pepper', 'Cloves', 'Spice']
Plant = ['Cassava', 'Root', 'Plant', 'Yam', 'Plantain',  'potatoes', 'potato', 'Onions']
Fruit = ['Date', 'Banana', 'Pineapple', 'Grape', 'Lemon', 'Lime', 'Fruits', 'Apples', 'Olives', 'Fruit', 'Grapefruit', 'Orange', 'Mandarin', 'Citrus'] but not wine
Seafood = ['Cephalopod', 'Squid', 'Cuttlefish', 'Octopus', 'Aquatic', 'Crustacean', 'Crab', 'Shrimp', 'Langoustine', 'Lobster', 'Sea', 'Fish', 'Pelagic', 'Molluscs', 'Clam', 'Oyster', 'Mussel', 'Marine', 'Seafood', 'Shellfish', 'Freshwater']
Seed_Nut= ['Seed', 'Nut', 'Cottonseed', 'Rapeseed', 'Mustardseed', 'Sunflower', 'Sesame', 'Groundnut', 'Peanut', 'Treenut', 'Almond', 'Walnut', 'Pecan', 'Cashew', 'Macadamia', 'Brazil'] but not Oil
Alcohol = ['Alcohol', 'Alcoholic', 'Beer', 'Wine', 'Vodka', 'Whiskey', 'Rum', 'Cider']
Dry Goods = ['Cocoa', 'Coffee', 'Tea', 'Mate']
Meat = ['Poultry', 'Chicken', 'Turkey', 'Mutton', 'Goat', 'Lamb', 'Pigmeat', 'Pig', 'Pork', 'Bovine', 'Cow', 'Beef', 'Offal', 'Meat', 'Egg', 'Animal', 'Fat'] but not oil but not dairy
Dairy = ['Cream', 'Butter', 'Ghee', 'Milk', 'Butter']
Sweet = ['Cane', 'Honey', 'Sugar', 'Sweet', 'Sweeteners', 'Candy', 'Choco']
Infant = ['Infant food']
Other = ['Miscellaneous']
Vegetable = ['Pimento', 'Vegetables', 'Tomatoes', 'Pea', 'Vegetable', 'Cabbage', 'Broccoli', 'Cauliflower', 'Kale', 'Sprout', 'Cruciferous', 'Cucumber']
Palm = ['Palm']
Soy = ['Soy']
Coconut = ['Coconut', 'Copra']

list_cats = ['Oil', 'Grain', 'Spice', 'Plant', 'Fruit', 'Seafood', 'Seed_Nut', 'Alcohol', 'Dry_Goods', 'Meat', 'Dairy', 'Sweet', 'Infant', 'Other', 'Vegetable', 'Palm', 'Soy', 'Coconut']

 = ['Oil_String', 'Grain_String', 'Spice_String', 'Plant_String', 'Fruit_String', 'Seafood_String', 'Seed_Nut_String', 'Alcohol_String', 'Dry_Goods_String', 'Meat_String', 'Dairy_String', 'Sweet_String', 'Infant_String', 'Other_String', 'Vegetable_String', 'Palm_String', 'Soy_String', 'Coconut']


map_list = [Oil, Grain, Spice, Plant, Fruit, Seafood, Seed_Nut, Alcohol, Dry_Goods, Meat, Dairy, Sweet, Infant, Other, Vegetable, Palm, Soy, Coconut]

list_of_strings = ['Oil_String', 'Grain_String', 'Spice_String', 'Plant_String', 'Fruit_String', 'Seafood_String', 'Seed_Nut_String', 'Alcohol_String', 'Dry Goods_String', 'Meat_String', 'Dairy_String', 'Sweet_String', 'Infant_String', 'Other_String', 'Vegetable_String', 'Palm_String', 'Soy_String', 'Coconut_String']
string_list = [Oil_String, Grain_String, Spice_String, Plant_String, Fruit_String, Seafood_String, Seed_Nut_String, Alcohol_String, Dry_Goods_String, Meat_String, Dairy_String, Sweet_String, Infant_String, Other_String, Vegetable_String, Palm_String, Soy_String, Coconut]
