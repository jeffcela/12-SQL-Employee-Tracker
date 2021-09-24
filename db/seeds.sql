USE humanResources_DB;

INSERT INTO department (name) VALUES
('Leadership'),
('Sales'),
('Associate');


INSERT INTO roles (title,salary,department_id) VALUES
-- Managers
('Store Manager', 100000.00,1),
('Assistant Manager',80000.00,1),
('Manager',65000.00,1),
('Sales Manager',80000.00,1),

-- Sales
('Sales Representative',65000.00,2),

-- Associates
('Cashier',20000.00,3),
('Product Knowledge Expert',25000.00,3),
('Stock Associate',20000.00,3),
('Associate',19000.00,3);


INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES
  ('Jason', 'Gibson', 1,null),
  ('Tony', 'Woods', 2,1),
  ('Jeremy', 'Hoffman', 3,2),
  ('Shelia', 'Anderson', 4,2), 
  ('Rory', 'Walsh', 5,4),
  ('Mel', 'Finn', 5,4),
  ('Tom', 'Furke', 5,4),
  ('Tina', 'Pavlo',6,3),
  ('John', 'Rivers',7,3),
  ('Mary', 'Jones',8,3),
  ('Sharon', 'Chatlos',8,3),
  ('Dave', 'Smith',8,3),
  ('Kevin', 'Pratt',9,3),
  ('Sue', 'Lanes',9,3),
  ('Mary-Beth', 'Carlson',9,3),
  ('Shannon', 'Heavinly',9,3),
  ('Nick', 'Martin',9,3),
  ('Jackie', 'Bush',9,3),
  ('Randy', 'Kreilis',9,3),
  ('Jennifer', 'Corless',9,3),
  ('Molly', 'Hall',9,3),
  ('Tim', 'Sawyer',9,3);