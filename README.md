# Media Streaming Service Database Project

## Project Overview
This project models a relational database schema for a media streaming service similar to Netflix. It provides a database design to track customers, content, streaming events, and invoices, supporting various queries and operations essential to the service's business model.

## Features
- Relational database design optimized for performance and scalability.
- Supports customer management, content metadata, streaming events, and billing details.
- Includes scripts for testing and demonstration purposes.

---

## Prerequisites
### Software Requirements:
- MySQL Server 8.0 or higher
- A terminal or shell to execute scripts

### Libraries/Tools:
- mysqldump (for backups)

---

## Setup Instructions

### Step 1: Clone the Repository
```bash
git clone git@github.com:jainam2907/Media-Streaming-DB.git
cd Media-Streaming-DB
```

### Step 2: Create the Database
1. Start the MySQL server.
2. Create the database by executing the schema script:
   ```bash
   mysql -u <username> -p < database_setup.sql
   ```
   This will create the database `media_streaming` and all the required tables.

### Step 3: Populate the Database
Run the sample data script:
```bash
mysql -u <username> -p < sample_data.sql
```
This script inserts sample data into the `media_streaming` database for demonstration and testing purposes.

---

## Execution Instructions
### Query Examples
1. Launch the MySQL command-line tool or a MySQL client (e.g., Workbench).
2. Use the database:
   ```sql
   USE media_streaming;
   ```
3. Run your desired queries. For example, retrieve the top 10 most-watched content:
   ```sql
   SELECT c.title, COUNT(s.stream_id) AS total_views
   FROM streams s
   JOIN content c ON s.content_id = c.content_id
   GROUP BY c.title
   ORDER BY total_views DESC
   LIMIT 10;
   ```

---

## Backup and Recovery Plan
### Backup
Run the following command to back up the database:
```bash
mysqldump -u <username> -p media_streaming > backup.sql
```

### Recovery
Restore the database from a backup using:
```bash
mysql -u <username> -p < backup.sql
```

---

## Dependencies
### Database
- MySQL 8.0 or higher

### Scripts
- `database_setup.sql`: Creates the database and tables.
- `sample_data.sql`: Populates the database with sample data.
- `basic_crud.sql`: Demonstrates basic CRUD operations on the database.
