# Backdoor Mission Community Data System

## Project Overview
This project is a full-stack data management and analytics system built for Backdoor Mission, a non-profit organization in Oshawa, Canada. The organization previously relied on paper forms and Excel spreadsheets to track client visits and services across multiple departments, which made reporting and analysis time-consuming and error-prone. This system centralizes client and service data, automates reporting, and provides actionable insights for staff and stakeholders, supporting better decision-making and funding opportunities.

## Motivation
The project was driven by a desire to support the local community by streamlining data collection, improving accuracy, and enabling staff to focus on client care rather than manual data management. By building a scalable and maintainable system, the goal was to create lasting impact for the organization and its clients.

## Features
- Centralized PostgreSQL database to unify client and service records
- RESTful API backend built with Python and Flask
- Intuitive front-end interface designed with React and UX principles for quick and easy staff data entry
- Interactive dashboards and reports in Power BI for daily, monthly, quarterly, and yearly insights
- Duplicate prevention logic to handle real-world constraints like missing IDs or similar client names
- Scalable architecture allowing new services and data points to be added seamlessly

## Technologies
- **Backend:** Python, Flask, RESTful API  
- **Database:** PostgreSQL (with ERD design for relational structure)  
- **Frontend:** React, HTML, CSS, JavaScript, Figma for UI/UX design  
- **Data Visualization:** Power BI

## Project Structure
/backdoor-mission-project
│
├─ /backend
├─ /frontend
├─ README.md

## Getting Started
1. Clone the repository  
2. Set up PostgreSQL and create the database using the schema in `/backend/schema.sql`  
3. Start the backend Flask server  
4. Launch the frontend React application  
5. Connect Power BI to the PostgreSQL database for reporting

## Impact
- Reduced duplicate client entries and improved accuracy of service tracking  
- Enabled real-time dashboards for staff and leadership  
- Streamlined reporting to stakeholders and funders  
- Created a scalable foundation for future growth and expansion

## Contact
Bilgan Kiriş  
Computer Programming and Analysis Student | Durham College  
[LinkedIn](https://www.linkedin.com/in/bilgan-kiris/) | Email: bilgankrs@gmail.com
