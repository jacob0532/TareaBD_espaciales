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
-- Author:		Joshua Arcia y Jacob Guzmán y Jacob Guzmán
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

---------------PRUEBAS----------------
--Falta update y delete
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Inventario_read]

SELECT	'Return Value' = @return_value

SELECT	'Return Value' = @return_value


GO