------------------CREACIÓN------------------------
-- =============================================
-- Author:		Joshua Arcia
-- Create date: 18/04/2022
-- Description:	Selecciona la información de un inventario
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Inventario_select] 
AS
BEGIN

	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRY
	SELECT TC.nombre AS [Nombre del establecimiento], I.nombre AS [Nombre del producto],I.descripcion,I.precio,I.cantidad,TP.nombre AS Categoria
	FROM Inventario I
	INNER JOIN TipoProducto TP on TP.id = I.idTipoProductoFK
	INNER JOIN Bloque B on B.idInventarioFK = I.id
	INNER JOIN TipoComercio TC on TC.id = B.idTipoComercioFK
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
-- Author:		Joshua Arcia
-- Create date: 18/04/2022
-- Description:	Inserción de productos en los inventarios
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[Inventario_insert] 
	-- Add the parameters for the stored procedure here
	@nombre VARCHAR(50),
	@descripcion VARCHAR(100),
	@precio int,
	@cantidad int,
	@tipoFK int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	
	INSERT INTO [dbo].[Inventario]
           ([nombre]
           ,[descripcion]
           ,[precio]
           ,[cantidad]
           ,[idTipoProductoFK])
     VALUES
           (@nombre
           ,@descripcion
           ,@precio
           ,@cantidad
           ,@tipoFK)
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
-- Author:		Joshua Arcia
-- Create date: 18/04/2022
-- Description:	Actualizacion de la informacion de los productos en un inventario; 
-- Debería actualizar un campo, solamente si le envían un dato nuevo para dicho campo
-- =============================================
CREATE PROCEDURE [dbo].[Inventario_update] 
	-- Add the parameters for the stored procedure here
	@InventarioID int = 0,
	@nombre VARCHAR(50),
	@descripcion VARCHAR(100),
	@cantidad int,
	@precio int,
	@idTipoProductoFK int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	UPDATE [dbo].[Inventario]
	SET [nombre] = @nombre
      ,[descripcion] = @descripcion
      ,[precio] = @precio
      ,[cantidad] = @cantidad
      ,[idTipoProductoFK] = @idTipoProductoFK
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
-- Author:		Joshua Arcia
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

---------------PRUEBAS----------------
--Falta update y delete
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Inventario_select]

SELECT	'Return Value' = @return_value


EXEC	@return_value = [dbo].[Inventario_insert]
		@nombre = N'Prueba',
		@descripcion = N'Hola',
		@precio = 123,
		@cantidad = 1,
		@tipoFK = 2

SELECT	'Return Value' = @return_value


GO