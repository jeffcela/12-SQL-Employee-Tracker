-- This is to make sure that there is no db names when you download and run this program
DROP DATABASE IF EXISTS humanResources_DB;
-- This will create a new db once the original db is dropped
CREATE DATABASE humanResources_DB;

-- This is to ensure that the correct db is being used
USE humanResources_DB;

-- This creates the first table 1/3 that will house the department data
CREATE TABLE department (
  id INT AUTO_INCREMENT NOT NULL,
  name VARCHAR(30) UNIQUE NOT NULL,
  PRIMARY KEY (id)
);

-- This creates the first table 2/3 that will house the role assignment for each employee data
CREATE TABLE roles (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES department(id)
  ON DELETE SET NULL
);

-- This creates the first table 3/3 that will house the employee data
CREATE TABLE employee (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT,
  manager_id INT,
  CONSTRAINT fk_roles FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE SET NULL
);