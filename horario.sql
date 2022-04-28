
DECLARE @idBloque INT
DECLARE @horaActual TIME(0)
DECLARE @hora1 TIME(0)
DECLARE @hora2 TIME(0)
SET @horaActual = CONVERT(Time(0),SYSDATETIME())  
DECLARE @ContFinal INT = (SELECT COUNT(*) FROM dbo.Horario WHERE idBloqueFK = 1);
DECLARE @Cont INT = 1;
WHILE(@Cont <= @ContFinal) BEGIN
    set @Cont += 1;
END

SET @hora1 =  SELECT hora1  FROM dbo.Horario WHERE idBloqueFK = @idBloque  
SET @hora2 =  SELECT hora2  FROM dbo.Horario WHERE idBloqueFK = @idBloque
IF((@horaActual BETWEEN @hora1 AND @hora2))
	BEGIN
		SELECT ROW_NUMBER() OVER(ORDER BY id) FROM dbo.Horario WHERE idBloqueFK = @idBloque and 
		IF EXISTS(SELECT idDiaSemanaFK FROM dbo.Horario WHERE idDiaSemanaFK = (SELECT DATEPART(dw, SYSDATETIME())) and )
		BEGIN 

		END IF
		ELSE
			print 'NO'
		print 'si'
	END IF
ELSE
	print 'no'

