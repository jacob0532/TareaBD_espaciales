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
