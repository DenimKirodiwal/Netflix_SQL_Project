# Netflix Movies & TV Shows Data Analysis using SQL

<img width="2226" height="678" alt="image" src="https://github.com/user-attachments/assets/d57f443c-3d29-406a-957e-eb43939f8d6b" />


## 📌 Overview
This project presents a **comprehensive analysis of Netflix's movies and TV shows dataset** using **PostgreSQL (pgAdmin 4)**.  
The main objective is to extract valuable insights, answer key business questions, and provide data-driven conclusions about Netflix’s content distribution, ratings, genres, and trends.

---

## 🎯 Objectives
- Analyze the distribution of **Movies vs TV Shows**.
- Identify the **most common ratings** for both content types.
- Explore content trends by **release year**, **country**, and **duration**.
- Find **longest-running movies** and TV shows with multiple seasons.
- Categorize content based on keywords like `"kill"` and `"violence"`.
- Gain **regional insights**, especially focusing on India.

---

## 📂 Dataset
- **Source:** [Kaggle - Netflix Movies and TV Shows Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows)
- **Description:** The dataset contains information about Netflix titles, including:
  - Title, Director, Cast, Country
  - Release Year, Date Added
  - Rating, Duration
  - Genre (`listed_in`), Description

---

## 🗄️ Database Schema
```
CREATE TABLE netflix (
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
```

---

## Findings & Conclusion
- **Content Distribution**: Netflix offers a wide range of movies and TV shows, with varying ratings and genres.

- **Common Ratings**: Helps understand the audience demographic.

- **Geographical Insights**: Identified top countries and India's yearly trends.

- **Genre Analysis**: Uncovered the diversity of Netflix's offerings.

- **Content Categorization**: Classification by keywords highlights the nature of available content.

- **This SQL analysis provides valuable insights that can guide content strategy and help in data-driven decision-making.**

---

## Tools & Technologies

- **Database**: PostgreSQL (pgAdmin 4)

- **Language**: SQL

- **Platform**: Windows 10

- **Dataset Source**: Kaggle

---

## How to Run the Project

- **Install PostgreSQL and pgAdmin**

- **Download the dataset from Kaggle.**

- **Create the netflix table using the schema above.**

- **Import the dataset into the table.**

- **Run SQL queries to explore and analyze the data.**

---
## Contact
**Feel free to connect if you have any suggestions or feedback!**

- **👤 Author: Denim Karodiwal**

- **📧 Email: rajnikarodiwal@gmail.com**

- **🌐 GitHub: [@DenimKirodiwal](https://github.com/DenimKirodiwal)**
