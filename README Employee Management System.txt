README: Employee Management System Database
-------------------------------------------
Problem Statement
-----------------
This database system is designed to manage employee records, departments, and projects within a fictional company. The goal is to provide a structured way to store, retrieve, and manage information about employees, their associated departments, and the projects they work on. The system aims to facilitate:

Tracking of employee information and their departmental assignments.
Management of various projects and their associations with departments.
Maintaining relationships between employees and projects, allowing for an efficient allocation of human resources.
Database Structure
------------------
The database consists of the following tables:
----------------------------------------------

Departments
-----------

DepartmentID: Unique identifier for each department.
DepartmentName: Name of the department.

Employees
---------

EmployeeID: Unique identifier for each employee.
Name: Name of the employee.
DepartmentID: Foreign key linking to the department the employee belongs to.

Projects
--------

ProjectID: Unique identifier for each project.
ProjectName: Name of the project.
DepartmentID: Foreign key linking to the department managing the project.

EmployeeProjects
----------------

EmployeeID: Foreign key linking to an employee.
ProjectID: Foreign key linking to a project.
This table creates a many-to-many relationship between employees and projects.

Explanation of Results and Transactions
---------------------------------------

Table Creation: The tables were successfully created, establishing the necessary relationships among departments, employees, and projects.

Data Insertion: Employees, departments, and projects were inserted without errors. The EmployeeProjects table was also populated to define which employees are associated with which projects.

Data Updates: The update commands successfully modified employee department assignments and project names, reflecting changes in the system.

Data Deletion: Employees and projects were deleted as specified, and the referential integrity maintained by foreign keys ensured no orphaned records were left behind.

Data Retrieval: The join queries retrieved relevant employee and department information as well as project details, demonstrating how employees are associated with various projects and departments.

Conclusion
----------
This Employee Management System provides a robust framework for managing key organizational data. The implemented SQL commands effectively support all required functionalities, including data creation, retrieval, updates, and deletions. Future enhancements could include adding more attributes or implementing additional functionality, such as performance tracking or reporting features.