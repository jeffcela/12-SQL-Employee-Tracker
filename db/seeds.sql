USE humanResources_db;

INSERT INTO department (name) VALUES
('Executive'),
('Sales'),
('Production');


INSERT INTO roles (title,salary,department_id) VALUES
-- Executive
('President', 2500000.00,1),
('Cheif Executive Officer',300000,1),
('Cheif Financial Officer',250000,1),
('General Manager',200000,1),

-- Sales
('Sales Manager',80000,2),
('Sales Representative',65000,2),

-- Production
('Director of Operations',150000,3),
('Director of Production',85000,3),
('Team Leader',65000,3),
('Project Manager',35000,3);


INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES
-- Executive
  --President
  ('Jason', 'Gibson', 1,null),
  --CEO
  ('Tony', 'Woods', 2,1),
  --CFO
  ('Jeremy', 'Hoffman', 3,2),
  --GM
  ('Shelia', 'Anderson', 4,2), 

  
--Sales
  --Sales Manager
  ('Rory', 'Walsh', 5,4),
  ('Mel', 'Finn', 6,5),
  ('Tom', 'Furke', 6,5),

--Production
  --DirOp
  ('Tina', 'Pavlo',7,4),
  --DirProd   
  ('John', 'Rivers',8,4),
  --TL
  ('Mary', 'Jones',9,8),
  ('Sharon', 'Chatlos',9,8),
  ('Dave', 'Smith',9,8),
  --PM
  ('Kevin', 'Pratt',10,9),
  ('Sue', 'Lanes',10,9),
  ('Mary-Beth', 'Carlson',10,9),
  ('Shannon', 'Heavinly',10,9),
  ('Nick', 'Martin',10,9),
  ('Jackie', 'Bush',10,9),
  ('Randy', 'Kreilis',10,9),
  ('Jennifer', 'Corless',10,9),
  ('Molly', 'Hall',10,9),
  ('Tim', 'Sawyer',10,9);