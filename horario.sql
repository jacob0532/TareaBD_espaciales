USE [Espaciales]
GO
/****** Object:  StoredProcedure [dbo].[Consultar_horario]    Script Date: 27/4/2022 22:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--CONVERT(Time(0),SYSDATETIME())  


ALTER PROCEDURE [dbo].[Consultar_horario] 
	-- Add the parameters for the stored procedure here
	@idBloque INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
    -- Insert statements for procedure here
	BEGIN TRY
	DECLARE @hora1 TIME(0)
	DECLARE @hora2 TIME(0)
	DECLARE @diaSemana INT
	DECLARE @ContFinal INT = (SELECT COUNT(*) FROM dbo.Horario WHERE idBloqueFK = @idBloque);
	DECLARE @Cont INT = 1;
	WHILE(@Cont <= @ContFinal) BEGIN
		SELECT  @hora1 = hora1,@hora2=hora2,@diaSemana=idDiaSemanaFK
		FROM    (
				SELECT  hora1,hora2,idDiaSemanaFK, ROW_NUMBER() OVER (ORDER BY id) AS rn
				FROM    dbo.Horario WHERE idBloqueFK = @idBloque
				) h
		WHERE   rn = @cont;
		IF((CONVERT(Time(0),SYSDATETIME()) BETWEEN @hora1 AND @hora2))
			BEGIN
			IF (@diaSemana = (SELECT DATEPART(dw, SYSDATETIME())))
				RETURN 0;
			END 
		set @Cont += 1;
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
					



