USE leed_cert;

-- create one complete database to import 
CREATE OR REPLACE VIEW LEED_ProjectSummary AS
SELECT
  p.Project_Id,
  co.CountryName AS Country,
  st.StateName,
  ci.CityName,
  p.ProjectTypes,
  cert.CertLevel,
  cert.PointsAchieved,
  p.GrossFloorAreaSqm AS FloorArea,
  sm.EnergySaving,
  sm.CO2Avoided,
  cert.CertDate
FROM projects p
LEFT JOIN location loc ON p.Location_Id = loc.Location_Id
LEFT JOIN city ci ON loc.City_Id = ci.City_Id
LEFT JOIN state st ON ci.State_Id = st.State_Id
LEFT JOIN country co ON st.Country_Id = co.Country_Id
LEFT JOIN certification cert ON p.Project_Id = cert.Project_Id
LEFT JOIN sustainability_metrics sm ON p.Project_Id = sm.Project_Id
WHERE cert.CertDate IS NOT NULL;

SELECT * FROM LEED_ProjectSummary;
