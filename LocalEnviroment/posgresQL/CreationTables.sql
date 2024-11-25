CREATE TABLE AuditLog (
    id UUID PRIMARY KEY,
    userId VARCHAR(255) NOT NULL,
    action VARCHAR(255) NOT NULL,
    ipAddress VARCHAR(45) NOT NULL,
    timestamp TIMESTAMP NOT NULL
);

CREATE TABLE Rol (
    id UUID PRIMARY KEY,
    roleName VARCHAR(50) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    createdAt TIMESTAMP NOT NULL,
    updatedAt TIMESTAMP NOT NULL
);

CREATE TABLE Users (
    id UUID PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    fullName VARCHAR(255) NOT NULL,
    roleId UUID NOT NULL,
    createdAt TIMESTAMP NOT NULL,
    updatedAt TIMESTAMP NOT NULL,
    CONSTRAINT fk_role
      FOREIGN KEY(roleId) 
      REFERENCES Roles(id)
);

CREATE TABLE BankAccount (
    id UUID PRIMARY KEY,
    accountNumber VARCHAR(255) NOT NULL UNIQUE,
    accountHolder VARCHAR(255) NOT NULL,
    balance DECIMAL(15, 2) NOT NULL,
    createdAt TIMESTAMP NOT NULL,
    updatedAt TIMESTAMP NOT NULL,
    userId UUID NOT NULL,
    CONSTRAINT fk_user
      FOREIGN KEY(userId) 
      REFERENCES Users(id)
);