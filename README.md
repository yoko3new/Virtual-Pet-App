# PetPals

PetPals is an educational game designed for individuals interested in adopting pets. It helps users learn how to care for pets in a fun and interactive way, combining pet care education with engaging gameplay.

---

## Setup and Installation

### Prerequisites
- An IDE (e.g., Android Studio, Visual Studio Code, or IntelliJ IDEA)
- Flutter SDK installed
- Android Emulator installed and configured
- Node.js and npm installed
- AWS CLI installed and configured

### Installation Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/yoko3new/Virtual-Pet-App.git
   cd petpals
   ```
2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```
3. **Backend and database setup**:
   
   #### Backend Setup (Node.js):
   - Navigate to the backend directory:
     ```bash
     cd backend
     ```
   - Install Node.js dependencies:
     ```bash
     npm install
     ```
   - Create a `.env` file in the `backend` directory with the following environment variables:
     ```env
     DB_HOST=your-database-endpoint
     DB_USER=your-username
     DB_PASSWORD=your-password
     DB_NAME=your-database-name
     PORT=3000
     ```
   - Start the backend server:
     ```bash
     node server.js
     ```

   #### Database Setup (AWS RDS):
   - Log in to the AWS Management Console.
   - Navigate to the RDS service and create a database instance (e.g., MySQL or PostgreSQL).
   - Configure your database instance and note down the endpoint, username, and password.
   - Ensure the database is publicly accessible and update your `.env` file with these details.

---

### Running the Project
1. **Start the backend**:
   - Ensure the Node.js backend is running:
     ```bash
     cd backend
     node server.js
     ```

2. **Run the Flutter app**:
   - Start the Android Emulator.
   - Open `main.dart` in your IDE.
   - Run the app using the "Run" button or the following command:
     ```bash
     flutter run
     ```

---

## Key Features
- **Pet Customization**: Personalize your pet's appearance and traits.
- **Learning Quizzes**: Interactive quizzes to learn about pet care.
- **Technical Support**: Get assistance whenever needed.
- **Profile Management**: Manage user profiles and preferences.
- **Pet Mood**: Track and understand your pet's emotional state.
- **Milestones**: Achieve and celebrate pet care milestones.
- **Pet Care Checklist**: Step-by-step tasks for taking care of pets.
- **Pet Selection**: Choose from various pets to adopt.
- **Pet Dashboard**: A central hub to monitor and interact with your pet.
- **Registration**: Create a new account to use the app.
- **Login/Logout**: Securely log in and out of the app.

---

## Configuration
- **Environment Variables**:
  - Backend `.env`:
    ```env
    DB_HOST='virtual-pet-db.c3iywe2ual94.us-east-1.rds.amazon.com'
    DB_USER='virtualpet_admin'
    DB_PASSWORD='petpals123'
    DB_NAME='pet_care_db'
    PORT=3306
    ```
  
- **Dependencies**:
  - Node.js dependencies (in `package.json`):
    ```json
    {
      "express": "^4.x",
      "mysql2": "^3.x",
      "dotenv": "^16.x"
    }
    ```
  - Flutter dependencies (in `pubspec.yaml`):
    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      provider: ^6.0.5
    ```
