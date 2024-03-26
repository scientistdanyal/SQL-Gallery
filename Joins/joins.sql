-- 1. List the names of all pet owners along with the names of their pets.

SELECT pets.name AS pet_name, 
	petowners.name AS Owner_name
FROM pets
LEFT JOIN petowners 
	ON pets.OwnerID = petowners.OwnerID
UNION 
SELECT petowners.name, 
	pets.name 
FROM petowners
RIGHT JOIN pets
	ON pets.OwnerID = petowners.OwnerID;


-- 2. List all pets and their owner names, including pets that don't have recorded owners.
-- Ans: for this we will use left join to print all pets and their owner names, including pets that don't have recorded owners (NULL).
SELECT pets.name AS pet_name, 
	petowners.name AS Owner_name
FROM pets
LEFT JOIN petowners
	ON pets.OwnerID = petowners.OwnerID;

-- 3. Combine the information of pets and their owners, including those pets without owners and owners without pets.
SELECT pets.name AS pet_name, petowners.name AS owner_name
FROM pets
LEFT JOIN petowners
	ON pets.OwnerID = petowners.OwnerID

UNION 

SELECT pets.name AS pet_name, petowners.name AS owner_name
FROM petowners 
LEFT JOIN pets
	ON petowners.OwnerID = pets.OwnerID;

-- 4. List all pet owners and the number of dogs they own.
SELECT petowners.name AS owner_name, COUNT(pets.kind) AS num_dogs_owned
FROM petowners
LEFT JOIN pets
    ON petowners.OwnerID = pets.OwnerID
WHERE pets.kind = 'Dog'
GROUP BY petowners.name;


-- 5. Identify pets that have not had any procedures.
SELECT pets.PetID AS pet_ID, pets.name AS pet_name
FROM pets
LEFT JOIN procedureshistory
	ON pets.PetID = procedureshistory.PetID
WHERE procedureshistory.PetID IS NULL;


-- 6. Find the name of the oldest pet.
SELECT name, age FROM pets
ORDER BY Age DESC
Limit 1;

-- 7. Find the details of procedures performed on 'Cuddles'.
SELECT *
FROM pets
LEFT JOIN procedureshistory ON pets.PetID = procedureshistory.PetID
WHERE pets.name = 'Cuddles';

-- 8. List the pets who have undergone a procedure called 'VACCINATIONS'.

SELECT pets.name AS pet_name
FROM pets
LEFT JOIN procedureshistory 
	ON pets.PetID = procedureshistory.PetID
WHERE procedureshistory.proceduretype = 'VACCINATIONS';

-- 9. Count the number of pets of each kind.
SELECT Kind, COUNT(Kind) AS total_for_each_kind
FROM pets
GROUP BY Kind;

-- 10.Group pets by their kind and gender and count the number of pets in each group.
SELECT Kind,Gender ,COUNT(Kind) AS total_for_each_kind
FROM pets
GROUP BY Kind, Gender;


-- 11.Show the average age of pets for each kind, but only for kinds that have more than 5 pets.
SELECT Kind, AVG(Age) AS Average_age
FROM pets
GROUP BY Kind
HAVING COUNT(Kind) > 5;

-- 12.Find the types of procedures that have an average cost greater than $50.
SELECT procedureType, AVG(Price) AS averagePrice
FROM proceduresdetails
GROUP BY procedureType
HAVING AVG(Price) > 50;


-- 13.Classify pets as 'Young', 'Adult', or 'Senior' based on their age. Age less then 3, Young, Age between 3and 8 Adult, else Senior.
SELECT name, 
CASE
	WHEN age < 3 THEN 'Young'
    WHEN age < 8 THEN 'Adult'
    ELSE 'Senior'
    END AS pet_classification
FROM pets;


-- 14.Show the gender of pets with a custom label ('Boy' for male, 'Girl' for female).
SELECT name, 
CASE
	WHEN Gender = 'male' THEN 'Boy'
    WHEN Gender = 'female' THEN 'Girl'
    ELSE 'GUD'             -- Gender Undefined
    END AS pet_gender
FROM pets;

-- 15.For each pet, display the pet's name, the number of procedures they've had, and a
-- status label: 'Regular' for pets with 1 to 3 procedures, 'Frequent' for 4 to 7
-- procedures, and 'Super User' for more than 7 procedures.
SELECT pets.name AS pet_name,
	COUNT(procedureshistory.PetID) AS num_procedures,
	CASE
		WHEN COUNT(procedureshistory.PetID) BETWEEN 1 AND 3 THEN 'Regular'

		WHEN COUNT(procedureshistory.PetID) BETWEEN 4 AND 7 THEN 'Frequent'

		ELSE 'Super User'
		END AS status
FROM pets
LEFT JOIN procedureshistory
	ON pets.PetID = procedureshistory.PetID
GROUP BY pets.name;
