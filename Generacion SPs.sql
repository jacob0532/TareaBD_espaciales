------------------CREACIÓN------------------------
-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 18/04/2022
-- Description:	Selecciona la información de un inventario
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Inventario_read] 
AS
BEGIN

	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRY
		SELECT Producto.nombre AS [Nombre del producto]
		,Inventario.cantidad AS Cantidad
		,Inventario.precioUnidad AS [Precio por unidad]
		,Producto.descripcion AS Descripcion
		,TipoProducto.nombre AS [Tipo de producto]
		,TipoComercio.nombre AS [Tipo de comercio]
	FROM Inventario
		INNER JOIN Producto ON Inventario.idProductoFK = Producto.id
		INNER JOIN Bloque ON Inventario.idBloqueFK = Bloque.id
		INNER JOIN TipoProducto ON Producto.idTipoProductoFK = TipoProducto.id
		INNER JOIN TipoComercio ON Bloque.idTipoComercioFK = TipoComercio.id
	RETURN 0;
	END TRY
	---------
	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 18/04/2022
-- Description:	Inserción de productos en los inventarios
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Inventario_create] 
	-- Add the parameters for the stored procedure here
	@idProductoFK int,
	@idBloqueFK int,
	@precioUnidad int,
	@cantidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	
	INSERT INTO Inventario (
		idProductoFK
		,idBloqueFK
		,precioUnidad
		,cantidad
	)
	VALUES (
		@idProductoFK
		,@idBloqueFK
		,@precioUnidad
		,@cantidad
	)
	RETURN 0;
	END TRY
	---------
	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 18/04/2022
-- Description:	Actualizacion de la informacion de los productos en un inventario; 
-- Debería actualizar un campo, solamente si le envían un dato nuevo para dicho campo
-- =============================================
CREATE PROCEDURE [dbo].[Inventario_update] 
	-- Add the parameters for the stored procedure here
	@InventarioID int = 0,
	@idProductoFK int,
	@idBloqueFK int,
	@precioUnidad int,
	@cantidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	
	UPDATE [dbo].[Inventario]
	SET idBloqueFK = @idBloqueFK
		,idProductoFK = @idProductoFK
		,cantidad = @cantidad
		,precioUnidad = @precioUnidad
	WHERE id = @InventarioID

	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 18/04/2022
-- Description:	Elimina un inventario
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Inventario_delete]
	-- Add the parameters for the stored procedure here
	@inventarioID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	DELETE FROM [dbo].[Inventario]
      WHERE id = @inventarioID
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 25/4/2022
-- Description:	Obtiene los tipos de producto
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Tipo_de_producto_read] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

    -- Insert statements for procedure here
	BEGIN TRY
	SELECT *
	FROM TipoProducto;
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH

END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 25/04/2022
-- Description:	Crea un tipo de producto
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Tipo_de_producto_create] 
	
AS
BEGIN
	DECLARE @nombre VARCHAR(50)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

    -- Insert statements for procedure here
	BEGIN TRY

	INSERT INTO TipoProducto (nombre)
	VALUES	(@nombre)
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 25/04/2022
-- Description:	Elimina la información de un tipo de producto
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Tipo_de_producto_delete]
	
AS
BEGIN
	DECLARE @idTipo_Producto int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

    -- Insert statements for procedure here
	BEGIN TRY

	DELETE TipoProducto
	WHERE @idTipo_Producto = TipoProducto.id;
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 25/04/2022
-- Description:	Actualiza la información de un tipo de producto
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Tipo_de_producto_update]
	
AS
BEGIN
	DECLARE @idTipo_Producto int,
	@nombre VARCHAR(50)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

    -- Insert statements for procedure here
	BEGIN TRY

	UPDATE TipoProducto
	SET	nombre = @nombre
	WHERE @idTipo_Producto = TipoProducto.id;
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 26/04/2022
-- Description:	Inserta un nuevo producto en la base de datos
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Producto_create] 
	-- Add the parameters for the stored procedure here
	@nombre VARCHAR(50),
	@descripcion VARCHAR(100),
	@idTipoProductoFK int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;


    -- Insert statements for procedure here
	BEGIN TRY
	INSERT INTO Producto(nombre,descripcion,idTipoProductoFK)
	VALUES (@nombre,@descripcion,@idTipoProductoFK)
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH

END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 26/04/2022
-- Description:	Elimina la informacion de un producto de la base de datos
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Producto_delete]
	-- Add the parameters for the stored procedure here
	@idProducto int,
	@nombre VARCHAR(50),
	@descripcion VARCHAR(100),
	@idTipoProductoFK int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;


    -- Insert statements for procedure here
	BEGIN TRY
	DELETE Producto
	WHERE id = @idProducto
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH

END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 26/04/2022
-- Description:	Consulta todos los productos de la base de datos
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Producto_select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;


    -- Insert statements for procedure here
	BEGIN TRY
	SELECT *
	FROM Producto
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH

