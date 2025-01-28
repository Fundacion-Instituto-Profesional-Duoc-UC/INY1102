-- Eliminar el registro de Aditya
DELETE FROM Customer WHERE CustomerName = 'Aditya';

-- Verificar que el registro de Aditya fue eliminado
SELECT * FROM Customer WHERE CustomerName = 'Aditya';
