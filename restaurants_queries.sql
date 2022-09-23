USE restaurants;

#QUERY 1
#Todas las mesas ocupadas de un local en concreto, así como los clientes que las ocupan:
SET @local = 4; #id del local por el que se quiera filtrar
SELECT t.number_table AS 'Table Nº', c.name AS 'Booked name' 
FROM restaurants.tables AS t, restaurants.clients AS c 
WHERE t.isAvailable = 0 AND t.fk_client = c.idclient AND t.fk_local = @local;

#QUERY 2
#Todos los locales marcados como favorito por un cliente, incluyendo la información del local y del cliente:
SET @client = 'Laura'; #nombre del cliente por el que se quiera filtrar
SELECT l.name as 'Restaurant', l.phone AS 'Contact',  l.name_responsible AS 'Owner', 
	c.name as 'Client', c.phone AS 'Client number', c.email AS 'Client email'
FROM restaurants.favorites AS f 
	JOIN restaurants.locals AS l ON f.fk_local = l.idlocal 
    JOIN restaurants.clients AS c ON f.fk_client = c.idclient
WHERE c.name = @client COLLATE utf8mb4_unicode_ci;
