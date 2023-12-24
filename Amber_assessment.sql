create table Employee1
(
	Employee_id int,
	Name varchar(20),
	Department_id int,
	Hire_date date
)
insert into Employee1 values(100, 'Bhavesh', 201, '30-05-2022');
insert into Employee1 values(101, 'Ramesh', 220, '01-02-2022');
insert into Employee1 values(102, 'Prashant', 302, '10-02-2022');
insert into Employee1 values(103, 'Nirmala', 187, '04-01-2022');
insert into Employee1 values(104, 'Sandhya', 254, '30-08-2022');
select * from Employee1;

create table Salary1
(
	Employee_id int,
	Salary int,
	Effective_date date
)
insert into Salary1 values(100, 78000, '04-03-2022');
insert into Salary1 values(101, 55000, '01-01-2022');
insert into Salary1 values(102, 42000, '13-03-2022');
insert into Salary1 values(103, 38000, '28-05-2022');
insert into Salary1 values(104, 57000, '17-06-2022');
select * from Salary1;

--Write an SQL query to retrieve the names of employees along with their department names. 
--If an employee doesn't belong to any department, the department name should be shown as "Unassigned"
select Name, Department_id from Employee1;

--Write an SQL query to find the total number of employees in each department.
select count(Employee_id) as Total_emp from Employee1;

--Write an SQL query to find departments where the average salary is greater than 5500.00.
select e.Department_id, avg(s.Salary) as avg_sal from Employee1 e
left join Salary1 s on e.Employee_id = s.Employee_id
having avg_sal > 5500;

--Write an SQL query to retrieve the names and hire dates of employees hired after '2022-03-01'.
select Name, Hire_date from Employee1
where Hire_date > '2022-03-01';

--Write an SQL query to calculate the average salary for each employee along with their salary, 
--effective date, and the difference between their salary and the average salary.
select avg(Salary) as avg_sal, Salary, Effective_date from Salary1
group by Effective_date, Salary;

SELECT
           a.Effective_date, 
           b.Salary,  
          (a.Salary - b.avg_salary) as salary_difference 
FROM employee AS a
INNER JOIN (
     SELECT  avg(Salary)as avg_salary from Employee1 group by    
             Effective_date) as b
    ON a.Employee_id = b.Employee_id;

