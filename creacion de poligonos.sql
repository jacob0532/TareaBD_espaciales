DECLARE @casa1 geometry,@casa2 geometry,@casa3 geometry,@casa4 geometry;
DECLARE @comercio1 geometry, @comercio2 geometry, @comercio3 geometry, @comercio4 geometry;
DECLARE @calle1 geometry,@calle2 geometry,@calle3 geometry,@calle4 geometry; 

--calle
--SET @calle1 = geometry::STGeomFromText('POLYGON((1 0, 1 1, 15 1, 15 0, 1 0))',0);
--SET @calle2 = geometry::STGeomFromText('POLYGON((15 0, 15 15, 16 15, 16 0, 15 0))',0);
--SET @calle3 = geometry::STGeomFromText('POLYGON((1 15, 15 15, 15 14, 1 14, 1 15))',0);
--SET @calle4 = geometry::STGeomFromText('POLYGON((1 1, 2 1, 2 14, 1 14, 1 1))',0);
SET @calle1 = geometry::STGeomFromText('MULTIPOLYGON(((1 0, 1 1, 15 1, 15 0, 1 0)),((15 0, 15 15, 16 15, 16 0, 15 0)),((1 15, 15 15, 15 14, 1 14, 1 15)),((1 1, 2 1, 2 14, 1 14, 1 1)))',0);
--Casas
SET @casa1 = geometry::STGeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))',0); --x15
SET @casa2 = geometry::STGeomFromText('POLYGON((0 1, 1 1, 1 2, 0 2, 0 1))',0);
SET @casa3 = geometry::STGeomFromText('POLYGON((0 2, 1 2, 1 3, 0 3, 0 2))',0);

SELECT @calle1 UNION ALL SELECT @casa1 UNION ALL SELECT @casa2 UNION ALL SELECT @casa3;
--Comercios
--SET @g2 = geometry::STGeomFromText('POLYGON((0 0, 0 1, 2 1, 2 0, 0 0))',0);



--SELECT @g5.STUnion(@g6.STUnion(@g7)) UNION ALL SELECT @curva1
--SET @g6 = geometry::STGeomFromText('CURVEPOLYGON(CIRCULARSTRING(0 0, 1 0, 3 0, 3 3, 0 0))',0);
