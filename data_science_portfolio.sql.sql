CREATE DATABASE data_science_portfolio;
USE data_science_portfolio;


-- Person Table
CREATE TABLE person (
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) DEFAULT 'India',
    bio TEXT,
    current_role VARCHAR(100)
);

INSERT INTO person (full_name, email, phone, city, state, country, bio, current_role) VALUES
(
    'Arjun Malik', 'arjun.malik@example.com', '9876501234', 'Ambala', 'Haryana', 'India',
    'Aspiring Data Scientist focused on Python, SQL, Machine Learning,
    Artificial Intelligence and Data Analytics.', 'Data Science Intern'
);




-- Education Table
CREATE TABLE education (
    education_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    degree VARCHAR(100) NOT NULL,
    field VARCHAR(100),
    institute VARCHAR(150),
    city VARCHAR(50),
    start_year YEAR,
    end_year YEAR,
    grade VARCHAR(20),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO education (person_id, degree, field, institute, city, start_year, end_year, grade) VALUES
(1, 'Bachelor of Technology', 'Computer Science and Engineering',
 'Haryana Institute of Technology', 'Ambala', 2021, 2025, '8.2 CGPA'),
(1, 'Senior Secondary', 'Science',
 'Government Senior Secondary School', 'Ambala', 2019, 2021, '86%');




-- Skills Table
CREATE TABLE skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    skill_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    proficiency VARCHAR(30),
    years_experience DECIMAL(3,1),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO skills (person_id, skill_name, category, proficiency, years_experience) VALUES
-- Programming
(1, 'Python', 'Programming', 'Advanced', 2.5),
(1, 'SQL', 'Programming', 'Advanced', 2.5),
(1, 'R', 'Programming', 'Beginner', 0.5),
-- Data Analysis
(1, 'Pandas', 'Data Analysis', 'Advanced', 2.0),
(1, 'NumPy', 'Data Analysis', 'Advanced', 2.0),
(1, 'Excel', 'Data Analysis', 'Advanced', 2.0),
-- Visualization
(1, 'Matplotlib', 'Data Visualization', 'Advanced', 1.8),
(1, 'Seaborn', 'Data Visualization', 'Advanced', 1.8),
(1, 'Power BI', 'Data Visualization', 'Intermediate', 1.2),
(1, 'Plotly', 'Data Visualization', 'Intermediate', 1.0),
-- Statistics
(1, 'Descriptive Statistics', 'Statistics', 'Advanced', 1.8),
(1, 'Probability', 'Statistics', 'Intermediate', 1.5),
(1, 'Hypothesis Testing', 'Statistics', 'Intermediate', 1.3),
(1, 'A/B Testing', 'Statistics', 'Intermediate', 1.0),
-- Machine Learning
(1, 'Linear Regression', 'Machine Learning', 'Advanced', 1.8),
(1, 'Logistic Regression', 'Machine Learning', 'Advanced', 1.8),
(1, 'Decision Tree', 'Machine Learning', 'Advanced', 1.5),
(1, 'Random Forest', 'Machine Learning', 'Advanced', 1.5),
(1, 'XGBoost', 'Machine Learning', 'Intermediate', 1.2),
(1, 'K-Means Clustering', 'Machine Learning', 'Advanced', 1.5),
(1, 'KNN', 'Machine Learning', 'Intermediate', 1.2),
(1, 'SVM', 'Machine Learning', 'Intermediate', 1.0),
-- Deep Learning
(1, 'Neural Networks', 'Deep Learning', 'Intermediate', 1.0),
(1, 'CNN', 'Deep Learning', 'Intermediate', 0.8),
(1, 'RNN', 'Deep Learning', 'Beginner', 0.5),
-- NLP
(1, 'Natural Language Processing', 'NLP', 'Intermediate', 1.0),
(1, 'TF-IDF', 'NLP', 'Intermediate', 0.8),
(1, 'Text Classification', 'NLP', 'Intermediate', 0.8),
-- AI
(1, 'Generative AI', 'Artificial Intelligence', 'Intermediate', 0.8),
(1, 'LLM Fundamentals', 'Artificial Intelligence', 'Intermediate', 0.6),
(1, 'Prompt Engineering', 'Artificial Intelligence', 'Advanced', 1.0),
-- Database
(1, 'MySQL', 'Database', 'Advanced', 2.0),
(1, 'PostgreSQL', 'Database', 'Intermediate', 1.0),
-- Tools
(1, 'Jupyter Notebook', 'Tools', 'Advanced', 2.5),
(1, 'Git', 'Tools', 'Intermediate', 1.5),
(1, 'GitHub', 'Tools', 'Intermediate', 1.5),
(1, 'VS Code', 'Tools', 'Advanced', 2.0),
-- Deployment
(1, 'Streamlit', 'Deployment', 'Intermediate', 1.0),
(1, 'Flask', 'Deployment', 'Beginner', 0.5),
-- Cloud
(1, 'AWS Fundamentals', 'Cloud', 'Beginner', 0.5);




-- Experience Table
CREATE TABLE experience (
    experience_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    company_name VARCHAR(150),
    job_title VARCHAR(100),
    employment_type VARCHAR(50),
    location VARCHAR(100),
    start_date DATE,
    end_date DATE,
    description TEXT,
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO experience
(person_id, company_name, job_title, employment_type, location,  start_date, end_date, description)
VALUES
(1,
 'TechNova Analytics', 'Data Science Intern', 'Internship', 'Gurugram, Haryana', '2024-06-01',
 '2024-08-31', 'Worked on data cleaning, exploratory data analysis,
 feature engineering and machine learning models using Python, Pandas and Scikit-learn.'),
 
(1, 'DataMind Solutions', 'Machine Learning Intern', 'Internship', 'Chandigarh', '2024-09-01',
 '2024-12-31', 'Developed classification and regression models,
 performed model evaluation and created analytical reports for business datasets.');
 
 
 
 
-- Projects Table
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    project_name VARCHAR(150) NOT NULL,
    domain VARCHAR(100),
    project_type VARCHAR(50),
    description TEXT,
    github_url VARCHAR(255),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO projects (person_id, project_name, domain, project_type, description, github_url) VALUES
(1,
 'Data Science Professional Portfolio',
 'Data Analytics',
 'SQL',
 'Designed a relational SQL database to manage and analyze a fictional data science professional portfolio.',
 'https://github.com/example/arjun-sql-portfolio'),

(1, 'Customer Churn Prediction', 'Machine Learning', 'Classification',
 'Built a machine learning model to predict customer churn using data preprocessing, feature engineering and classification algorithms.',
 'https://github.com/example/customer-churn'),

(1, 'House Price Prediction', 'Machine Learning', 'Regression',
 'Developed a regression model to predict house prices using exploratory data analysis and machine learning techniques.',
 'https://github.com/example/house-price-prediction'),

(1, 'Customer Segmentation', 'Machine Learning', 'Clustering',
 'Applied K-Means clustering to segment customers based on purchasing behavior.',
 'https://github.com/example/customer-segmentation'),

(1,
 'Sales Performance Analysis', 'Data Analytics', 'SQL + Power BI',
 'Analyzed sales data using SQL and created business-oriented analytical dashboards.',
 'https://github.com/example/sales-analysis'),

(1,
 'Product Review Sentiment Analysis', 'Natural Language Processing', 'NLP',
 'Built an NLP-based sentiment classification project for analyzing customer product reviews.',
 'https://github.com/example/sentiment-analysis');


-- Project_Tools Table
CREATE TABLE project_tools (
    project_tool_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    tool_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO project_tools (project_id, tool_name) VALUES
-- SQL Portfolio
(1, 'MySQL'),
(1, 'SQL'),
(1, 'GitHub'),
-- Customer Churn
(2, 'Python'),
(2, 'Pandas'),
(2, 'NumPy'),
(2, 'Scikit-learn'),
(2, 'Matplotlib'),
(2, 'Seaborn'),
-- House Price
(3, 'Python'),
(3, 'Pandas'),
(3, 'NumPy'),
(3, 'Scikit-learn'),
(3, 'Matplotlib'),
-- Customer Segmentation
(4, 'Python'),
(4, 'Pandas'),
(4, 'Scikit-learn'),
(4, 'Matplotlib'),
-- Sales Analysis
(5, 'MySQL'),
(5, 'SQL'),
(5, 'Power BI'),
-- Sentiment Analysis
(6, 'Python'),
(6, 'Pandas'),
(6, 'NLTK'),
(6, 'Scikit-learn');



CREATE TABLE certifications (
    certification_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    certification_name VARCHAR(150),
    issuing_organization VARCHAR(150),
    issue_date DATE,
    credential_type VARCHAR(50),
    FOREIGN KEY (person_id)REFERENCES person(person_id)
);

INSERT INTO certifications (person_id, certification_name, issuing_organization,
 issue_date, credential_type) VALUES

(1, 'Professional Certificate in Data Science', 'DataLearn Academy', '2024-03-15',
 'Professional Certificate'),
(1, 'Machine Learning Foundations', 'AI Skills Institute', '2024-06-20', 'Certificate'),
(1, 'SQL for Data Analytics', 'AnalyticsHub', '2024-02-10', 'Certificate'),
(1, 'Python for Data Science', 'CodeSphere Academy', '2023-12-18', 'Certificate'),
(1, 'Statistics for Data Science', 'DataLearn Academy', '2024-04-25', 'Certificate'),
(1, 'Power BI Data Analytics', 'DataViz Institute', '2024-08-12', 'Certificate'),
(1, 'Generative AI Fundamentals', 'AI Skills Institute', '2025-01-20', 'Certificate');



-- Social Profiles Table
CREATE TABLE social_profiles (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    platform VARCHAR(50),
    profile_url VARCHAR(255),
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO social_profiles (person_id, platform, profile_url) VALUES

(1, 'GitHub', 'https://github.com/example/arjun-malik'),
(1, 'LinkedIn', 'https://www.linkedin.com/in/example-arjun-malik'),
(1, 'Kaggle', 'https://www.kaggle.com/example-arjun-malik');



-- Portfolio SQL Analysis Queries
select * from person;
select  full_name, current_role, city, state from person;
select skill_name, category, proficiency, years_experience from skills;
select skill_name, category, proficiency, years_experience from skills where proficiency = 'Advanced';
select  skill_name, proficiency, years_experience FROM skills WHERE category = 'Machine Learning';
select  skill_name, category, years_experience from skills where years_experience > 1.5;
select skill_name, category, years_experience from skills order by years_experience desc;





















































































