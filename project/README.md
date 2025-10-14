# TrailHub Database

![Status](https://img.shields.io/badge/-Completed-34A853?style=flat&label=Project&labelColor=23555555)


## Table of Contents

- [Introduction](#introduction)
- [Objective](#objective)
- [Data Resources](#data-resources)
- [Repository Structure](#repository-structure)
- [Requirements](#requirements)
- [Setting Up the Database in MySQL](#setting-up-the-database-in-mysql)


## Introduction
This project implements a MySQL database to manage hiking activities, trail reviews, and national park information.
It focuses on designing a relational database with optimized indexing, structured relationships, and views to streamline data exploration and enhance query efficiency.


## Objective
The project is designed with the following objectives in mind:
- Design a comprehensive database schema.
- Optimize performance through indexing.
- Leverage views for efficient data exploration.
- Implement advanced querying capabilities for hiking-related activities.


## Data Resources
The dataset, sourced from authentic AllTrails resources (Nov 2024), provides comprehensive and accurate information, populating the database with real-world trails and parks for realistic exploration and analysis. Activities and hikers were randomly generated for analysis.
- [Yosemite Valley](https://www.alltrails.com/us/california/yosemite-valley)
- [Grand Canyon National Park](https://www.alltrails.com/parks/us/utah/grand-canyon-national-park)
- [Bryce Canyon National Park](https://www.alltrails.com/parks/us/utah/bryce-canyon-national-park)
- [Zion National Park](https://www.alltrails.com/parks/us/utah/zion-national-park)​


## Repository Structure
```
├── README.md          <- Top-level README for developers.
├── INTRO.md           <- Project key information (CS50 SQL).
├── DESIGN.md          <- Detailed design document outlining the database schema, relationships, and optimizations.
│
├── sql/               <- SQL files
│   ├── schema.sql     <- Defines the database schema, including tables, relationships, and indexes.
│   └── queries.sql    <- Includes sample queries for retrieving, analyzing, and managing hiking-related data.
│
└── diagrams/          <- Visual documentation
    ├── erDiagram.png  <- Entity-relationship diagram.
    └── dbSchema.png   <- Database schema.
```


## Requirements
`MySQL 9.1.0` or higher is required. Download the latest version here: [mysql.com](https://www.mysql.com/downloads/)


## Setting Up the Database in MySQL
Follow these steps to initialize and explore the TrailHub database in MySQL:

#### 1. Connect to the MySQL server
```bash
mysql -h 127.0.0.1 -P 3306 -u root -p
```

#### 2. Run the database schema file
```bash
source /path/to/sql/schema.sql;
```

#### 3. Run the queries file
```bash
source /path/to/sql/queries.sql;
```
---
