The solution involves correcting data types, using appropriate comparison operators (LIKE for pattern matching, = for exact matches), explicitly handling NULL values (using IS NULL, IS NOT NULL, COALESCE), and creating indexes on frequently queried columns. For example, instead of:

```sql
CREATE TABLE numbers (num INT);
INSERT INTO numbers VALUES (1234567890); -- Potential data truncation
```

Use:

```sql
CREATE TABLE numbers (num BIGINT);
INSERT INTO numbers VALUES (1234567890); -- Correct data type
```

And to properly compare string with wildcards, instead of:

```sql
SELECT * FROM products WHERE name = '%example%';
```

Use:

```sql
SELECT * FROM products WHERE name LIKE '%example%';
```

Handling NULLs correctly:

Instead of:
```sql
SELECT AVG(price) FROM products;
```
Consider:
```sql
SELECT AVG(COALESCE(price, 0)) FROM products;
```