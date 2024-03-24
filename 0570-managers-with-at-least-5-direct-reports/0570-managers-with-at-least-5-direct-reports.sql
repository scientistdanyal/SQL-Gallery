# Write your MySQL query statement below
SELECT e1.name 
FROM Employee e1 
LEFT JOIN Employee e2 ON e1.id = e2.managerId 
GROUP by e1.Id
HAVING COUNT(*) >= 5;