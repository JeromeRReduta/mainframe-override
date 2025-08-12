-- jrreduta



-- find info from the forum post, which took place in 2048 and includes the text "My dad works there and he's got some serious inside intel."
SELECT author from forum_posts WHERE date >= '2048-01-01' AND date <= '2048-12-31' AND content ILIKE '%My dad works there and he_s got some serious inside intel.%';

-- find forum_account with smart-money-44 username
SELECT * from forum_accounts WHERE username='smart-money-44';

-- find accounts w/ last name "Steele" - only 1 exists in both databases
SELECT * from emptystack_accounts WHERE last_name ILIKE '%STEELE%';
SELECT * from forum_accounts WHERE last_name ILIKE '%STEELE%';




/** 

mainframe_override=# SELECT * from emptystack_accounts WHERE last_name ILIKE '%STEELE%';
    username    |  password   | first_name | last_name
----------------+-------------+------------+-----------
 triple-cart-38 | password456 | Andrew     | Steele
 lance-main-11  | password789 | Lance      | Steele
(2 rows)

mainframe_override=# SELECT * from forum_accounts WHERE last_name ILIKE '%STEELE%';
    username     | first_name | last_name
-----------------+------------+-----------
 sharp-engine-57 | Andrew     | Steele
 stinky-tofu-98  | Kevin      | Steele
 smart-money-44  | Brad       | Steele
*/

 -- find message to Andrew Steel from boss
 SELECT * FROM emptystack_messages WHERE "to" ILIKE 'triple-cart-38' AND "from" ILIKE '%boss%';

-- find id of project taxi
SELECT * FROM emptystack_projects WHERE code ILIKE 'TAXI';

/*
WARNING: admin access required. Unauthorized access will be logged.
Username: your-boss-99
Password: notagaincarter
Welcome, your-boss-99.
Project ID: DczE0v2b
Initiating project shutdown sequence...
5...
4...
3...
2...
1...
Project shutdown complete.
*/

