-- Actualiza la edad de Aman a 27 y elimina el país de 'Nishant. Salchichas S.A.'
UPDATE Customer SET Age = 27 WHERE CustomerName = 'Aman';
UPDATE Customer SET Country = NULL WHERE CustomerName LIKE '%Salchichas%';

-- Selects para verificar los cambios realizados
SELECT CustomerName, LastName, Country, Age FROM Customer;