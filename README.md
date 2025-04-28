
####  1.  What is PostgreSQL?
PostgreSQL একটি পাওয়ারফুল ও ওপেন-সোর্স রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS)। এটি ACID নীতিমালা মেনে চলে, এক্সটেনসিবল, এবং SQL স্ট্যান্ডার্ড । জটিল ডেটা প্রসেসিং, ট্রানজ্যাকশন ম্যানেজমেন্ট, আর বিভিন্ন ধরনের ডেটা (যেমন JSON, XML) প্রসেসিং এ এটি ব্যাপকভাবে ব্যবহার করা হয়।

#### 2. What is the purpose of a database schema in PostgreSQL?
স্কিমা হলো ডেটাবেসের ভেতরে টেবিল, ফাংশন, ভিউ ইত্যাদি রাখার একটা উপায়। এটা আলাদা নেমস্পেসের মতো কাজ করে,যাতে একাধিক ইউজার বা অ্যাপ্লিকেশনের ডেটা আলাদা রাখা যায় এবং নামের কনফ্লিক্ট এড়ানো যায়। যেমন, এক স্কিমায় একটা টেবিলের নাম 'users' হলে, আরেক স্কিমায় আবার 'users' নামের টেবিল থাকতে পারে।

#### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
প্রাইমারি কী (Primary Key):
প্রাইমারি কী হলো এমন একটা কলাম বা কলামগুলোর সেট, যা টেবিলের প্রতিটি সারিকে (row) ইউনিকভাবে শনাক্ত করে। প্রাইমারি কী কখনো NULL হতে পারে না এবং একটি টেবিলে শুধুমাত্র একটি প্রাইমারি কী থাকতে পারে।
উদাহরণ:

```sql
id INT PRIMARY KEY
```
ফরেন কী (Foreign Key):
ফরেন কী হলো এমন একটা কলাম, যা অন্য টেবিলের প্রাইমারি কী-এর সাথে সংযুক্ত থাকে। এর মাধ্যমে টেবিলগুলোর মধ্যে সম্পর্ক তৈরি হয় এবং ডেটার relational integrity) নিশ্চিত করা হয়।
উদাহরণ:

```sql
customer_id INT REFERENCES customers(id)
```

#### 4. What is the difference between the VARCHAR and CHAR data types?

VARCHAR(n):
এটি ভেরিয়েবল বা পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং। যেমন, VARCHAR(50) দিলে সর্বোচ্চ ৫০ ক্যারেক্টার পর্যন্ত রাখতে পারা যাবে, কিন্তু যদি  ১০ ক্যারেক্টারের ডেটা রাখা হয়, তাহলে শুধু সেই ১০  ক্যারেক্টারেরই স্পেস ব্যবহার হবে।

CHAR(n):
এটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং । যেমন, CHAR(10) হলে যদি ৫ ক্যারেক্টারের কিছু রাখা হয়, বাকি ৫ ক্যারেক্টার জায়গা খালি রাখবে (স্পেস দিয়ে পূরণ করবে)।

#### 5.Explain the purpose of the WHERE clause in a SELECT statement.

WHERE ক্লজ ব্যবহার করা হয় ডেটার উপর শর্ত (condition) বসিয়ে নির্দিষ্ট কিছু সারি (row) নির্বাচন করতে। শুধু যেসব সারি শর্ত পূরণ করবে, সেগুলোকেই রিটার্ন করবে।
উদাহরণ:

```sql
SELECT * FROM employees WHERE salary > 50000;
```

মানে, যাদের স্যালারি ৫০,০০০ টাকার বেশি, কেবল তাদের তথ্য দেখাবে।

#### 6. What are the LIMIT and OFFSET clauses used for

LIMIT:
কুয়েরির রেজাল্ট থেকে কতগুলো সারি দেখানো হবে তা ঠিক করে।
উদাহরণ:

```sql
SELECT * FROM products LIMIT 10;
```
মানে, প্রথম ১০টি প্রোডাক্ট দেখাবে।

OFFSET:
ডেটার শুরু থেকে নির্দিষ্ট সংখ্যক সারি স্কিপ করে পরের ডেটা দেখায়।

উদাহরণ:

```sql
SELECT * FROM products LIMIT 5 OFFSET 10;
```
মানে, প্রথম ১০টি ডেটা বাদ দিয়ে ১১তম থেকে শুরু করে ৫টি ডেটা দেখাবে।

#### 7. How can you modify data using UPDATE statements?

UPDATE স্টেটমেন্ট ব্যবহার করে টেবিলের বিদ্যমান ডেটা পরিবর্তন করা যায়।
সাধারণ সিনট্যাক্স:

```sql
UPDATE table_name  
SET column1 = value1, column2 = value2  
WHERE condition;
```
 যদি WHERE ক্লজ না দাও, তাহলে পুরো টেবিলের সব ডেটা আপডেট হয়ে যাবে!

 #### 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

 JOIN অপারেশন ব্যবহার করে দুটি বা তার বেশি টেবিলের সম্পর্কযুক্ত ডেটা একসাথে আনা হয়। সাধারণত কমন কলাম (যেমন প্রাইমারি কী/ফরেন কী) দিয়ে টেবিলগুলো join করা হয়।

JOIN-এর কিছু ধরন হলো:

INNER JOIN: শুধু যেসব সারি ম্যাচ করবে, সেগুলো দেখাবে।

LEFT JOIN: বাম টেবিলের সব সারি দেখাবে, আর ডান টেবিলের সাথে মিল থাকলে মিলানো ডেটা দেখাবে।

#### 9. Explain the GROUP BY clause and its role in aggregation operations.

GROUP BY ক্লজ একই মানের ডেটা গ্রুপ করে অ্যাগ্রিগেট ফাংশন (যেমন SUM(), AVG()) apply  করতে সাহায্য করে।
উদাহরণ:

```sql
SELECT department, AVG(salary)  
FROM employees  
GROUP BY department;
```
প্রতিটি ডিপার্টমেন্টের বেতনের গড় বের করবে

#### 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

COUNT(): সারির সংখ্যা গণনা করে।
উদাহরণ: 
```sql
SELECT COUNT(*) FROM orders;
```

SUM(): সংখ্যাসূচক কলামের মোট যোগফল দেয়।
উদাহরণ: 
```sql 
SELECT SUM(revenue) FROM sales;
```

AVG(): সংখ্যাসূচক কলামের গড় মান বের করে।
উদাহরণ: 

```sql
SELECT AVG(age) FROM students;
```