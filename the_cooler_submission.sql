-- jrreduta but cooler

/** INIT.SQL */
-- produce "steele" as a last name
-- note: apparently we don't even need the where filter since accs.username and posts.authors only intersect on kid Steele, but that's a happy little coincidence
(SELECT last_name from forum_accounts accs
    INNER JOIN forum_posts posts
    ON accs.username = posts.author
    WHERE 
        posts.date >= '2048-01-01'
        AND posts.date <= '2048-12-31'
        AND posts.content ILIKE '%My dad works there and he_s got some serious inside intel.%');


(SELECT stack.first_name, stack.last_name, stack.username, stack.password
    FROM emptystack_accounts stack
    INNER JOIN forum_accounts forum
    ON
        stack.first_name = forum.first_name
        AND stack.last_name = forum.last_name
    WHERE stack.last_name ILIKE 'Steele'
);

/** output:
 first_name | last_name |    username    |  password
------------+-----------+----------------+-------------
 Andrew     | Steele    | triple-cart-38 | password456
(1 row)
*/

/** EMPTYSTACK.SQL */
(
    SELECT "from", "to", body
    FROM emptystack_messages
    WHERE
        "from" ILIKE '%boss%'
        AND "to" ILIKE 'triple-cart-38'
        AND body ILIKE '%taxi%'
);

/** output:
     from     |       to       |                            body
--------------+----------------+------------------------------------------------------------
 your-boss-99 | triple-cart-38 | Deploy Project TAXI by end of week. We need this out ASAP.
 */


(
    SELECT *
    FROM emptystack_projects
    WHERE "code" ILIKE '%TAXI%'
    LIMIT 10 -- just in case
);

/** output:
        id    | code
    ----------+------
    DczE0v2b | TAXI
    (1 row)
*/

/** don't need to add table names (e.g. emptystack_accounts.username) ONLY b/c I know
there are no columns in each database which have duplicate names */
(
    SELECT username, password, code, id
    FROM emptystack_accounts
    CROSS JOIN emptystack_projects -- cross join ftw
    WHERE
        username = 'your-boss-99'
        AND code ILIKE 'TAXI'
);

/** Output: 
   username   |    password    | code |    id
--------------+----------------+------+----------
 your-boss-99 | notagaincarter | TAXI | DczE0v2b
(1 row)
*/