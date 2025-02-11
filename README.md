# Laptop E-commerce Website

## Project Overview
This is a laptop e-commerce website built using Spring MVC and MySQL while I was learning about Spring. The website allows users to browse products, add them to the cart, place orders, filter products, paginate results, and includes an admin panel for management. 

## Features
- **View Products:** Users can browse a list of available laptops.
- **Shopping Cart:** Users can add and remove items from the cart.
- **Checkout & Purchase:** Users can proceed to checkout and complete purchases.
- **Product Filtering:** Users can filter products based on different criteria.
- **Pagination:** The product list is paginated for better user experience.
- **Admin Panel:** Admins can manage products, orders, and users.

## Tech Stack
- **Framework:** Spring Boot
- **Database:** MySQL
- **Frontend:** HTML, CSS(Bootstrap), Javascript
- **Security:** Spring Security.
- **ORM:** Hibernate

## Requirements.
- **MySQL:** 8.0 or higher.
- **Spring Boot:** 3.3.6
- **Java Development Kit:** Version 8 or higher. (Mine using Java 17)

## Installation & Setup
1. Clone the repo:
   - ```git clone https://github.com/nhd3009/laptopshop.git```
2. Configure the database in application.properties:
```
spring.datasource.url=jdbc:mysql://localhost:3306/your_database
spring.datasource.username=your_username
spring.datasource.password=yourpassword
```
3. Run the application
   - ```mvn spring-boot:run```
4. Access the website via browser:
   - ```http://localhost:8080```

## Screenshots:
- Client side
![image](https://github.com/user-attachments/assets/e7d7cd88-7043-4fe4-acd2-151b1f196c90)

- Cart
![image](https://github.com/user-attachments/assets/6faebfd2-3a56-40bf-ab95-65d51d1037bd)

- Order History
![image](https://github.com/user-attachments/assets/f0cc3b71-ca34-45d5-9bbc-baa3bda220af)

- Product Detail
![image](https://github.com/user-attachments/assets/425d6601-539f-4261-8654-cb5bd9933b54)

- Browse Product
![image](https://github.com/user-attachments/assets/6592eef8-2898-4cc2-962e-ea2a23facd38)

- Admin Panel
![image](https://github.com/user-attachments/assets/269490cc-863a-43e9-a316-a7a8e4b2e66f)
