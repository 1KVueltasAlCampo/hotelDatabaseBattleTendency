--Cuantos hoteles hay registrados?
select count(*) 
FROM Hotel;
--Cual es el precio promedio de un cuarto?
select avg(price) 
FROM Room;
--Cuántos huéspedes diferentes se llaman Juan (o tienen el nombre Juan, por ejemplo Juan Felipe también es correcto)?
select count(guestName) 
FROM Guest
WHERE guestName like '%Juan%';
--Cuál podría ser  el ingreso total por noche, por todos los cuartos de tipo doble?
select sum(price) 
FROM Room 
WHERE type = 'Double';
--Cuál es el ingreso total por noche, por todos los cuartos de tipo double que han sido reservados
select sum(price) 
FROM Room
WHERE exists(
   select roomNo
   FROM Booking 
   WHERE Room.roomNo = Booking.roomNo 
   and Room.type = 'Double'
 );