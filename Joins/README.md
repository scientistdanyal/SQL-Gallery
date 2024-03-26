# Introduction to JOIN 
<p>Joins play a pivotal role in data analysis, enabling the extraction of valuable insights from multiple tables within a relational database. But how do joins work? Utilizing joins on tables is straightforward. Let's consider Table 1, which comprises multiple columns with distinct headers. Among these columns, one will serve as the <a href='https://www.simplilearn.com/tutorials/sql-tutorial/primary-key-in-sql#:~:text=The%20primary%20key%20in%20SQL,unique%20values%20for%20each%20row.'>primary key</a>, ensuring uniqueness or acting as an identifier for each row. This primary key, in turn, serves as a <a href="https://www.w3schools.com/sql/sql_foreignkey.asp#:~:text=A%20FOREIGN%20KEY%20is%20a,the%20referenced%20or%20parent%20table.">Foreign key<a> in Table 2. Joins leverage these two keys to correlate rows and provide results tailored to our specifications.</p>
<h2>Let's Explore Join types with Examples</h2>
<p>For the examples, we will use information about a pets  and their owners, also procedural records like procedural details and procedural history. Our database contains four tables: pets, petowners, procedureshistory, and proceduresdetails.</p>

## Pets Table:

![pets](https://github.com/scientistdanyal/SQLSnippets/blob/master/Joins/img/pets.png)

## Pet Owners Table

![pets owners](https://github.com/scientistdanyal/SQLSnippets/blob/master/Joins/img/petowners.png)

## Proceduresdetails Table

![proceduresdetails](https://github.com/scientistdanyal/SQLSnippets/blob/master/Joins/img/proceduresdetails.png)

## Procedureshistory table

![proceduresdetails](https://github.com/scientistdanyal/SQLSnippets/blob/master/Joins/img/procedureshistory.png)

<hr>

## <a>Inner Join</a>

<p><a href="https://learnsql.com/blog/sql-join-examples-with-explanations/">Inner join</a> is used when we want to fetch matching results from two tables.</p>

### General Syntax

```sql
SELECT column1, column2, ...
FROM table1
INNER JOIN table2 ON table1.column_name = table2.column_name;
```
<h3>Examples#1</h3>

<p>Let's we want the names of all pets owners along with the names of their pets.</p>

### Query

```sql
SELECT pets.name AS pet_name, 
	petowners.name AS Owner_name
FROM pets
INNER JOIN petowners 
	ON pets.OwnerID = petowners.OwnerID
```

<p>Here's the results:</p>

![innerjoin](https://github.com/scientistdanyal/SQLSnippets/blob/master/Joins/img/innerjoin.png)


<hr>

## <a>Left Join</a>

<p><a href="https://learnsql.com/blog/sql-join-examples-with-explanations/">Left join</a> is used when we want to fetch all records from the left table and their matching records from the right table, if any.</p>


### General Syntax

```sql
SELECT column1, column2, ...
FROM table1
Left JOIN table2 ON table1.column_name = table2.column_name;
```
<h3>Examples#2</h3>

<p>If we want to list all pets and their owner names, including pets that don't have recorded owners.</p>

### Query

```sql
SELECT pets.name AS pet_name, 
	petowners.name AS Owner_name
FROM pets
LEFT JOIN petowners
	ON pets.OwnerID = petowners.OwnerID;
```

<p>Here's the results:</p>

![leftjoin](https://github.com/scientistdanyal/SQLSnippets/blob/master/Joins/img/leftjoin.png)


<hr>

## <a>Right Join</a>

<p><a href="https://learnsql.com/blog/sql-join-examples-with-explanations/">Right join</a> is used when we want to fetch all records from the right table and their matching records from the left table, if any.</p>



### General Syntax

```sql
SELECT column1, column2, ...
FROM table1
RIGHT JOIN table2 ON table1.column_name = table2.column_name;
```
<h3>Examples#3</h3>

<p>If we want to list all pets and their owner names, including owners that don't have recorded pets.</p>

### Query

```sql
SELECT pets.name AS pet_name, 
       petowners.name AS owner_name
FROM pets
RIGHT JOIN petowners
    ON pets.OwnerID = petowners.OwnerID;
```

<p>Heres the results:</p>

![rightjoin](https://github.com/scientistdanyal/SQLSnippets/blob/master/Joins/img/rightjoin.png)

<hr>


