USE espaciales
--Inserción y lectura de datos desde un archivo XML
--Ruta: C:\Users\yeico\Desktop\TareaBD_espaciales\BDEspaciales_Datos.xml jacob
-- C:\Users\josh\Downloads\TareaBD_espaciales-main\BDEspaciales_Datos.xml joishua
DECLARE @xmlData XML

SET @xmlData = (
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\yeico\Desktop\TareaBD_espaciales\BDEspaciales_Datos.xml', SINGLE_BLOB) AS xmlData
		)


--Inserta el dia de la semana
INSERT INTO DiaSemana (Nombre )
SELECT ref.value('@Nombre', 'VARCHAR(50)')
FROM @xmlData.nodes('Catalogos/Dia_Semana/Dia_Semana') xmlData(ref)

--Inserta los tipos de comercio
INSERT INTO TipoComercio(Nombre )
SELECT ref.value('@Nombre', 'VARCHAR(50)')
FROM @xmlData.nodes('Catalogos/Tipo_Comercio/Tipo_Comercio') xmlData(ref)

--Inserta los tipos de productos que hay en los comercios 
INSERT INTO TipoProducto(Nombre)
SELECT ref.value('@Nombre', 'VARCHAR(50)')
FROM @xmlData.nodes('Catalogos/Tipo_Producto/Tipo_Producto') xmlData(ref)


--Inserta los tipos de bloque
INSERT INTO TipoBloque(id,nombre)
SELECT ref.value('@Id', 'int'),
ref.value('@Nombre','VARCHAR(50)')
FROM @xmlData.nodes('Catalogos/Tipo_de_bloque/TipoBloque') xmlData(ref)

--Inserta un bloque para la ciudad en la tabla bloque

INSERT INTO Bloque(letraBloque,area,figura,puntoCentro,idTipoBloqueFK,idTipoComercioFK)
SELECT ref.value('@letraBloque','CHAR(1)'),
geometry::STGeomFromText(ref.value('@figura','VARCHAR(100)'),0).STArea(),
geometry::STGeomFromText(ref.value('@figura','VARCHAR(100)'),0),
geometry::STGeomFromText(ref.value('@figura','VARCHAR(100)'),0).STCentroid(),
ref.value('@idTipoBloqueFK','int'),
ref.value('@idTipoComercioFK','int')
FROM @xmlData.nodes('Catalogos/Bloque/Bloque') xmlData(ref)

--Inserta un producto
INSERT INTO Producto(nombre,descripcion,idTipoProductoFK)
SELECT ref.value('@nombre','VARCHAR(50)'),
ref.value('@descripcion','VARCHAR(50)'),
ref.value('@idTipoProductoFK','int')
FROM @xmlData.nodes('Catalogos/Producto/Producto') xmlData(ref)

--Inserta los productos en sus respectivos inventarios
INSERT INTO Inventario(precioUnidad,cantidad,idProductoFK,idBloqueFK)
SELECT ref.value('@precioUnidad','int'),
ref.value('@cantidad','int'),
ref.value('@idProductoFK','int'),
ref.value('@idBloqueFK','int')
FROM @xmlData.nodes('Catalogos/Inventario/Producto') xmlData(ref)




----SELECT * FROM TipoBloque;
----SELECT * FROM sys.spatial_reference_systems;