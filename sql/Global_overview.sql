USE leed_cert;

-- checking data loading correctly
SHOW TABLES;
SELECT * FROM certification;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM location;
SELECT * FROM projects;
SELECT * FROM state;
SELECT * FROM sustainability_metrics;

-- Global count on projects
SELECT
  COUNT(DISTINCT p.Project_Id) AS total_projects,
  SUM(p.GrossFloorAreaSqm) AS total_floor_area_sqm,
  SUM(sm.CO2Avoided) AS total_CO2_avoided,
  SUM(sm.EnergySaving) AS total_energy_saved,
  SUM(sm.WaterSaving) AS total_water_saved,
  SUM(sm.WasteAvoided) AS total_waste_saved,
  ROUND(SUM(sm.CO2Avoided) / NULLIF(SUM(p.GrossFloorAreaSqm), 0), 4) AS avg_CO2_per_sqm,
  ROUND(SUM(sm.EnergySaving) / NULLIF(SUM(p.GrossFloorAreaSqm), 0), 4) AS avg_energy_per_sqm
FROM projects p
LEFT JOIN sustainability_metrics sm ON p.Project_Id = sm.Project_Id
LEFT JOIN certification c ON p.Project_Id = c.Project_Id
WHERE YEAR(c.CertDate) IN (2024, 2025);

-- project by country
SELECT
  c.CountryName,
  COUNT(p.Project_Id) AS total_projects
FROM projects p
JOIN location l ON p.Location_Id = l.Location_Id
JOIN city ci ON l.City_Id = ci.City_Id
JOIN state s ON ci.State_Id = s.State_Id
JOIN Country c ON s.Country_Id = c.Country_Id
GROUP BY c.CountryName
ORDER BY total_projects DESC;

-- certification level distribution
SELECT
    cert.CertLevel,
    COUNT(*) AS project_count
FROM certification cert
JOIN projects p 
    ON cert.Project_Id = p.Project_Id
GROUP BY cert.CertLevel
ORDER BY project_count DESC;

-- top 5 countries by total certified area
SELECT 
    c.CountryName,
    SUM(p.GrossFloorAreaSqm) AS total_certified_area_sqm
FROM projects p
JOIN location l 
    ON p.Location_Id = l.Location_Id
JOIN city ci 
    ON l.City_Id = ci.City_Id
JOIN state s 
    ON ci.State_Id = s.State_Id
JOIN country c 
    ON s.Country_Id = c.Country_Id
GROUP BY c.CountryName
ORDER BY total_certified_area_sqm DESC
LIMIT 5;

-- average points achieved by country
SELECT
    c.CountryName,
    AVG(cert.PointsAchieved) AS avg_certification_points
FROM certification cert
JOIN projects p ON cert.Project_Id = p.Project_Id
JOIN location l ON p.Location_Id = l.Location_Id
JOIN city ci ON l.City_Id = ci.City_Id
JOIN state s ON ci.State_Id = s.State_Id
JOIN country c ON s.Country_Id = c.Country_Id
GROUP BY c.CountryName
ORDER BY avg_certification_points DESC;

-- projects count by country and certification level
SELECT 
    co.CountryName,
    c.CertLevel,
    COUNT(DISTINCT p.Project_Id) AS Project_Count,
    SUM(c.PointsAchieved) AS Total_Points_Achieved
FROM projects p
JOIN location l ON p.Location_Id = l.Location_Id
JOIN city ci ON l.City_Id = ci.City_Id
JOIN state s ON ci.State_Id = s.State_Id
JOIN country co ON s.Country_Id = co.Country_Id
JOIN certification c ON p.Project_Id = c.Project_Id
GROUP BY co.CountryName, c.CertLevel
ORDER BY co.CountryName, c.CertLevel;

