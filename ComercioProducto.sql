CREATE PROCEDURE [dbo].[Comercio_Producto] 
	-- Add the parameters for the stored procedure here
	@idBloqueCasa INT = 20
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	
	CREATE TABLE #TempComercioTable (
    id int PRIMARY KEY IDENTITY(1,1),
    nombreComercio varchar(50),
    Abierto bit,
    inventario INT,
	nombreProducto varchar(50),
	precioProducto int,
	distancia float
)
	
	
    DECLARE @nombreComercio varchar(50)
    DECLARE @abierto bit
    DECLARE @inventario INT
	DECLARE @nombreProducto varchar(50)
	DECLARE @precioProducto int
	DECLARE @distancia float

	
	DECLARE @ContFinal INT = (SELECT COUNT(*) FROM dbo.Bloque);
	DECLARE @Cont INT = 1;
	DECLARE @returnValue INT;
	DECLARE @idBloque INT = 0;
	EXECUTE @returnValue = Es_casa @idBloqueCasa
	IF((SELECT @returnValue) = 1) --si el id ingresado no pertenece a una casa
		SELECT 'Error no es una casa'
		RETURN -1

	WHILE(@Cont <= @ContFinal) BEGIN
		EXECUTE @returnValue = Es_comercio @Cont
		IF((SELECT @returnValue) = 0)
			BEGIN
				EXECUTE @abierto = Consultar_horario @Cont
				SET @nombreComercio = (SELECT letraBloque FROM dbo.Bloque WHERE id=@Cont)
			END 
			INSERT INTO #TempComercioTable 
			VALUES(@nombreComercio,@abierto,null,null,null,null)
		set @Cont += 1;
	END
	SELECT * FROM #TempComercioTable
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




