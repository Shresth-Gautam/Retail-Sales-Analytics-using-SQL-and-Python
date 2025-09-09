# Retail Sales Analytics using SQL and Python

## 📌 Project Overview  
![Project Pipeline](https://github.com/najirh/Walmart_SQL_Python/blob/main/walmart_project-piplelines.png)

This project is an end-to-end data analytics solution developed to uncover business insights from **Walmart retail sales data**.  
I used **Python (Pandas, NumPy, SQLAlchemy)** for data preparation and cleaning, and **SQL (MySQL, PostgreSQL)** for advanced querying and business analysis.  

The goal was to design a structured workflow that processes raw datasets into actionable insights on **sales performance, profitability, and customer behavior**.  

---

## ⚙️ Project Workflow  

### 1. Environment Setup  
- Configured **VS Code** with Python and SQL database connections (MySQL/PostgreSQL).  
- Organized project files and workflows for smooth development.  

### 2. Data Acquisition & Preparation  
- Pulled Walmart sales dataset from **Kaggle API**.  
- Performed **data cleaning**:  
  - Removed duplicates  
  - Handled missing values  
  - Corrected data types (e.g., `datetime`, `float`)  
  - Formatted currency values  
- Engineered new feature: **Total Transaction Value** (`unit_price * quantity`).  

### 3. Database Integration  
- Loaded the cleaned dataset into **MySQL & PostgreSQL** using Python’s **SQLAlchemy**.  
- Created relational tables and verified data accuracy via SQL queries.  

### 4. SQL Analysis & Business Problem Solving  
Designed and executed **advanced SQL queries** (joins, CTEs, window functions, CASE statements) to answer business-critical questions:  
- 📊 Which product categories and branches drive the highest revenue?  
- 🕒 What are the busiest days/hours and seasonal demand patterns?  
- 💳 Which payment methods are most preferred by customers?  
- 💰 How do profit margins vary by branch and category?  

### 5. Documentation & Publishing  
- Documented queries, workflows, and insights in **Markdown and Jupyter Notebook**.  
- Published the project on **GitHub** with SQL scripts, Python notebooks, and a structured README.  

---

## ✅ Key Results & Insights  
- Identified **top-performing categories and branches** contributing most to revenue.  
- Discovered **customer buying patterns** (peak hours, seasonal spikes, and payment preferences).  
- Analyzed **profitability trends** across branches and categories to support decision-making.  

---

## 🚀 Future Enhancements  
- Integrate **Power BI/Tableau dashboards** for interactive reporting.  
- Automate the pipeline for **real-time sales monitoring**.  
- Extend analysis by combining with **external retail datasets** for deeper insights.  

---

## 🛠️ Tech Stack  
- **Languages**: Python, SQL  
- **Databases**: MySQL, PostgreSQL  
- **Libraries**: Pandas, NumPy, SQLAlchemy  
- **Tools**: VS Code, Jupyter Notebook, Kaggle API  

---

## 📂 Project Structure  
```plaintext
|-- README.md                  # Project documentation  
|-- Walmart Business Problems.pdf   # Business problem statements  
|-- Walmart SQL queries.sql    # SQL scripts for analysis  
|-- Walmart.csv                # Raw dataset  
|-- Walmart_clean_data.csv     # Cleaned dataset  
|-- project.ipynb              # Jupyter notebook for Python analysis  
|-- requirements.txt           # Python dependencies  
