CREATE TABLE IF NOT EXISTS users (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    role VARCHAR(255),
    created_at DATETIME,
    PRIMARY KEY (id),
    UNIQUE KEY uk_users_email (email)
);

CREATE TABLE IF NOT EXISTS ev_stations (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    latitude DOUBLE,
    longitude DOUBLE,
    total_chargers INT,
    available_chargers INT,
    price_per_unit DOUBLE NOT NULL,
    status VARCHAR(255),
    created_at DATETIME,
    PRIMARY KEY (id),
    UNIQUE KEY uk_ev_stations_name (name)
);

CREATE TABLE IF NOT EXISTS charger_slots (
    id BIGINT NOT NULL AUTO_INCREMENT,
    station_id BIGINT,
    slot_number VARCHAR(255),
    charger_type VARCHAR(255),
    status VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS bookings (
    id BIGINT NOT NULL AUTO_INCREMENT,
    user_id BIGINT,
    slot_id BIGINT,
    station_id BIGINT,
    booking_date DATE,
    start_time TIME,
    end_time TIME,
    total_amount DOUBLE,
    status VARCHAR(255),
    created_at DATETIME,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS payments (
    id BIGINT NOT NULL AUTO_INCREMENT,
    booking_id BIGINT,
    user_id BIGINT,
    amount DOUBLE,
    payment_method VARCHAR(255),
    payment_status VARCHAR(255),
    transaction_id VARCHAR(255),
    paid_at DATETIME,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS reviews (
    id BIGINT NOT NULL AUTO_INCREMENT,
    user_id BIGINT,
    station_id BIGINT,
    booking_id BIGINT,
    rating INT NOT NULL,
    comment VARCHAR(500),
    created_at DATETIME,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS password_reset_otp (
    id BIGINT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255),
    otp VARCHAR(255),
    expiry_time DATETIME,
    used BOOLEAN,
    created_at DATETIME,
    PRIMARY KEY (id)
);