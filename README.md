# Pet Rescue Organization Data Warehouse

## Overview
A **centralized data warehouse** designed to store and manage pet-related data. It provides a comprehensive view of pets, their characteristics, medical statuses, and other relevant information. \
This data warehouse enables efficient reporting, analysis, and decision-making for the pet rescue organization.

<img width="1680" alt="Screen Shot 2023-06-10 at 22 31 08" src="https://github.com/minhquyetdo/Pet-Rescue-Organization-Data-Warehouse/assets/135207786/65ed29ab-6533-4854-9ed0-121f4898ac80">

**Technical features** in this Data Warehouse:
|Features| Description |
|:------|-----------:|
|**RDBMS**|MySQL|
|**ETL Tool**|Pentaho Integration (Hitachi Inc)|
|**Dimensional Modeling**|With dimension tables and a fact table. This model allows for efficient organizing and storing of data|
|**Surrogate and Foreign Keys**| Ensures data integrity, consistent linkage, and simplified data retrieval|
|**Slowly Changing Dimension Type 2**| Handle changes in dimension attributes over time |
|**ETL Workflow**| This workflow facilitates seamless data extraction, transformation, and loading, ensuring that the data warehouse is regularly updated with the latest pet-related information|

#### Explore the repository 
|Files| Description |
|:------|-----------:|
|what-how-why.txt|Data warehouse explain|
|.data-sources/|Store source data (fake data) |
|.tables-erd/erd-model.mwb|Relationship between tables (entities) in database|
|.tables-erd/create-tables.sql|Source code for creating tables in the "pet_rescue" database|
|.etl-package/|Source code for ETL workflow|
|.etl-package/workflow-explanation.txt|Explanation for ETL workflow|
|.tables-erd/business-queries.sql|Business queries demo|


## Clone the data warehouse

#### Requirements and Setting for MySQL
To create the database, you need to have MySQL installed. Follow these steps to set up the database:

1. Install MySQL: Download and install the latest version of [MySQL](https://www.mysql.com/downloads/) from the official website.

2. Create a Database: Open the MySQL command-line interface or a MySQL GUI tool, and execute the following command to create the database:
```sql
CREATE DATABASE pet_rescue;
```
3. Run SQL Scripts: Use a MySQL client or command-line interface to execute the SQL script provided in the repository's ".tables-erd/create-tables.sql" directory. This will create the necessary tables in the pet_rescue database.

#### Requirements and Setting for Pentaho Integration
To set up the ETL workflow, you need to install and configure Pentaho Integration. Follow these steps:

1. Download Pentaho Data Integration: Visit the official [Pentaho](https://www.hitachivantara.com/en-us/products/data-management-analytics/data-integration.html) website and download Pentaho Data Integration (also known as Kettle).
Install Pentaho Data Integration: Follow the installation instructions provided by Pentaho to install the software on your machine.

2. Open ETL Workflow: Launch Pentaho Data Integration and open the provided ETL workflow file located in the repository's etl-workflow directory. This workflow contains the necessary steps to extract, transform, and load data into the data warehouse.

3. Configure Connections: Modify the database connection details within the ETL workflow to match your MySQL setup. Update the connection details for both the source data and the data warehouse.

4. Execute the ETL Workflow: Once the connections are configured, run the ETL workflow to extract data from the source, perform transformations, and load it into the data warehouse.

## License

Feel free to contribute, make improvements, or use the code as a reference for your own organization's data warehouse.
