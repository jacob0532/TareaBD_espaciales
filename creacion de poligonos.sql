DECLARE @casa1 geometry,@casa2 geometry,@casa3 geometry,@casa4 geometry;
DECLARE @comercio1 geometry, @comercio2 geometry, @comercio3 geometry, @comercio4 geometry;
DECLARE @calle1 geometry,@calle2 geometry,@calle3 geometry,@calle4 geometry; 

--calle
SET @calle1 = geometry::STGeomFromText('MULTIPOLYGON(((1 0, 1 1, 15 1, 15 0, 1 0)),((15 0, 15 15, 16 15, 16 0, 15 0)),((8 1, 8 14, 9 14, 9 1, 8 1)),((2 8, 2 9, 8 9, 8 8, 2 8)),((9 8, 9 9, 15 9, 15 8, 9 8)),((1 15, 15 15, 15 14, 1 14, 1 15)),((1 1, 2 1, 2 14, 1 14, 1 1)))',0);

--Casas
SET @casa1 = geometry::STGeomFromText('POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))',0); --Aumentar en 1 el y 
SET @casa2 = geometry::STGeomFromText('POLYGON((16 0, 17 0, 17 1, 16 1, 16 0))',0); --Aumentar en 1 el y 
SET @casa3 = geometry::STGeomFromText('POLYGON((0 0, 0 -1, 1 -1, 1 0, 0 0))',0); --Aumentar en 1 el x 
SET @casa4 = geometry::STGeomFromText('POLYGON((0 15, 0 16, 1 16, 1 15, 0 15))',0);--Aumentar en 1 el x
--Comercios
SET @comercio1 = geometry::STGeomFromText('CURVEPOLYGON(CIRCULARSTRING(2 2, 3 4, 2 6, 6 2, 2 2))',0);
SET @comercio2 = geometry::STGeomFromText('POLYGON((2 14, 8 14, 8 10, 2 10, 2 14))',0);
SET @comercio3 = geometry::STGeomFromText('POLYGON((10 10, 10 12, 12 14, 12 12, 12 10, 10 10))',0);
SET @comercio4 = geometry::STGeomFromText('POLYGON((10 1, 10 8, 14 8, 14 1, 10 1))',0);
SELECT @comercio2 UNION ALL SELECT @casa1 UNION ALL SELECT @casa2 UNION ALL SELECT @casa3 UNION ALL SELECT @casa4 UNION ALL
SELECT @comercio1 UNION ALL
SELECT @comercio3 UNION ALL
SELECT @calle1 UNION ALL
SELECT @comercio4



--SELECT @g5.STUnion(@g6.STUnion(@g7)) UNION ALL SELECT @curva1
--SET @g6 = geometry::STGeomFromText('CURVEPOLYGON(CIRCULARSTRING(0 0, 1 0, 3 0, 3 3, 0 0))',0);
