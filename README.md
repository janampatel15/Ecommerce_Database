# Web-based e-commerce system

## CONTENTS OF THIS FILE

- [Team](#Team)
- [Summary](#Summary)
- [Project Goals](#project_goals)
- [Requirement](#requirement)
- [Data](#data)
- [Design](#design)

<a name="Team"/>

## Team

This project was made with the help of [Mariachiara Acconcia](https://github.com/MaryAcconcia), Brian Kong, and Richard Hong.

<a name="Summary"/>

## Summary

The purpose of this project is to provide a relational database solution to keep track of e-commerce entities. The database is intended for Give Us Five Stars (GUFS), an online clothing store. This document outlines the process that was taken to create the database system. This includes the goals, scope, requirements, ERD, relational schema, and the SQL implementation. In this project we tried to create a simplified database for a real world E-commerce system. The main aspects that are usually visible to E-commerce system users were included in our scope, while we left out all the system's internal aspects and calculations.

<a name="project_goals"/>

## Project Goals

This project is an E-commerce database system for a new E-commerce clothing website named Give Us Five Stars (GUFS) that will store information about products, such as apparel, footwear, sportswear, etc. and customers, and orders. This system aims to create a single database that combines all of the data for a new E-commerce clothing website, GUFS. Unified data in the E-commerce website enables a single application that supports all aspects of the company's needs or multiple applications without redundant data. For this project, the authors have decided to use a fictional organization, Give Us Five Stars (GUFS), that reflects the actual data needs and challenges of many E-commerce systems.

<a name="requirement"/>

## Requirement

- GUFS needs to track information for each new user, including name, phone number, email address. GUFS also generates a unique registration number for each new user.
- Each user is tied to an account that contains a unique account ID, a unique user logonID and password, and creation date.
- Each account can be either personal or a business account. 
- Each account can write reviews about any product. Each review has its own ID, date, number of stars, comment, useful flag, and number of total words.
- GUFS records information about orders. Each order has an order ID, an order date, an order status, a shipping address, a receiver name, a delivery date, a dispatch date and a billing address.
- Each order can contain one or many items, and about every item the system keeps track of the item ID, sku, item name, category, price, description, stock, review stars, size,color.
- Each order has an order status that changes overtime and is recorded with a timestamp.
- Every order also contains order items, for which the system keeps track of the order item ID, discounted price, and quantity.
- One account can have many Save For Later items.
- Each order can have multiple transactions, either payment or return, since customers may add items, change the number of items, or even return items after purchase if they so desire. 
- For each payment and for each return GUFS keeps track of the unique ID, total amount and date.
- GUFS also keeps information about return line items and the quantity of items returned.
- Each user can pay the total amount with credit cards. GUFS records card number,  PIN, account’s holder name and billing address for credit cards.

<a name="data"/>

## Data

All data used in this implementation is dummy data created by each of our team members. The data is intended to simulate real world entries into the system. After the production deployment of our database, live data will be inserted from multiple sources. Daily business operations will produce data to be inserted into the database. 

<a name="design"/>

## Design

Based on the following ERD, we get the general idea of what the database will contain and how each entities is connected to other one and important constraints are shown as well.

![Picture1](https://user-images.githubusercontent.com/60947012/102925775-049fd700-4462-11eb-8f02-c0a304b7f1f3.png)



