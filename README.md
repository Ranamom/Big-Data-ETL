# Big Data ETL
![image](https://user-images.githubusercontent.com/112406455/222977004-15f38761-8eec-438c-9ba1-74fa15489f44.png)
## Background
In this assignment, you will put your ETL skills to the test. Many of Amazon's shoppers depend on product reviews to make a purchase. Amazon makes these datasets publicly available. They are quite large and can exceed the capacity of local machines. One dataset alone contains over 1.5 million rows; with over 40 datasets, data analysis can be very demanding on the average local computer. Your first goal will be to perform the ETL process completely in the cloud and upload a DataFrame to an RDS instance. The second goal will be to use PySpark or SQL to perform a statistical analysis of selected data.

* **Part 1:** Extract two Amazon customer review datasets, transform each dataset into four DataFrames, and load the DataFrames into an RDS instance.

* **Part 2:** Extract two Amazon customer review datasets and use either SQL or PySpark to analyze whether reviews from Amazon's Vine program are trustworthy.
## Instructions
### Part 1
Upload the `part_one_starter_code.ipynb` into Google Colab and create a duplicate of this file.

Explore the [Amazon Reviews](https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt) datasets and pick two datasets to perform ETL.

Rename each `part_one_starter_code.ipynb` file according to the dataset you are using. For example, if you are going to use the Video Game reviews file, rename file, `part_one_video_games.ipynb`. Repeat the process for the duplicate file you created in Step 2.

#### Extract the Data

1. Read in each dataset using the correct `header` and `sep` parameters.

2. Get the number of rows in the dataset.

#### Transform the Data

For each dataset use the `schema.sql` file located in the Resources folder of the `Starter_Code.zip` file to create the four DataFrames as follows:

1. Create the "review_id_df" DataFrame with the appropriate columns and data types.

2. Create the "products_df" DataFrame that drops the duplicates in the "product_id" and "product_title columns.

3. Create the "customers_df" DataFrame that groups the data on the "customer_id" by the number of times a customer reviewed a product.

4. Create the "vine_df" DataFrame that has the "review_id", "star_rating", "helpful_votes", "total_votes", and "vine" columns.

#### Load the Data into an RDS Instance

Export each DataFrame into the RDS instance to create four tables for each dataset.

### Part 2 
Recall that this part is completely optional; you can complete it as a way to challenge yourself and boost your new skills.

In Amazon's Vine program, reviewers receive free products in exchange for reviews. Amazon has several policies to reduce the bias of its [Vine reviews](https://www.amazon.com/vine/about?ie=UTF8).

![image](https://user-images.githubusercontent.com/112406455/222976476-fc0ca662-e455-4eaf-b983-5c8040c7380d.png)

But are Vine reviews truly trustworthy? Your task is to investigate whether Vine reviews are free of bias. Use either PySpark or, for an extra challenge, SQL to analyze the data.

* If you choose SQL, first use Spark on Colab to extract and transform the data and then load it into a SQL table on your RDS account. Perform your analysis with SQL queries on RDS.

* While there are no strict requirements for the analysis, consider steps you can take to reduce noisy data, such as filtering for reviews that meet a certain number of helpful votes, total votes, or both.

* Submit a summary of your findings and analysis.
## Summary
### Amazon Baby Review Dataset
Based on the data extracted from the queries, it can be concluded that Vine reviews are not entirely free of bias. The total number of reviews is 1,752,932, out of which only 1,2100 reviews are from the Vine program, and 1,740,832 are not from the Vine program. This indicates a significant disparity in the number of reviews between the two programs.

The average star rating for Vine reviews is 4.29, which is slightly higher than the average star rating for non-Vine reviews, which is 4.16. This indicates that Vine reviews may be biased towards higher ratings. Additionally, the distribution of star ratings for Vine reviews is significantly different from the distribution of star ratings for non-Vine reviews. For example, Vine reviews have a higher proportion of five-star ratings (50.2%) than non-Vine reviews (38.5%).

Furthermore, Vine reviews tend to have more helpful votes and total votes than non-Vine reviews. The average number of helpful votes per Vine review is 3.66, which is significantly higher than the average number of helpful votes per non-Vine review (1.61). The average number of total votes per Vine review is also higher than the average number of total votes per non-Vine review (4.56 vs. 1.61). This suggests that Vine reviews may be more visible and accessible than non-Vine reviews.
### Amazon Grocery Review Dataset

## References
Amazon Customer Reviews Dataset. (n.d.). Retrieved April 08, 2021, from: [https://s3.amazonaws.com/amazon-reviews-pds/readme.html](https://s3.amazonaws.com/amazon-reviews-pds/readme.html).
