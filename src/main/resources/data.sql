INSERT INTO categories(name) VALUES
('Shoyu'), ('Shio'), ('Miso');
INSERT INTO items(category_id, name, description, price)
SELECT c.id, 'Tokyo Shoyu', '醤油ベースのラーメン', 850.00
FROM categories c WHERE c.name='Shoyu';
INSERT INTO items(category_id, name, description, price)
SELECT c.id, 'Sapporo Miso', '味噌ベースのラーメン', 950.00
FROM categories c WHERE c.name='Miso';