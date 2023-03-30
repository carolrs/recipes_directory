TRUNCATE TABLE recipes RESTART IDENTITY; 

INSERT INTO recipes ("id", "name", "average_time","rating") VALUES
(1, 'Pancakes', '15', 5),
(2, 'Meat pie', '45', 4),
(3, 'Carbonara', '30',5);
