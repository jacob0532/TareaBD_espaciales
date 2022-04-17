DECLARE @shape geometry;
DECLARE @shape2 geometry;
SET @shape = geometry::STGeomFromText('POLYGON((10 40, 40 40, 40 15, 10 40))',0);
--SET @shape2 = geometry::STGeomFromText('POLYGON((100 30, 25 15, 40 10, 100 30))',0);
SELECT @shape
--union all
--SELECT @shape2
--select @shape1.STUnion(@shape2)
--select @shape1.STDistance(@shape2);

DECLARE @calle1 geometry;
DECLARE @calle2 geometry;
DECLARE @calle3 geometry;
SET @calle1 = geometry::STGeomFromText('POLYGON((0 0, 0 50, 50 50, 50 0, 0 0))',0);
SET @calle2 = geometry::STGeomFromText('POLYGON((0 0,50 100, 100 100, 100 50, 0 0))',0);
SET @calle3 = geometry::STGeomFromText('POLYGON((300 300, 600 400, 300 0, 1000 690, 300 300))',0);
SELECT @calle1.STIsValid();
SELECT @calle2.STIsValid();
SELECT @calle3.STIsValid();
SELECT @calle1.STTouches(@calle2);
SELECT @calle1.STOverlaps(@calle3);  
SELECT @calle1 UNION ALL SELECT @calle2 UNION ALL SELECT @calle3;

DECLARE @g geometry;  
SET @g = geometry::STGeomFromText('POLYGON((0 0, 3 0, 3 3, 0 3, 0 0))', 0);
SELECT @g
SELECT @g.STCentroid().ToString();  


--INSERTA LAS MEDIDAS DE LOS LADOS DE SU PROPIEDAD O LOCAL
--

DECLARE @g1 geometry = 'GEOMETRYCOLLECTION EMPTY';  
DECLARE @g2 geometry = 'GEOMETRYCOLLECTION(LINESTRING EMPTY,POLYGON((-1 -1, -1 -5, -5 -5, -5 -1, -1 -1)))';  
DECLARE @g3 geometry = 'GEOMETRYCOLLECTION(LINESTRING(1 1, 3 5),POLYGON((-1 -1, -1 -5, -5 -5, -5 -1, -1 -1)))';
SELECT @g3


DECLARE @g1 geometry = 'CIRCULARSTRING EMPTY';  
DECLARE @g2 geometry = 'CIRCULARSTRING(1 1, 2 0, -1 1)';  
DECLARE @g3 geometry = 'CIRCULARSTRING(1 1, 2 0, 2 0, 1 1, 0 1)';  
DECLARE @g4 geometry = 'CIRCULARSTRING(1 1, 2 2, 2 2)';  
SELECT @g3



DECLARE @g1 geometry = 'MULTIPOLYGON EMPTY';  
DECLARE @g2 geometry = 'MULTIPOLYGON(((1 1, 1 -1, -1 -1, -1 1, 1 1)),((1 1, 3 1, 3 3, 1 3, 1 1)))';  
DECLARE @g3 geometry = 'MULTIPOLYGON(((2 2, 2 -2, -2 -2, -2 2, 2 2)),((1 1, 3 1, 3 3, 1 3, 1 1)))';  
SELECT @g1.STIsValid(), @g2.STIsValid(), @g3.STIsValid();  
SELECT @g2


DECLARE @g geometry;  
DECLARE @h geometry;  
SET @g = geometry::STGeomFromText('POLYGON((0 0, 2 0, 2 2, 0 2, 0 0))', 0);  
SET @h = geometry::STGeomFromText('POLYGON((2 2, 3 2, 3 3, 2 3, 2 2))', 0);  
SELECT @g.STOverlaps(@h);
SELECT @g.STIntersects(@h);
SELECT @g UNION ALL SELECT @h


DECLARE @g1 geometry = 'CURVEPOLYGON EMPTY';  
DECLARE @g2 geometry = 'CURVEPOLYGON(CIRCULARSTRING(1 3, 3 5, 4 7, 7 3, 1 3))';  
SELECT @g1.STIsValid(), @g2.STIsValid();  
SELECT @g2


DECLARE @g1 geometry = 'GEOMETRYCOLLECTION EMPTY';  
DECLARE @g2 geometry = 'GEOMETRYCOLLECTION(LINESTRING EMPTY,POLYGON((-1 -1, -1 -5, -5 -5, -5 -1, -1 -1)))';  
DECLARE @g3 geometry = 'GEOMETRYCOLLECTION(LINESTRING(1 1, 3 5),POLYGON((-1 -1, -1 -5, -5 -5, -5 -1, -1 -1)))';  
DECLARE @g4 geometry = 'GEOMETRYCOLLECTION(LINESTRING(1 1, 3 5),POLYGON((-1 -1, 1 -5, -5 5, -5 -1, -1 -1)))';  
SELECT @g1.STIsValid(), @g2.STIsValid(), @g3.STIsValid(), @g4.STIsValid();  
SELECT @g3[0];


DECLARE @g geometry;  
SET @g = geometry::STGeomCollFromText('GEOMETRYCOLLECTION(POINT(3 3 1), POLYGON((0 0 2, 1 10 3, 1 0 4, 0 0 2)))', 1);
SELECT @g;