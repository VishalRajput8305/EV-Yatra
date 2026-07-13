# EVyatra Project Overview

## 1. Project Summary
EVyatra is a full-stack electric vehicle charging station booking platform. It allows users to browse charging stations, view station details, book charging slots, make payments, and leave reviews. The application also includes admin capabilities for managing stations, bookings, users, and reviews.

## 2. Project Structure

### Workspace layout
```text
evyatra-backend-main/
├── Dockerfile
├── pom.xml
├── mvnw / mvnw.cmd
├── README.md
├── screenshots/
└── src/
    ├── main/
    │   ├── java/com/evyatra/
    │   │   ├── config/
    │   │   ├── controller/
    │   │   ├── dto/
    │   │   ├── exception/
    │   │   ├── model/
    │   │   ├── repository/
    │   │   ├── security/
    │   │   └── service/
    │   └── resources/
    │       └── application-example.properties
    └── test/java/com/evyatra/

 evyatra-frontend-main/
├── package.json
├── package-lock.json
├── public/
├── README.md
├── screenshots/
└── src/
    ├── api/
    ├── components/
    ├── context/
    ├── pages/
    ├── App.js
    ├── App.css
    ├── index.js
    └── index.css
```

### Backend folder purpose
- config/: security, CORS, and application configuration
- controller/: REST API endpoints for auth, stations, bookings, payments, reviews, admin, and user profile
- dto/: request/response objects
- exception/: centralized exception handling
- model/: JPA entities such as User, EvStation, Booking, Payment, Review, and OTP entities
- repository/: Spring Data repositories for persistence access
- security/: JWT filter and token utilities
- service/: business logic for authentication, booking, payments, reviews, and password reset

### Frontend folder purpose
- api/: shared Axios client with JWT token handling
- components/: reusable UI components such as navbar, booking/payment modals, reviews table, and dashboards
- context/: authentication context and local token/session handling
- pages/: route-level screens for landing, login, registration, station browsing, bookings, profile, and password reset

## 3. Frontend Framework
- React.js
- Created with Create React App via react-scripts
- Client-side routing is handled with react-router-dom
- UI uses custom components and CSS

## 4. Backend Framework
- Java 17
- Spring Boot 4.0.6
- Spring MVC for REST APIs
- Spring Security for authentication and authorization
- Spring Data JPA + Hibernate for persistence
- Validation and OpenAPI/Swagger support

## 5. Database
- MySQL
- Configured through Spring Data JPA and JDBC datasource settings
- Main entities include:
  - users
  - ev_stations
  - charger_slots
  - bookings
  - payments
  - reviews
  - password_reset_otp

## 6. Authentication
- JWT-based authentication
- Users log in with email/password and receive a bearer token
- Tokens are stored in localStorage on the frontend
- Backend protects routes using Spring Security and JWT filters
- Admin-specific routes are protected with ROLE_ADMIN authorization

## 7. API Structure
The backend exposes REST APIs under the following base paths:

### Public APIs
- /api/auth/register
- /api/auth/login
- /api/auth/forgot-password
- /api/auth/verify-otp
- /api/auth/reset-password
- /api/stations
- /api/stations/search
- /api/stations/{id}
- /api/slots/station/{stationId}/available
- /api/reviews/station/{stationId}

### Protected user APIs
- /api/bookings
- /api/bookings/my
- /api/bookings/{id}/cancel
- /api/payments/pay
- /api/payments/booking/{bookingId}
- /api/reviews
- /api/user/profile

### Admin APIs
- /api/admin/users
- /api/admin/bookings
- /api/admin/stations
- /api/admin/reviews
- /api/admin/stats

## 8. Deployment Configuration
- Backend is containerized using Docker
- The Dockerfile uses a multi-stage Maven build and runs the Spring Boot jar on port 8080
- Frontend is configured for a React app deployment and the backend CORS policy allows local development and Vercel-hosted frontend origins
- The repository README references Vercel for the frontend and Render for the backend demo deployment

## 9. Environment Variables
The backend expects the following environment variables:

```text
PORT
SPRING_DATASOURCE_URL
SPRING_DATASOURCE_USERNAME
SPRING_DATASOURCE_PASSWORD
JWT_SECRET
JWT_EXPIRATION
SPRING_MAIL_HOST
SPRING_MAIL_PORT
SPRING_MAIL_USERNAME
SPRING_MAIL_PASSWORD
SPRING_MAIL_PROPERTIES_MAIL_SMTP_AUTH
SPRING_MAIL_PROPERTIES_MAIL_SMTP_STARTTLS_ENABLE
```

The frontend uses:

```text
REACT_APP_API_URL
```

## 10. External Services Used
- MySQL database
- SMTP email service for password reset OTPs
- JWT-based authentication
- Leaflet/React-Leaflet for interactive maps
- Swagger/OpenAPI documentation
- Optional deployment services: Vercel (frontend) and Render (backend), as referenced by the project README

## 11. Key Functional Areas
- User registration and login
- Password reset with OTP email flow
- EV station discovery and search
- Charging slot booking
- Payment workflow
- User booking history and profile management
- Review and rating system
- Admin dashboard and station management

## 12. Quick Run Notes
- Backend: run with Maven or Docker
- Frontend: run with npm start
- Backend API docs are available through Swagger UI when the app is running
