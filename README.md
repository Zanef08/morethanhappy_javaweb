# Cake Management Software Requirement Specification

**– HCM, OCT 2023 –**

## Table of Contents
I. [Overview](#overview)
   1. [Introduction](#introduction)
   2. [Database](#database)
   4. [System Functions](#system-functions)
      ![System Functions](https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/systemfunction.png)

II. [Functional Requirements](#functional-requirements)

## I. Overview
### 1. Introduction
My project is a website that sells cakes. There are 2 roles: Admin and User. When logged in as a User, you can view the cake list, put it in the shopping cart, and make a purchase. When you buy, you will leave some information so that the cake can be delivered. When logging in with the Admin role, you can view orders (can search by date the user wants to be delivered), manage users (delete, edit), and manage cakes (add, delete, edit).

### 2. Database
Database Name: CakeManagement

- **tblCakes**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/dbcake.png)
- **tblUsers**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/dbuser.png)
- **tblOrders**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/dborder.png)
- **tblOrderDetails**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/dborderdt.png)

### 3. System Functions
#### User Web Application
1. **Login account**
   - *Login page*: Contains a text box to input username and password, login button, reset button, register link.
2. **Register account**
   - *Register page*: Contains a text box to input user information, register button, reset button, login link.
3. **View Home Page**
   - *Home Page*: Contains an introduction about ”More Than Happy” and the main features of the application.
4. **View About Us**
   - *About Us Page*: Contains an introduction about ”More Than Happy”.
5. **Get Cakes List**
   - *Our Cakes*: Contains all MTH’s Cakes and has a “Buy” button.
6. **View order**
   - *Cart page*: Contains cakes that Users click the “Buy” button, “Update” can update quantity, “Delete” button, Total price of all Cakes in Cart.
7. **Check Out**
   - *Check Out Page*: User has to fill information: userID, address, phone, date and time (ngày muốn được giao), confirm order.
8. **Invoice**
   - *Invoice Page*: Print out an invoice containing the information the user has entered and the order.

#### Admin Web Application
1. **Manage Web**
   - *Admin Page*: Admin can view orders (can search by date the user wants to be delivered), can manage users (delete, edit), can manage cakes (add, delete, edit).

## II. Functional Requirements
- **Login**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/login.jpeg)
- **Register**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/register.jpeg)
- **Home**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/homelogin.jpeg)
- **Our Cakes**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/ourcake.jpeg)
- **Cart**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/cart.jpeg)
- **Check Out**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/checkout.jpeg)
- **Invoice**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/invoice.jpeg)
- **Admin**
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/admin1.jpeg)
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/admin2.jpeg)
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/admin3.jpeg)
- (https://github.com/Zanef08/MoreThanHappy_JavaWeb/blob/main/pictures/addcake.jpeg)
