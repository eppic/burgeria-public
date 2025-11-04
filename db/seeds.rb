# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# menus

burger_menu = Menu.create(name: "Burgers")
fries_menu = Menu.create(name: "Fries")
drinks_menu = Menu.create(name: "Drinks")
salads_menu = Menu.create(name: "Salads")
pastas_menu = Menu.create(name: "Pastas")
desserts_menu = Menu.create(name: "Desserts")
soups_menu   = Menu.create(name: "Soups")
burger_list = [
  [ "Gangster Burger Royal", [ "Rindfleisch-Patty", "Salat", "Käse", "Knoblauchsauce", "Grillgemüse", "Barbecue-Chips" ], [ "A", "C", "F", "G", "L", "M", "N", "O" ], 15.99, "burger1.jpg" ],
  [ "Ultimate Cheese Burger", [ "Doppelter Rindfleisch-Patty", "Salat", "210g Käse", "Caramelized Onions" ], [ "A", "C", "F", "G", "N" ], 18.50, "burger2.jpg" ],
  [ "Feierabend Burger Supreme", [ "Zartes Hummerfilet", "Coleslaw", "Cognac", "Geräucherter Gruyère" ], [ "A", "C", "D", "F", "G", "O" ], 23.99, "burger3.jpg" ],
  [ "Classic Burger", [ "Rindfleisch-Patty", "Salat", "Käse" ], [ "A", "C", "G", "L", "N", "O" ], 11.99, "burger4.jpg" ],
  [ "Kinderburger", [ "80g Rindfleisch-Patty", "Salat", "Käse", "Ketchup" ], [ "A", "C", "F", "M", "N", "O" ], 8.99, "burger5.jpg" ],
  [ "BREAK-THE-LAB Burger", [ "Rinder Patty", "Rosinen", "Mandeln", "Laborschleim" ], [ "A", "C", "F", "H", "N", "O" ], 6.90, "burger6.jpg" ]
]

fries_list = [
  [ "Classic Fries", [ "Salz", "Dip" ], [ "C", "G" ], 5.41, "fries1.jpg" ],
  [ "Süsskartoffel Fries", [ "Salz", "Dip" ], [ "C", "G" ], 6.20, "fries2.jpg" ],
  [ "Loaded Peter Lustig Fries", [ "Löwenzahn", "Rosmarin", "Eingelegter Knoblauch", "Salz", "Dip" ], [ "C", "F", "G" ], 12, "fries3.jpg" ],
  [ "Loaded Piraten Fries", [ "Rindfleischstreifen", "Rumkugeln", "Hot Sauce", "Mais", "Salz", "Dip" ], [ "A", "D", "C", "F", "G" ], 13.40, "fries4.jpg" ],
  [ "Loaded Chili Fries", [ "Carolina Reaper", "Jalapeño", "Mama Liz's Chili Oil", "Salz", "Dip" ], [ "B", "C", "F", "G" ], 14, "fries5.jpg" ]
]

drinks_list = [
  [ "Fritz Cola", [], [], 4, "drinks1.jpg" ],
  [ "Homemade Eistee", [], [], 6.70, "drinks2.jpg" ],
  [ "Orangenlimo", [], [], 3.80, "drinks3.jpg" ],
  [ "Calpis Wasser", [], [], 4.50, "drinks4.jpg" ],
  [ "Wasser", [], [], 2.50, "drinks4.jpg" ],
  [ "Sprudelwasser", [], [], 2.00, "drinks4.jpg" ],
  [ "Fanta", [], [], 3.00, "drinks7.jpg" ],
  [ "Spezi", [], [], 3.50, "drinks8.jpg" ],
  [ "Bier", [], [], 4.00, "drinks9.jpg" ],
  [ "Rotwein", [], [], 5.00, "drinks10.jpg" ]
]

salads_list = [
  [ "Caesar-Salad", [ "Blattsalate", "Croutons", "Parmesan", "Caesar-Dressing" ], [ "D" ], 9.99, "salad1.jpg" ],
  [ "Griechischer Salat", [ "Tomaten", "Gurken", "Oliven", "Feta" ], [ "F" ], 10.25, "salad2.jpg" ],
  [ "Fancy Obstsalat", [ "Saisonale Früchte", "Minze", "Honig" ], [ "" ], 7.75, "salad3.jpg" ]
]

