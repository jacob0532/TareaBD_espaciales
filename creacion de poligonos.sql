DECLARE @g1 geometry,@g2 geometry,@g3 geometry,@g4 geometry,@g5 geometry,@g6 geometry,@g7 geometry;
DECLARE @curva1 geometry, @curva2 geometry, @curva3 geometry, @curva4 geometry;
DECLARE @calle1 geometry; 
--Casas
SET @g1 = geometry::STGeomFromText('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))',0);
--Comercios
SET @g2 = geometry::STGeomFromText('POLYGON((0 0, 0 1, 2 1, 2 0, 0 0))',0);
--calle
SET @g3 = geometry::STGeomFromText('POLYGON((0 0, 0 1, 5 1, 5 0, 0 0))',0);
--calle curva
SET @g5 = geometry::STGeomFromText('POLYGON((15 0, 15 15, 16 15, 16 0, 15 0))',0);
SET @g6 = geometry::STGeomFromText('POLYGON((5 0, 10 0, 10 1, 5 1, 5 0))',0);
SET @g7 = geometry::STGeomFromText('POLYGON((10 0, 15 0, 15 1, 10 1, 10 0))',0);

SET @calle1 = geometry::STGeomFromText('MULTIPOLYGON(((0 0, 5 0, 5 1, 0 1, 0 0)),((5 0, 10 0, 10 1, 5 1, 5 0)),((10 0, 15 0, 15 1, 10 1, 10 0)))',0);
SELECT @calle1 UNION ALL SELECT @g5 UNION ALL SELECT @g6
--SELECT @g5.STUnion(@g6.STUnion(@g7)) UNION ALL SELECT @curva1
--SET @g6 = geometry::STGeomFromText('CURVEPOLYGON(CIRCULARSTRING(0 0, 1 0, 3 0, 3 3, 0 0))',0);