END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 26/04/2022
-- Description:	Actualiza la informacion de un producto de la base de datos
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Producto_update]
	-- Add the parameters for the stored procedure here
	@idProducto int,
	@nombre VARCHAR(50),
	@descripcion VARCHAR(100),
	@idTipoProductoFK int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;


    -- Insert statements for procedure here
	BEGIN TRY
	UPDATE Producto
	SET nombre = @nombre,
	descripcion = @descripcion,
	idTipoProductoFK = @idTipoProductoFK
	WHERE id = @idProducto
	RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH

END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 26/04/2022
-- Description:	Obtiene los horarios de las tiendas, y los ordena por tipo
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Horario_select] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY

	SELECT TC.nombre AS [Nombre del comercio], DS.nombre AS [Dia de la semana] , H.hora1 as [Hora de entrada], H.hora2 as [Hora de salida]
		FROM Horario H
		INNER JOIN Bloque B on B.id = H.idBloqueFK
		INNER JOIN DiaSemana DS on DS.id = H.idDiaSemanaFK
		INNER JOIN TipoComercio TC ON B.idTipoComercioFK = TC.id
		ORDER BY TC.nombre; 
		RETURN 0;
	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 26/04/2022
-- Description:	Inserta un horario para una tienda
-- =============================================
CREATE OR ALTER PROCEDURE Horario_insert
	-- Add the parameters for the stored procedure here
	@hora1 time,
	@hora2 time, 
	@idBloqueFK int,
	@idDiaSemanaFK int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

    -- Insert statements for procedure here
	
	IF (SELECT idTipoBloqueFK FROM Bloque WHERE id = @idBloqueFK) = 2
		BEGIN
			IF (SELECT COUNT(*) FROM Horario WHERE (@hora1 BETWEEN hora1 AND hora2) AND @idBloqueFK = idBloqueFK) = 0
				BEGIN
					BEGIN TRY
					INSERT INTO Horario(hora1,hora2,idBloqueFK,idDiaSemanaFK)
					VALUES (@hora1,@hora2,@idBloqueFK,@idDiaSemanaFK);
					RETURN 0;
					END TRY

					BEGIN CATCH
						SELECT
						ERROR_PROCEDURE() AS Procedimiento,
						ERROR_LINE() AS Linea,
						ERROR_MESSAGE() AS [Mensaje de Error];
						RETURN 1;
					END CATCH

				END
			ELSE
				BEGIN
					SELECT 'Conflicto de horarios. --NO se inserto el horario' as [Mensaje]
					RETURN -2;
				END
		END
	ELSE
		BEGIN
			SELECT 'El tipo de bloque al cual se le quiere insertar el horario no corresponde a un comercio. --NO se inserto el horario' as [Mensaje]
			RETURN -1;
		END
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 27/04/2022
-- Description:	Dado dos bloques, determina si son vecinos o no
-- =============================================
CREATE or ALTER PROCEDURE IdentificarVecinos 
	-- Add the parameters for the stored procedure here
	@idBloque1 int, 
	@idBloque2 int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	DECLARE
	@geoBloque1 geometry,
	@geoBloque2 geometry
	BEGIN TRY 

	SELECT @geoBloque1 = figura
	FROM Bloque
	WHERE Bloque.id = @idBloque1

	SELECT @geoBloque1 = figura
	FROM Bloque
	WHERE Bloque.id = @idBloque2

	IF @geoBloque1.STTouches(@geoBloque2) = 1
	BEGIN
		SELECT 'Son vecinos' as Respuesta
	END

	ELSE
	BEGIN
		SELECT 'No son vecinos' as Respuesta
	END

	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

-- =============================================
-- Author:		Joshua Arcia y Jacob Guzmán
-- Create date: 27/04/2022
-- Description:	Dado dos bloques, determina la distancia entre ellos
-- =============================================
CREATE or ALTER PROCEDURE CalcularDistancia
	-- Add the parameters for the stored procedure here
	@idBloque1 int, 
	@idBloque2 int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	DECLARE
	@geoBloque1 geometry,
	@geoBloque2 geometry
	BEGIN TRY 

	SELECT @geoBloque1 = puntoCentro
	FROM Bloque
	WHERE Bloque.id = @idBloque1

	SELECT @geoBloque2 = puntoCentro
	FROM Bloque
	WHERE Bloque.id = @idBloque2

	SELECT @geoBloque1.STDistance(@geoBloque2) AS [Distancia]
	

	END TRY

	BEGIN CATCH
	SELECT
	ERROR_PROCEDURE() AS Procedimiento,
    ERROR_LINE() AS Linea,
    ERROR_MESSAGE() AS [Mensaje de Error];
	RETURN 1;
	END CATCH
END
GO

---------------PRUEBAS----------------
--Falta update y delete
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Inventario_read]

SELECT	'Return Value' = @return_value

SELECT	'Return Value' = @return_value


GO
