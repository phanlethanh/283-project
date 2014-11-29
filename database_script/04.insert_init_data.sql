-- Statuses of product
INSERT INTO status(name) VALUES ('new');
INSERT INTO status(name) VALUES ('hot');
INSERT INTO status(name) VALUES ('waiting');
INSERT INTO status(name) VALUES ('in stock');
INSERT INTO status(name) VALUES ('out of stock');

-- Statuses of order
INSERT INTO status(name) VALUES ('create');
INSERT INTO status(name) VALUES ('shipping');
INSERT INTO status(name) VALUES ('done');
INSERT INTO status(name) VALUES ('cancel');