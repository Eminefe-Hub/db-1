# Bandle City Municipality and Urban Planning Project

## Project Description

This project is designed to develop a Municipality and Urban Planning system themed around Bandle City. The system encompasses functions such as municipal management, citizen information, services, and complaint management. Built using Laravel and MySQL, this project aims to deliver efficient database management and a user-friendly interface.

## Technologies

- Backend: Laravel Framework

- Database: MySQL

- IDE: PHPStorm

- Language: PHP, SQL


------------------------------------------------------------



# Database Table Descriptions

## 1. General Purpose Tables

cache: Stores key-value pairs and expiration times.

cache_locks: Used for locking mechanisms.

failed_jobs: Records failed jobs.

job_batches and jobs: Handles queue systems and job management.

migrations: Tracks database migrations.

sessions: Manages user sessions.


------------------------------------------------------------

## 2. Main Functional Tables

departmanlar: Stores information about municipal departments.

calisanlar: Manages municipal employees, linked with department and user tables.

users: Manages system users.

role: Defines user roles.

sakinler_bilgis: Stores information about city residents.

hizmet_kategoris and hizmet_bilgis: Provides information about services offered by the municipality and their categories.

kalite_kategori and kalite_bilgi: Manages environmental quality information and categories.

onerilers: Stores citizen suggestions.

vatandas_geri_bildirimleris: Handles feedback from citizens.



------------------------------------------------------------

## 3. Supporting Tables

password_reset_tokens: Temporarily stores tokens for password reset processes.

giriskayitlari: Logs user login activities.

sikayetler: Manages citizen complaints and their statuses.





------------------------------------------------------------

# Project Features

User Management: Handles users, roles, and sessions.

Citizen Services: Provides service categories and detailed information.

Environmental Management: Manages quality information and descriptions.

Feedback and Suggestions: Records feedback and suggestions from citizens.

Complaint Management: Tracks the status of complaints.

------------------------------------------------------------

# Installation Instructions      

## 1. Install Laravel project:
``` bash
composer install
```


# 2. Create the environment file and set up configurations:
``` bash
cp .env.example .env
php artisan key:generate
```

# 3. Create the database and update configurations:
``` bash
php artisan migrate
```

# 4. Start the server 
``` bash
php artisan serve
```

# Developer Notes 

- The database is configured with UTF-8 support.

- Relational tables are linked using "foreign key" constraints, ensuring cascading deletes.

- Optimized for PHPStorm IDE.




