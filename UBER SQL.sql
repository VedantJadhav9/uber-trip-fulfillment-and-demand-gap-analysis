-- UBER SUPPLY DEMAND GAP ANALYSIS

SELECT * FROM pizzahut.uber_data;


#1.TOTAL NO. OF REQUEST FOR DIFFERENT TIME SLOTS
SELECT `Time Slot`, COUNT(`ï»¿Request id`) AS Total_Requests
FROM uber_data
GROUP BY `Time Slot`
ORDER BY Total_Requests DESC;


#2.TOTAL NO. OF REQUEST FOR DIFFERENT TIME SLOTS & STATUS
SELECT `Time Slot`, `Status`, COUNT(`ï»¿Request id`) AS Request_Count
FROM uber_data
GROUP BY `Time Slot`, `Status`
ORDER BY `Time Slot`, `Status`;


#3.TRIP FULFILMENT STATUS BY TIME OF DAY
SELECT 
  `Time Slot`,
  COUNT(`ï»¿Request id`) AS Total_Requests,
  SUM(CASE WHEN `Status` = 'Trip Completed' THEN 1 ELSE 0 END) AS Completed,
  SUM(CASE WHEN `Status` != 'Trip Completed' THEN 1 ELSE 0 END) AS Supply_Gap
FROM uber_data
GROUP BY `Time Slot`
ORDER BY Supply_Gap DESC;


#4.CANCELLED TRIPS COUNT BY TIME SLOT
SELECT 
  `Time Slot`,
  SUM(CASE WHEN `Status` = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled
FROM uber_data
GROUP BY `Time Slot`
ORDER BY Cancelled DESC;


#5.TRIP STATUS DISTRIBUTION BY PICKUP POINT
SELECT 
  `Pickup point`, 
  `Status`, 
  COUNT(`ï»¿Request id`) AS Request_Count
FROM uber_data
GROUP BY `Pickup point`, `Status`
ORDER BY `Pickup point`, Request_Count DESC;


#6.TOTAL TRIP REQUESTS BY HOUR OF THE DAY
SELECT `Hour`, COUNT(`ï»¿Request id`) AS Total_Requests
FROM uber_data
GROUP BY `Hour`
ORDER BY `Hour`;



#7.TRIP STATUS DISTRIBUTION
SELECT `Status`, COUNT(`ï»¿Request id`) AS Count
FROM uber_data
GROUP BY `Status`
ORDER BY Count DESC;


#8.TOTAL TRIP REQUESTS BY PICKUP POINT
SELECT `Pickup point`, COUNT(`ï»¿Request id`) AS Count
FROM uber_data
GROUP BY `Pickup point`;
