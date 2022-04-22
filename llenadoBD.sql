USE espaciales
--Inserción y lectura de datos desde un archivo XML
--Ruta: C:\Users\yeico\Desktop\BDTarea2\XML\catalogos.xml jacob
-- C:\Users\josh\Downloads\TareaBD_espaciales-main\BDEspaciales_Datos.xml joishua
DECLARE @xmlData XML

SET @xmlData = (
		SELECT *
		FROM OPENROWSET(BULK 'C:\Users\josh\Downloads\TareaBD_espaciales-main\BDEspaciales_Datos.xml', SINGLE_BLOB) AS xmlData
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


--Inserta los productos en sus respectivos inventarios
INSERT INTO Inventario(Nombre,descripcion,precio,cantidad,idTipoProductoFK)
SELECT ref.value('@Nombre','VARCHAR(50)'),
ref.value('@Descripcion','VARCHAR(100)'),
ref.value('@Precio','int'),
ref.value('@Cantidad','int')
,ref.value('@FKTipo','int')
FROM @xmlData.nodes('Catalogos/Inventario/Producto') xmlData(ref)

--Inserta los tipos de bloque
INSERT INTO TipoBloque(nombre)
SELECT ref.value('@nombre','VARCHAR(50)')
FROM @xmlData.nodes('Catalogos/Tipo_de_bloque/TipoBloque') xmlData(ref)

--Inserta un bloque para la ciudad en la tabla bloque

INSERT INTO Bloque(letraBloque,area,figura,puntoCentro,idInventarioFK,idTipoBloqueFK,idTipoComercioFK)
SELECT ref.value('@letraBloque','CHAR(1)'),
ref.value('@area','int'),
geometry::STGeomFromText(ref.value('@figura','VARCHAR(100)'),0),
geometry::STGeomFromText(ref.value('@figura','VARCHAR(100)'),0).STCentroid(), --Cambiar el tipo de dato a geography?
ref.value('@idInventarioFK','int'),
ref.value('@idTipoBloqueFK','int'),
ref.value('@idTipoComercioFK','int')
FROM @xmlData.nodes('Catalogos/Bloque/Bloque') xmlData(ref)
