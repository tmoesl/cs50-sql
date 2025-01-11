
-- *** The Lost Letter ***
-- Retrieve IDs and addresses for Anneke's address and Varsha's address
SELECT id, address
FROM addresses
WHERE address IN ('900 Somerville Avenue', '2 Finnigan Street');

-- Retrieve package details, including driver and address information, for packages with "congratulatory" content
SELECT t2.package_id, t2.address_id, t3.address, t3.type, t1.contents, t2.driver_id, t2.action
FROM packages t1
INNER JOIN scans t2
    ON t1.id = t2.package_id
INNER JOIN addresses t3
    ON t2.address_id = t3.id
WHERE t1.contents LIKE '%congratulatory%';

-- Retrieve drop-off locations (address and type) for packages with "congratulatory" in contents, confirming origin and destination
SELECT t3.address, t3.type
FROM packages t1
INNER JOIN scans t2
    ON t1.id = t2.package_id
INNER JOIN addresses t3
    ON t2.address_id = t3.id
WHERE t1.contents LIKE '%congratulatory%'
    AND t1.from_address_id = (SELECT id FROM addresses WHERE address = '900 Somerville Avenue')
    AND t1.to_address_id = (SELECT id FROM addresses WHERE address = '2 Finnigan Street')
    AND t2.action = 'Drop';

-- *** The Devious Delivery ***
-- Retrieve IDs, destination addresses, and contents of packages with "duck" in contents and no origin address
SELECT id, to_address_id, contents
FROM packages
WHERE contents LIKE '%duck%'
    AND from_address_id IS NULL;

-- Retrieve detailed information for packages containing "duck" with no origin address, including package ID, delivery address, address type, contents, driver ID, and action
SELECT t2.package_id, t2.address_id, t3.address, t3.type, t1.contents, t2.driver_id, t2.action
FROM packages t1
INNER JOIN scans t2
    ON t1.id = t2.package_id
INNER JOIN addresses t3
    ON t2.address_id = t3.id
WHERE t1.contents LIKE '%duck%'
    AND t1.from_address_id IS NULL;

-- Retrieve drop-off locations (address and type) for packages with "duck" in contents and no origin address
SELECT t3.address, t3.type
FROM packages t1
INNER JOIN scans t2
    ON t1.id = t2.package_id
INNER JOIN addresses t3
    ON t2.address_id = t3.id
WHERE t1.contents LIKE '%duck%'
    AND t1.from_address_id IS NULL
    AND t2.action = 'Drop';


-- *** The Forgotten Gift ***
-- Retrieve IDs and addresses for Anneke's address and Varsha's address
SELECT id, address
FROM addresses
WHERE address IN ('109 Tileston Street', '728 Maple Place');

-- Retrieve full package details, including driver and address information, for packages sent from 109 Tileston Street to 728 Maple Place
SELECT t2.package_id, t2.address_id, t3.address, t3.type, t1.contents, t2.driver_id, t2.action, t4.name AS driver_name
FROM packages t1
INNER JOIN scans t2
    ON t1.id = t2.package_id
INNER JOIN addresses t3
    ON t2.address_id = t3.id
INNER JOIN drivers t4
    ON t2.driver_id = t4.id
WHERE t1.from_address_id = (SELECT id FROM addresses WHERE address = '109 Tileston Street')
    AND t1.to_address_id = (SELECT id FROM addresses WHERE address = '728 Maple Place');

-- Retrieve current holder of the package, identifying the driver who last picked it up for packages sent from 109 Tileston Street to 728 Maple Place
SELECT t1.contents, t4.name AS driver_name
FROM packages t1
INNER JOIN scans t2
    ON t1.id = t2.package_id
INNER JOIN addresses t3
    ON t2.address_id = t3.id
INNER JOIN drivers t4
    ON t2.driver_id = t4.id
WHERE t1.from_address_id = (SELECT id FROM addresses WHERE address = '109 Tileston Street')
    AND t1.to_address_id = (SELECT id FROM addresses WHERE address = '728 Maple Place')
    AND t2.timestamp = (SELECT MAX(timestamp) FROM scans WHERE package_id = t1.id);