pastas_list = [
  [ "Spaghetti Bolognese", [ "Spaghetti", "Hackfleisch", "Tomatensauce" ], [ "G" ], 13.99, "pasta1.jpg" ],
  [ "Penne Arrabbiata", [ "Penne", "Chili", "Tomatensauce", "Knoblauch" ], [ "G" ], 12.50, "pasta2.jpg" ],
  [ "Lulatsch Linguini", [ "Linguini", "Sahnesauce", "Parmesan", "Gurken" ], [ "D" ], 14.25, "pasta3.jpg" ],
  [ "Pesto-Pasta", [ "Nudeln", "Basilikum-Pesto", "Pinienkerne", "Parmesan" ], [ "N" ], 13.75, "pasta4.jpg" ]
]

desserts_list = [
  [ "Schokoladenkuchen", [ "Mehl", "Kakao", "Zucker", "Eier" ], [ "G" ], 6.50, "dessert1.jpg" ],
  [ "Kantiger Käsekuchen", [ "Frischkäse", "Keksboden", "Sauerrahm" ], [ "G" ], 7.25, "dessert2.jpg" ],
  [ "Fruchtiger Franz", [ "Saisonale Früchte", "Vanillecreme", "Teig" ], [ "" ], 6.75, "dessert3.jpg" ],
  [ "ALARM-Becher", [ "Eiscreme", "Schokoladensoße", "Nüsse", "Kirsche" ], [ "N" ], 5.99, "dessert4.jpg" ],
  [ "Apfelstrudel", [ "Äpfel", "Zimt", "Blätterteig", "Rosinen" ], [ "G" ], 6.00, "dessert5.jpg" ],
  [ "Schwarzwälder Kirschtorte", [ "Schokolade", "Kirschen", "Sahne", "Kirschwasser" ], [ "G" ], 7.50, "dessert6.jpg" ]
]

soups_list = [
  [ "Somatentuppe", [ "Tomaten", "Basilikum", "Sahne" ], [ "" ], 5.99, "soup1.jpg" ],
  [ "Nudelige Suppe", [ "Huhn", "Nudeln", "Karotten", "Sellerie" ], [ "" ], 6.50, "soup2.jpg" ]
]


[ burger_list, fries_list, drinks_list, salads_list, pastas_list, desserts_list, soups_list ].each_with_index do |list, index|
  menu = [ burger_menu, fries_menu, drinks_menu, salads_menu, pastas_menu, desserts_menu, soups_menu ][index]
  list.each do |name, ingredients, allergies, price, image|
    menu.items.create(name: name, ingredients: ingredients, allergies: allergies, price: price, image: image)
  end
end

# tables

tables_list = [
  [ "1", 2 ],
  [ "2", 8 ],
  [ "3", 10 ],
  [ "4", 10 ],
  [ "5", 4 ],
  [ "6", 6 ],
  [ "7", 4 ],
  [ "8", 8 ],
  [ "9", 2 ]
]

tables_list.each do |table_id, max_capacity|
  Table.create(table_id: table_id, max_capacity: max_capacity)
end

# reservations

reservation_list = [
  [ "2025-02-03", "18:00:00", "Doe", "johndoe@123.com", "1" ],
  [ "2025-02-04", "19:00:00", "Smith", "janesmith@456.com", "2" ],
  [ "2025-02-05", "20:00:00", "Brown", "charliebrown@789.com", "7" ]
]

reservation_list.each do |reservation_date, reservation_time, reservation_name, email, table_id|
  Reservation.create(reservation_date: reservation_date, reservation_time: reservation_time, reservation_name: reservation_name, email: email, table_id: table_id)
end

# business hours

business_hours_list = [
  [ "Montag", true, "10:00:00", "22:00:00" ],
  [ "Dienstag", false, "11:00:00", "21:00:00" ],
  [ "Mittwoch", false, "12:00:00", "20:00:00" ],
  [ "Donnerstag", true, "13:00:00", "23:00:00" ],
  [ "Freitag", false, "14:00:00", "00:00:00" ],
  [ "Samstag", false, "15:00:00", "01:00:00" ],
  [ "Sonntag", false, "16:00:00", "22:00:00" ]
]

business_hours_list.each do |day_of_week, is_closed, open_time, close_time|
  BusinessHour.create(day_of_week: day_of_week, is_closed: is_closed, open_time: open_time, close_time: close_time)
end

# closed_days

closed_days_list = [
  "2025-02-01",
  "2025-02-02",
  "2025-03-15",
  "2025-04-10",
  "2025-05-25",
  "2025-06-30",
  "2025-07-04"
]

closed_days_list.each do |closed_date|
  ClosedDay.create(date: closed_date)
end
