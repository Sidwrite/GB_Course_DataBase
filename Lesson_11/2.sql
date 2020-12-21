// 1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.
SADD ip '127.0.0.1' '127.0.0.2' '127.0.0.3'
//Невозможно добавить в коллекцию уже имеющиейся в ней ip адрес, только уникальные значения
SADD ip '127.0.0.1' 
//просмотрим список уникальных ip
SMEMBERS ip
// кол-во адресов в коллекции
SCARD ip

// 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу
// и наоброт, поиск электронного адреса пользователя по его имени.

// Так как Redis не позволяет использовать в запросах значения объектов, т.е. поиск можно производить только по ключу, то
// в связи с этим приходится выбирать, что будет ключем, который будет использоваться для поиска значения, имя или email.

set sidwrite@gmail.com sidwrite 
set sidwrite sidwrite@gmail.com

get sidwrite@gmail.com 
get sidwrite 

// 3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
// Так как в плане выбора структуры БД mongodb дает широкий выбор,
// то оптимальных вариантов организации структуры БД может довольно много,
// все зависит от предметной области

// *** Табл. products ***
use products
db.products.insert({"name": "Intel Core i3-8100", "description": "Процессор для настольных ПК", "price": "8000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}) 

db.products.insertMany([
	{"name": "AMD FX-8320", "description": "Процессор для настольных ПК", "price": "4000.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
	{"name": "AMD FX-8320E", "description": "Процессор для настольных ПК", "price": "4500.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}])

db.products.find().pretty()
db.products.find({name: "AMD FX-8320"}).pretty()


// *** Табл. catalogs ***
use catalogs
db.catalogs.insertMany([{"name": "Процессоры"}, {"name": "Мат.платы"}, {"name": "Видеокарты"}])
