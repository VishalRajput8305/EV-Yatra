INSERT IGNORE INTO ev_stations
(name, address, city, state, latitude, longitude, total_chargers, available_chargers, price_per_unit, status, created_at)
VALUES
('Tata Power EZ Charge Station 1', 'Sector 1, Indore', 'Indore', 'Madhya Pradesh', 22.763948, 75.793347, 6, 2, 16.0, 'ACTIVE', NOW()),
('ChargeZone Station 2', 'Sector 2, Bhopal', 'Bhopal', 'Madhya Pradesh', 23.183147, 77.474821, 16, 4, 21.9, 'ACTIVE', NOW()),
('Statiq Station 3', 'Sector 3, Pune', 'Pune', 'Maharashtra', 18.447579, 73.790231, 10, 2, 15.8, 'ACTIVE', NOW()),
('Jio-bp Pulse Station 4', 'Sector 4, Mumbai', 'Mumbai', 'Maharashtra', 19.110595, 72.896928, 16, 7, 15.6, 'ACTIVE', NOW()),
('Ather Grid Station 5', 'Sector 5, Delhi', 'Delhi', 'Delhi', 28.680114, 77.224753, 12, 7, 12.8, 'ACTIVE', NOW());