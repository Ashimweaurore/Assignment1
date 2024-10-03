SQL> -- Create Departments Table
SQL> CREATE TABLE Departments (
  2      DepartmentID INT PRIMARY KEY,
  3      DepartmentName VARCHAR2(20) NOT NULL
  4  );

Table created.

SQL>
SQL> -- Create Employees Table
SQL> CREATE TABLE Employees (
  2      EmployeeID INT PRIMARY KEY,
  3      Name VARCHAR2(20) NOT NULL,
  4      DepartmentID INT,
  5      FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
  6  );

Table created.

SQL>
SQL> -- Create Projects Table
SQL> CREATE TABLE Projects (
  2      ProjectID INT PRIMARY KEY,
  3      ProjectName VARCHAR2(20) NOT NULL,
  4      DepartmentID INT,
  5      FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
  6  );

Table created.

SQL>
SQL> -- Create EmployeeProjects Table for Many-to-Many relationship
SQL> CREATE TABLE EmployeeProjects (
  2      EmployeeID INT,
  3      ProjectID INT,
  4      PRIMARY KEY (EmployeeID, ProjectID),
  5      FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
  6      FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
  7  );

Table created.

SQL> -- Insert Departments
SQL> INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'HR');

1 row created.

SQL> INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (2, 'Engineering');

1 row created.

SQL> INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (3, 'Sales');

1 row created.

SQL> -- Insert Employees
SQL> INSERT INTO Employees (EmployeeID, Name, DepartmentID) VALUES (1, 'Alice', 1);

1 row created.

SQL> INSERT INTO Employees (EmployeeID, Name, DepartmentID) VALUES (2, 'Bob', 2);

1 row created.

SQL> INSERT INTO Employees (EmployeeID, Name, DepartmentID) VALUES (3, 'Charlie', 2);

1 row created.

SQL> -- Insert Projects
SQL> INSERT INTO Projects (ProjectID, ProjectName, DepartmentID) VALUES (1, 'Project A', 2);

1 row created.

SQL> INSERT INTO Projects (ProjectID, ProjectName, DepartmentID) VALUES (2, 'Project B', 3);

1 row created.

SQL> -- Insert EmployeeProjects
SQL> INSERT INTO EmployeeProjects (EmployeeID, ProjectID) VALUES (2, 1);

1 row created.

SQL> INSERT INTO EmployeeProjects (EmployeeID, ProjectID) VALUES (3, 1);

1 row created.

SQL> INSERT INTO EmployeeProjects (EmployeeID, ProjectID) VALUES (3, 2);

1 row created.

SQL> -- Update an Employee's Department
SQL> UPDATE Employees SET DepartmentID = 3 WHERE EmployeeID = 1;

1 row updated.

SQL> -- Update a Project's Name
SQL> UPDATE Projects SET ProjectName = 'p.A Updated' WHERE ProjectID = 1;

1 row updated.

SQL> -- Delete an Employee
SQL> DELETE FROM Employees WHERE EmployeeID = 1;

1 row deleted.

SQL>
SQL> -- Delete a Project
SQL> DELETE FROM Projects WHERE ProjectID = 2;
DELETE FROM Projects WHERE ProjectID = 2
*
ERROR at line 1:
ORA-02292: integrity constraint (SYSTEM.SYS_C008357) violated - child record found


SQL> SELECT e.Name, d.DepartmentName
  2  FROM Employees e
  3  JOIN Departments d ON e.DepartmentID = d.DepartmentID;

NAME                 DEPARTMENTNAME
-------------------- --------------------
Bob                  Engineering
Charlie              Engineering

SQL> -- Retrieve all Projects with their Department Names and Employees
SQL> SELECT p.ProjectName, d.DepartmentName, e.Name
  2  FROM Projects p
  3  JOIN Departments d ON p.DepartmentID = d.DepartmentID
  4  JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
  5  JOIN Employees e ON ep.EmployeeID = e.EmployeeID;

PROJECTNAME          DEPARTMENTNAME       NAME
-------------------- -------------------- --------------------
p.A Updated          Engineering          Bob
p.A Updated          Engineering          Charlie
Project B            Sales                Charlie

SQL>


