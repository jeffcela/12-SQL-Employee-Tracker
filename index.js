// Required items
const logo = require("asciiart-logo");
const consoleTable = require("console.table");
const inquirer = require('inquirer');
const mysql = require("mysql2");
const config = require("./package.json");

const connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: '',
    password: '',
    database: 'humanResources_DB'
});
connection.connect((err => {
    if (err) throw err;
    console.log("Tap tap tap, is this thing on?")
}));

console.log(logo(config).render());

const employeeDatabaseQuestions = async () => {
  const response = await inquirer
    .prompt([
      {
        type: "list",
        name: "select",
        message: "Choose from below",
        choices: [
          "View Departments",
          "View Roles",
          "View Employees",
          "Add Department",
          "Add Employee",
          "Change Employee Role",
          "QUIT",
        ],
      },
    ]);
  switch (response.select) {
    case "View Departments":
      viewDepartments();
      break;
    case "View Roles":
      viewRoles();
      break;
    case "View Employees":
      viewEmployees();
      break;
    case "Add Department":
      addDepartment();
      break;
    case "Add Employee":
      addEmployee();
      break;
    case "Change Employee Role":
      changeRole();
      break;
    default:
      quit();
  }
};
quit = () => {
  console.log(logo({ name: "Good Bye" }).render());
  return process.exit();
};
// view dept
const viewDepartments = () => {
  console.log(logo({ name: "ALL DEPARTMENTS" }).render());
  connection.query("SELECT * FROM department ORDER BY name DESC;", function (
    err,
    res
  ) {
    if (err) throw err;
    console.table(res);
  });
  employeeDatabaseQuestions();
};
// view roles
const viewRoles = () => {
  console.log(logo({ name: "ALL ROLES" }).render());
  connection.query(
    "SELECT roles.id, title, salary, department.name AS department FROM roles LEFT JOIN department ON roles.department_id = department.id;",
    function (err, res) {
      if (err) throw err;
      console.table(res);
      employeeDatabaseQuestions();
    }
  );
  
};
// view the employees
const viewEmployees = () => {
  console.log(logo({ name: "ALL EMPLOYEES" }).render());
  connection.query(
    "SELECT emp.id, emp.first_name, emp.last_name, r.title, d.name AS department, r.salary,CONCAT (m.last_name, ', ', m.first_name) AS manager FROM employee AS emp INNER JOIN roles AS r ON emp.role_id = r.id INNER JOIN department AS d ON r.department_id = d.id LEFT JOIN employee AS m ON emp.manager_id = m.id ORDER BY emp.id;",
    function (err, res) {
      if (err) throw err;
      console.table(res);
      employeeDatabaseQuestions();
    }
  );
  
};
// Add a new dept
const addDepartment = async () => {
  const responsed = await inquirer
    .prompt([
      {
        type: "input",
        name: "newDepartment",
        message: "Type the name of the department you want to add: ",
      },
    ]);
  const response = connection.query(
    `INSERT INTO departments SET ?`,
    { dept_name: response.newDepartment },
    function (err, res) {
      if (err)
        throw err;
      viewDepartments();
      employeeDatabaseQuestions();
    }
  );
};

// Adding a new Employee
const addEmployee = () => {
  // Inquirer prompts to obtain the new employee data to add to the db
  return inquirer.prompt([
    {
      type: "input",
      name: "first_name",
      message: "Enter employee first name?",
    },
    {
      type: "input",
      name: "last_name",
      message: "Enter employee last name",
    },
    {
      type: "list",
      name: "role_id",
      choices: 
      [
        "Sales Representative",
        "Cashier",
        "Product Knowledge Expert",
        "Stock Associate", 
        "Associate"
      ],
    },
]).then((newEmployee) => {
    const { first_name, last_name, role_id } = newEmployee
     
  })

};

employeeDatabaseQuestions();