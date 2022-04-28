CREATE OR ALTER PROCEDURE [dbo].[Es_casa] 
	-- Add the parameters for the stored procedure here
	@numCasa INT --Recibe el numero de casa como parametro o sea el id bloque
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	DECLARE @tipoBloque INT;
	IF EXISTS((SELECT idTipoBloqueFK FROM dbo.Bloque WHERE id=@numCasa))
		BEGIN 
		SET @tipoBloque = (SELECT idTipoBloqueFK FROM dbo.Bloque WHERE id=@numCasa);
		IF(@tipoBloque=1)
			RETURN 0;
		ELSE
			RETURN 1;
		END
	RETURN 1;
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


	
