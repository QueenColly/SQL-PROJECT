-- A
SELECT *
FROM ITEM, SHIPMENT, SHIPMENT_ITEM;

-- B
SELECT ShipmentID,
 ShipperName,
 ShipperInvoiceNumber
FROM SHIPMENT;
-- c
SELECT ShipmentID,
 ShipperName,
 ShipperInvoiceNumber
FROM SHIPMENT
WHERE InsuredValue > 10000;

-- D
SELECT ShipmentID,
 ShipperName,
 ShipperInvoiceNumber
FROM SHIPMENT
WHERE ShipperName like 'AB%';

-- E
SELECT ShipmentID, 
ShipperName,
 ShipperInvoiceNumber, 
 ArrivalDate
FROM SHIPMENT
WHERE month(DepartureDate) = 12;

-- F
SELECT ShipmentID,
 ShipperName,
 ShipperInvoiceNumber ,
 ArrivalDate
FROM SHIPMENT
WHERE day(DepartureDate) = 10;

-- G
SELECT max(InsuredValue) AS maximum,
		min(InsuredValue) AS minimum
FROM SHIPMENT;

-- H
SELECT avg(InsuredValue) AS averageInsuredValue
FROM SHIPMENT;

-- I
SELECT count(SHIPMENTID) AS number_of_shipment
FROM SHIPMENT;

-- J
 SELECT ItemID, 
 Description, 
 Store, 
(LocalCurrencyAmount * ExchangeRate) 
 as USCurrencyAmount
FROM ITEM;

-- k
SELECT City,Store
FROM ITEM
GROUP by City , Store;

-- L
SELECT City, 
Store, 
count(*) AS number_of_purchases
FROM ITEM
GROUP BY City, Store;

-- m
SELECT ShipperName,
 ShipmentID, 
 DepartureDate
FROM SHIPMENT 
WHERE SHIPMENTID IN
	(SELECT ShipmentID
    FROM SHIPMENT_ITEM
    WHERE VALUE >= 1000)
    ORDER BY ShipperName ASC,
    DepartureDate DESC;
 
 -- n
USE mi_ch02;

SELECT DISTINCT
       S.ShipperName,
       S.ShipmentID,
       S.DepartureDate
FROM SHIPMENT AS S
JOIN SHIPMENT_ITEM AS SI
    ON S.ShipmentID = SI.ShipmentID
WHERE SI.Value >= 1000
ORDER BY S.ShipperName ASC,
         S.DepartureDate DESC;

 
-- O
SELECT ShipperName,
       ShipmentID,
       DepartureDate
FROM SHIPMENT
WHERE ShipmentID IN
      (SELECT ShipmentID
       FROM SHIPMENT_ITEM
       WHERE ItemID IN
             (SELECT ItemID
              FROM ITEM
              WHERE City = 'Singapore'))
ORDER BY ShipperName ASC,
         DepartureDate DESC;
         
         -- P
 SELECT S.ShipperName,
       S.ShipmentID,
       S.DepartureDate
FROM SHIPMENT AS S,
     SHIPMENT_ITEM AS SI,
     ITEM AS I
WHERE S.ShipmentID = SI.ShipmentID
  AND SI.ItemID = I.ItemID
  AND I.City = 'Singapore'
ORDER BY S.ShipperName ASC,
         S.DepartureDate DESC;
         
         -- Q
 SELECT S.ShipperName,
       S.ShipmentID,
       S.DepartureDate
FROM SHIPMENT AS S
INNER JOIN SHIPMENT_ITEM AS SI
        ON S.ShipmentID = SI.ShipmentID
INNER JOIN ITEM AS I
        ON SI.ItemID = I.ItemID
WHERE I.City = 'Singapore'
ORDER BY S.ShipperName ASC,
         S.DepartureDate DESC;
         
 -- R
 SELECT S.ShipperName,
       S.ShipmentID,
       S.DepartureDate,
       SI.Value
FROM SHIPMENT AS S
INNER JOIN SHIPMENT_ITEM AS SI
        ON S.ShipmentID = SI.ShipmentID
WHERE SI.ItemID IN
      (SELECT ItemID
       FROM ITEM
       WHERE City = 'Singapore')
ORDER BY S.ShipperName ASC,
         S.DepartureDate DESC;
         
         -- S
 SELECT S.ShipperName,
       S.ShipmentID,
       S.DepartureDate,
       SI.Value
FROM SHIPMENT AS S
INNER JOIN SHIPMENT_ITEM AS SI
        ON S.ShipmentID = SI.ShipmentID
INNER JOIN ITEM AS I
        ON SI.ItemID = I.ItemID
WHERE I.City = 'Singapore'

UNION

SELECT S.ShipperName,
       S.ShipmentID,
       S.DepartureDate,
       NULL AS Value
FROM SHIPMENT AS S
WHERE S.ShipmentID NOT IN
      (SELECT SI.ShipmentID
       FROM SHIPMENT_ITEM AS SI
       INNER JOIN ITEM AS I
               ON SI.ItemID = I.ItemID
       WHERE I.City = 'Singapore')

ORDER BY Value ASC,
         ShipperName ASC,
         DepartureDate DESC;




