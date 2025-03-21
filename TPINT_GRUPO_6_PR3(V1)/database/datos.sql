USE [master]
GO
/****** Object:  Database [BDGrupo6]    Script Date: 17/03/2025 21:45:08 ******/
CREATE DATABASE [BDGrupo6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDGrupo6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BDGrupo6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDGrupo6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BDGrupo6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BDGrupo6] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDGrupo6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDGrupo6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDGrupo6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDGrupo6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDGrupo6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDGrupo6] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDGrupo6] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BDGrupo6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDGrupo6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDGrupo6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDGrupo6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDGrupo6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDGrupo6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDGrupo6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDGrupo6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDGrupo6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDGrupo6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDGrupo6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDGrupo6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDGrupo6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDGrupo6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDGrupo6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDGrupo6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDGrupo6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDGrupo6] SET  MULTI_USER 
GO
ALTER DATABASE [BDGrupo6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDGrupo6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDGrupo6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDGrupo6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDGrupo6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDGrupo6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDGrupo6] SET QUERY_STORE = ON
GO
ALTER DATABASE [BDGrupo6] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BDGrupo6]
GO
/****** Object:  Table [dbo].[DiasLaborales]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiasLaborales](
	[IdDiaLaborable_DL] [int] IDENTITY(1,1) NOT NULL,
	[LegajoMedico_DL] [char](5) NOT NULL,
	[Seman_DL] [char](9) NOT NULL,
	[Dia_DL] [date] NOT NULL,
	[IdMes_DL] [int] NOT NULL,
	[HoraInicio_DL] [time](0) NOT NULL,
	[HoraFinal_DL] [time](0) NOT NULL,
	[DiaActivo_DL] [bit] NULL,
 CONSTRAINT [PK_DiasLaborales_DL] PRIMARY KEY CLUSTERED 
(
	[IdDiaLaborable_DL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[IdEspecialidad_Esp] [char](2) NOT NULL,
	[descripcion_Esp] [varchar](50) NOT NULL,
 CONSTRAINT [Pk_Especialidades] PRIMARY KEY CLUSTERED 
(
	[IdEspecialidad_Esp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[IdLocalidad_Loc] [char](2) NOT NULL,
	[IdProvincia_Loc] [char](2) NOT NULL,
	[descripcionLocalidad_Loc] [varchar](50) NOT NULL,
 CONSTRAINT [Pk_Localidades] PRIMARY KEY CLUSTERED 
(
	[IdLocalidad_Loc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[Legajo_Me] [char](5) NOT NULL,
	[IdEspecialidad_Me] [char](2) NOT NULL,
	[IdLocalidad_Me] [char](2) NOT NULL,
	[IdProvincia_Me] [char](2) NOT NULL,
	[Dni_Me] [varchar](8) NOT NULL,
	[Nombre_Me] [varchar](50) NOT NULL,
	[Apellido_Me] [varchar](50) NOT NULL,
	[Sexo_Me] [char](1) NOT NULL,
	[Nacionalidad_Me] [varchar](50) NOT NULL,
	[FechaNacimiento_Me] [date] NOT NULL,
	[Direccion_Me] [varchar](100) NOT NULL,
	[CorreoElectronico_Me] [varchar](100) NOT NULL,
	[Telefono_Me] [varchar](20) NOT NULL,
	[Estado_Me] [bit] NULL,
 CONSTRAINT [PK_Legajo_Me] PRIMARY KEY CLUSTERED 
(
	[Legajo_Me] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meses]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meses](
	[IdMes_Mes] [int] NOT NULL,
	[DescripcionMes_Mes] [varchar](9) NOT NULL,
	[cantidadDias_Mes] [int] NOT NULL,
 CONSTRAINT [PK_Meses] PRIMARY KEY CLUSTERED 
(
	[IdMes_Mes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[Nombre_Pa] [varchar](50) NOT NULL,
	[Apellido_Pa] [varchar](50) NOT NULL,
	[DniPaciente_Pa] [varchar](8) NOT NULL,
	[Sexo_Pa] [char](1) NOT NULL,
	[Edad_Pa] [tinyint] NOT NULL,
	[IdLocalidad_Pa] [char](2) NOT NULL,
	[IdProvincia_Pa] [char](2) NOT NULL,
	[Nacionalidad_Pa] [varchar](50) NULL,
	[FechaNacimiento_Pa] [date] NOT NULL,
	[Direccion_Pa] [varchar](100) NULL,
	[CorreoElectronico_Me] [varchar](100) NOT NULL,
	[Telefono_Pa] [varchar](20) NOT NULL,
	[Asistencia_Pa] [bit] NOT NULL,
	[Observacion_Pa] [varchar](300) NULL,
	[Estado_Pa] [bit] NULL,
 CONSTRAINT [Pk_Pacientes_Pa] PRIMARY KEY CLUSTERED 
(
	[DniPaciente_Pa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[IdProvincias_Pr] [char](2) NOT NULL,
	[descripcionProvincia_Pr] [varchar](50) NOT NULL,
 CONSTRAINT [Pk_Provincias] PRIMARY KEY CLUSTERED 
(
	[IdProvincias_Pr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semana]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semana](
	[IdSemana_Sem] [int] NOT NULL,
	[Descripcion_Sem] [varchar](9) NOT NULL,
 CONSTRAINT [PK_Dia] PRIMARY KEY CLUSTERED 
(
	[IdSemana_Sem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[IdTurno_Tr] [int] IDENTITY(1,1) NOT NULL,
	[idDiasLaborales] [int] NULL,
	[LegajoMedico_Tr] [char](5) NULL,
	[IdEspecialidad_Tr] [varchar](30) NULL,
	[nombreMedico] [varchar](50) NULL,
	[DniPaciente_Tr] [varchar](8) NULL,
	[FechaTurno_Tr] [varchar](10) NULL,
	[Horario_Tr] [varchar](5) NULL,
	[Asistencia_Tr] [char](1) NULL,
	[Observacion_Tr] [text] NULL,
	[Estado_Tr] [bit] NULL,
 CONSTRAINT [Pk_IdTurno_Tr] PRIMARY KEY CLUSTERED 
(
	[IdTurno_Tr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[CodUsuario_Usu] [int] IDENTITY(1,1) NOT NULL,
	[Legajo_Usu] [char](5) NULL,
	[Nombre_Usu] [varchar](8) NULL,
	[Contrasenia_Usu] [varchar](8) NULL,
	[Rol_Usu] [char](1) NULL,
 CONSTRAINT [PK_Usuario_Usu] PRIMARY KEY CLUSTERED 
(
	[CodUsuario_Usu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DiasLaborales] ADD  DEFAULT ((1)) FOR [DiaActivo_DL]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT ((1)) FOR [Estado_Me]
GO
ALTER TABLE [dbo].[Pacientes] ADD  DEFAULT ((1)) FOR [Asistencia_Pa]
GO
ALTER TABLE [dbo].[Pacientes] ADD  DEFAULT ((1)) FOR [Estado_Pa]
GO
ALTER TABLE [dbo].[Turnos] ADD  DEFAULT ('A') FOR [Asistencia_Tr]
GO
ALTER TABLE [dbo].[Turnos] ADD  DEFAULT ('SIN OBSERVACION') FOR [Observacion_Tr]
GO
ALTER TABLE [dbo].[Turnos] ADD  DEFAULT ((1)) FOR [Estado_Tr]
GO
ALTER TABLE [dbo].[DiasLaborales]  WITH CHECK ADD  CONSTRAINT [FK_DiasLaboralesMeses] FOREIGN KEY([IdMes_DL])
REFERENCES [dbo].[Meses] ([IdMes_Mes])
GO
ALTER TABLE [dbo].[DiasLaborales] CHECK CONSTRAINT [FK_DiasLaboralesMeses]
GO
ALTER TABLE [dbo].[DiasLaborales]  WITH CHECK ADD  CONSTRAINT [FK_LegajoMedico_DL] FOREIGN KEY([LegajoMedico_DL])
REFERENCES [dbo].[Medicos] ([Legajo_Me])
GO
ALTER TABLE [dbo].[DiasLaborales] CHECK CONSTRAINT [FK_LegajoMedico_DL]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Provincias] FOREIGN KEY([IdProvincia_Loc])
REFERENCES [dbo].[Provincias] ([IdProvincias_Pr])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_Localidades_Provincias]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad] FOREIGN KEY([IdEspecialidad_Me])
REFERENCES [dbo].[Especialidades] ([IdEspecialidad_Esp])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_MedicoEspecialidad]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_MedicoLocalidad] FOREIGN KEY([IdLocalidad_Me])
REFERENCES [dbo].[Localidades] ([IdLocalidad_Loc])
GO
ALTER TABLE [dbo].[Medicos] CHECK CONSTRAINT [FK_MedicoLocalidad]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [Fk_idLocalidades_Pa] FOREIGN KEY([IdLocalidad_Pa])
REFERENCES [dbo].[Localidades] ([IdLocalidad_Loc])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [Fk_idLocalidades_Pa]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [Fk_DNIPaciente_Tr] FOREIGN KEY([DniPaciente_Tr])
REFERENCES [dbo].[Pacientes] ([DniPaciente_Pa])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [Fk_DNIPaciente_Tr]
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD  CONSTRAINT [Fk_LegajoMedico_Tr] FOREIGN KEY([LegajoMedico_Tr])
REFERENCES [dbo].[Medicos] ([Legajo_Me])
GO
ALTER TABLE [dbo].[Turnos] CHECK CONSTRAINT [Fk_LegajoMedico_Tr]
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD CHECK  (([Sexo_Me]='F' OR [Sexo_Me]='M'))
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD CHECK  (([Sexo_Pa]='F' OR [Sexo_Pa]='M'))
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD CHECK  (([Rol_Usu]='M' OR [Rol_Usu]='A'))
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarMedico]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_ActualizarMedico]
    @Legajo_Me CHAR(5),
    @IdEspecialidad_Me CHAR(2) = NULL,
    @IdLocalidad_Me CHAR(2) = NULL,
    @IdProvincia_Me CHAR(2) = NULL,
    @Dni_Me VARCHAR(8) = NULL,
    @Nombre_Me VARCHAR(50) = NULL,
    @Apellido_Me VARCHAR(50) = NULL,
    @Sexo_Me CHAR(1) = NULL,
    @Nacionalidad_Me VARCHAR(50) = NULL,
    @FechaNacimiento_Me DATE = NULL,
    @Direccion_Me VARCHAR(100) = NULL,
    @CorreoElectronico_Me VARCHAR(100) = NULL,
    @Telefono_Me VARCHAR(20) = NULL
    
AS
BEGIN
    UPDATE Medicos
    SET
        IdEspecialidad_Me = ISNULL(@IdEspecialidad_Me, IdEspecialidad_Me),
        IdLocalidad_Me = ISNULL(@IdLocalidad_Me, IdLocalidad_Me),
        IdProvincia_Me = ISNULL(@IdProvincia_Me, IdProvincia_Me),
        Dni_Me = ISNULL(@Dni_Me, Dni_Me),
        Nombre_Me = ISNULL(@Nombre_Me, Nombre_Me),
        Apellido_Me = ISNULL(@Apellido_Me, Apellido_Me),
        Sexo_Me = ISNULL(@Sexo_Me, Sexo_Me),
        Nacionalidad_Me = ISNULL(@Nacionalidad_Me, Nacionalidad_Me),
        FechaNacimiento_Me = ISNULL(@FechaNacimiento_Me, FechaNacimiento_Me),
        Direccion_Me = ISNULL(@Direccion_Me, Direccion_Me),
        CorreoElectronico_Me = ISNULL(@CorreoElectronico_Me, CorreoElectronico_Me),
        Telefono_Me = ISNULL(@Telefono_Me, Telefono_Me)
       
    WHERE Legajo_Me = @Legajo_Me;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarTurno]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[sp_ActualizarTurno]
    @IdTurno INT,
    @Asistencia CHAR(1),
    @Observacion TEXT
AS
BEGIN
 
    UPDATE Turnos
    SET 
        Asistencia_Tr = @Asistencia, 
        Observacion_Tr = @Observacion
    WHERE 
        IdTurno_Tr = @IdTurno;     
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_BajaLogicaMedico]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--BAJA LOGICA MEDICO--

CREATE PROCEDURE [dbo].[sp_BajaLogicaMedico]
(
@LEGAJOMEDICO CHAR(5)
)
AS
BEGIN
UPDATE Medicos
SET Estado_Me =  0
WHERE Legajo_Me = @LEGAJOMEDICO
END
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_bajaLogicaTurno]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--BAJA LOGICA TURNO--

CREATE PROCEDURE [dbo].[sp_bajaLogicaTurno]
(
@IDTURNO INT
)
AS
BEGIN
UPDATE Turnos
SET Estado_Tr =  0
WHERE  IdTurno_Tr = @IDTURNO
END
RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_CargaPaciente]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--ALTA PACIENTE--

CREATE   PROC [dbo].[sp_CargaPaciente]
    @Nombre_Pa VARCHAR(50),
    @Apellido_Pa VARCHAR(50),
    @DniPaciente_Pa VARCHAR(8),
    @Sexo_Pa CHAR(1),
    @Edad_Pa TINYINT,
    @IdLocalidad_Pa CHAR(2),
    @IdProvincia_Pa CHAR(2),
    @Nacionalidad_Pa VARCHAR(50),
    @FechaNacimiento_Pa DATE,
    @Direccion_Pa VARCHAR(100),
    @CorreoElectronico_Me VARCHAR(100),
    @Telefono_Pa VARCHAR(20)    
AS
BEGIN
    INSERT INTO Pacientes (
        Nombre_Pa,
        Apellido_Pa,
        DniPaciente_Pa,
        Sexo_Pa,
        Edad_Pa,
        IdLocalidad_Pa,
        IdProvincia_Pa,
        Nacionalidad_Pa,
        FechaNacimiento_Pa,
        Direccion_Pa,
        CorreoElectronico_Me,
        Telefono_Pa        
    )
    VALUES (
        @Nombre_Pa,
        @Apellido_Pa,
        @DniPaciente_Pa,
        @Sexo_Pa,
        @Edad_Pa,
        @IdLocalidad_Pa,
        @IdProvincia_Pa,
        @Nacionalidad_Pa,
        @FechaNacimiento_Pa,
        @Direccion_Pa,
        @CorreoElectronico_Me,
        @Telefono_Pa
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InformeAsistencias]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------- SP INFORMES  --------------------------------
-------- ASISTENCIAS
CREATE   PROCEDURE [dbo].[sp_InformeAsistencias]
@fechaInicio VARCHAR (10),
@fechaFinal VARCHAR (10)
AS BEGIN
DECLARE @asistencia VARCHAR;
DECLARE @porcentajeAsistencia INT;
DECLARE @inasistencia INT;
DECLARE @porcentajeInasistencia FLOAT;
DECLARE @total INT;

set DATEFORMAT DMY
SET LANGUAGE English

SET @total = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @asistencia = (SELECT COUNT(Turnos.Asistencia_Tr) FROM Turnos
WHERE Turnos.Asistencia_Tr = 'P'
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @inasistencia = (SELECT COUNT(Turnos.Asistencia_Tr) FROM Turnos
WHERE Turnos.Asistencia_Tr = 'A' 
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

IF @total > 0
	BEGIN
		SET @porcentajeAsistencia = (@asistencia * 100) / @total;
		SET @porcentajeInasistencia = (@inasistencia * 100) / @total;
	END
ELSE
	BEGIN
		SET @porcentajeAsistencia = 0;
		SET @porcentajeInasistencia = 0;
	END
END
SELECT @porcentajeAsistencia AS ASISTENCIAS, @porcentajeInasistencia AS INASISTENCIAS
GO
/****** Object:  StoredProcedure [dbo].[sp_InformeEdades]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------- EDADES
CREATE   PROCEDURE [dbo].[sp_InformeEdades]
@fechaInicio VARCHAR (10),
@fechaFinal VARCHAR (10)
AS BEGIN
DECLARE @20 INT;
DECLARE @40 INT;
DECLARE @60 INT;
DECLARE @80 INT;
DECLARE @100 INT;
DECLARE @total INT;
set DATEFORMAT DMY

SET @total = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @20 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa BETWEEN 0 AND 19
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @40 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa BETWEEN 20 AND 39
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @60 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa BETWEEN 40 AND 59
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @80 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa BETWEEN 60 AND 79
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @100 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Edad_Pa >= 80
AND Turnos.FechaTurno_Tr >= @fechaInicio  
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SELECT @20 AS '0-19', @40 AS '20-39', @60 AS '40-59', @80 AS '60-79', @100 AS '80+'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InformeHorarios]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------ HORARIOS 
CREATE   PROCEDURE [dbo].[sp_InformeHorarios]
@fechaInicio VARCHAR (10),
@fechaFinal VARCHAR (10)
AS BEGIN
DECLARE @6 INT;
DECLARE @7 INT;
DECLARE @8 INT;
DECLARE @9 INT;
DECLARE @10 INT;
DECLARE @11 INT;
DECLARE @12 INT;
DECLARE @13 INT;
DECLARE @14 INT;
DECLARE @15 INT;
DECLARE @16 INT;
DECLARE @17 INT;
DECLARE @18 INT;
DECLARE @19 INT;
DECLARE @20 INT;
DECLARE @21 INT = 0;


SET @6 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '06:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '07:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @7 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '07:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '08:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @8 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '08:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '09:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @9 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '09:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '10:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @10 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '10:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '11:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @11 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '11:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '12:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @12 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '12:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '13:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @13 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '13:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '14:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @14 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '14:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '15:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @15 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '15:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '16:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @16 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '16:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '17:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @17 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '17:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '18:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @18 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '18:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '19:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @19 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '19:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '20:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)
SET @20 = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1 AND CONVERT(TIME, Turnos.Horario_Tr) >= CONVERT(TIME, '20:00')
AND CONVERT(TIME, Turnos.Horario_Tr) < CONVERT(TIME, '21:00')
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SELECT @6 AS 'Hora_6', @7 AS 'Hora_7', @8 AS 'Hora_8', @9 AS 'Hora_9', @10 AS 'Hora_10', @11 AS 'Hora_11', 
@12 AS 'Hora_12', @13 AS 'Hora_13', @14 AS 'Hora_14', @15 AS 'Hora_15', @16 AS 'Hora_16', @17 AS 'Hora_17', @18 AS 'Hora_18', 
@19 AS 'Hora_19', @20 AS 'Hora_20', @21 AS 'Hora_21'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InformeSexo]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_InformeSexo]
@fechaInicio VARCHAR (10),
@fechaFinal VARCHAR (10)
AS BEGIN
DECLARE @fem INT;
DECLARE @porcentajeF FLOAT;
DECLARE @masc INT;
DECLARE @porcentajeM FLOAT;
DECLARE @total INT;

set DATEFORMAT DMY
SET @total = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos 
WHERE Turnos.Estado_Tr = 1
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @fem = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Sexo_Pa = 'F'
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

SET @masc = (SELECT COUNT(Turnos.IdTurno_Tr) FROM Turnos INNER JOIN Pacientes
ON Turnos.DniPaciente_Tr = Pacientes.DniPaciente_Pa
WHERE Turnos.Estado_Tr = 1 AND Pacientes.Sexo_Pa = 'M'
AND Turnos.FechaTurno_Tr >= @fechaInicio
AND Turnos.FechaTurno_Tr <= @fechaFinal)

IF @total > 0
	BEGIN
		SET @porcentajeF = (@fem * 100) / @total
		SET @porcentajeM = (@masc * 100) / @total
	END
ELSE
	BEGIN
		SET @porcentajeF = 0
		SET @porcentajeM = 0
	END
END
SELECT @porcentajeF AS FEMENINO, @porcentajeM AS MASCULINO
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarDiasLaborales]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_InsertarDiasLaborales]
    @LegajoMedico CHAR(5),
    @Mes INT,
    @Semana INT, -- Número del día (lunes = 1, martes = 2, etc.)
    @HoraInicio TIME(0),
    @HoraFin TIME(0)
AS
BEGIN
    DECLARE @Fecha DATE;
    DECLARE @FechaInicioMes DATE;
    DECLARE @FechaFinalMes DATE;
    DECLARE @DiaSemanaFecha INT;
    DECLARE @HoraActual TIME(0);
    DECLARE @SiguienteHora TIME(0);
    DECLARE @Anio INT;

    -- Determinar el año según el mes
    IF @Mes BETWEEN 1 AND 10 -- Enero a octubre
        SET @Anio = 2025;
    ELSE -- Noviembre y diciembre
        SET @Anio = 2024;

    -- Obtener el primer y último día del mes
    SET @FechaInicioMes = DATEFROMPARTS(@Anio, @Mes, 1);
    SET @FechaFinalMes = EOMONTH(@FechaInicioMes);

    -- Iterar por cada día del mes
    SET @Fecha = @FechaInicioMes;
    WHILE @Fecha <= @FechaFinalMes
    BEGIN
        -- Obtener el número del día de la semana (lunes = 1)
        SET @DiaSemanaFecha = DATEPART(WEEKDAY, @Fecha);

        -- Insertar datos si el día coincide
        IF @DiaSemanaFecha = @Semana
        BEGIN
            -- Inicializar la hora actual
            SET @HoraActual = @HoraInicio;

            -- Bucle para insertar los intervalos horarios
            WHILE @HoraActual < @HoraFin
            BEGIN
                -- Calcular la siguiente hora
                SET @SiguienteHora = DATEADD(HOUR, 1, @HoraActual);

                -- Insertar un intervalo de tiempo
                INSERT INTO DiasLaborales (LegajoMedico_DL, Seman_DL, Dia_DL, IdMes_DL, HoraInicio_DL, HoraFinal_DL)
                VALUES
                (@LegajoMedico, DATENAME(WEEKDAY, @Fecha), @Fecha, @Mes, @HoraActual, @SiguienteHora);

                -- Avanzar al siguiente intervalo
                SET @HoraActual = @SiguienteHora;
            END;
        END;

        -- Incrementar el día
        SET @Fecha = DATEADD(DAY, 1, @Fecha);
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarMedico]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[sp_InsertarMedico]
    @Legajo char(5),
    @Nombre varchar(50),
    @Apellido varchar(50),
    @Dni varchar(8),
    @Sexo CHAR(1),
    @Telefono varchar(20),
    @CorreoElectronico varchar(100),
    @Direccion varchar(100),
    @Nacionalidad varchar(50),
    @Provincia char(2),
    @Localidad char(2),
    @Especialidad char(2),
    @FechaNacimiento DATE
AS
BEGIN
    INSERT INTO Medicos (
        Legajo_Me, Nombre_Me, Apellido_Me, Dni_Me, Sexo_Me, Telefono_Me, 
        CorreoElectronico_Me, Direccion_Me, Nacionalidad_Me, IdProvincia_Me, 
        IdLocalidad_Me, IdEspecialidad_Me, FechaNacimiento_Me)
    VALUES (
        @Legajo, @Nombre, @Apellido, @Dni, @Sexo, @Telefono, 
        @CorreoElectronico, @Direccion, @Nacionalidad, @Provincia, 
        @Localidad, @Especialidad, @FechaNacimiento);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarNuevoUsuario]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--AlTA NUEVO USUARIO
CREATE   PROCEDURE [dbo].[sp_InsertarNuevoUsuario]
    
    @Legajo CHAR(5),   
    @Nombre VARCHAR(8),
    @Contrasenia VARCHAR(8),  
    @Rol CHAR(1)        
AS
BEGIN
   
    INSERT INTO Usuarios (
 
        Legajo_Usu,
        Nombre_Usu,
        Contrasenia_Usu,
        Rol_Usu
    )
    VALUES (
    
        @Legajo,
        @Nombre,
        @Contrasenia,
        @Rol
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarTurnos]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--alta turnos 
CREATE    PROCEDURE [dbo].[sp_InsertarTurnos]
   @idDiasLaborales INT,
    @LegajoMedico CHAR(5),
    @IdEspecialidad VARCHAR(30),
    @NombreMedico VARCHAR(50),
    @DniPaciente VARCHAR(8),
    @FechaTurno VARCHAR(10),
    @Horario VARCHAR(5)
 AS
BEGIN
       INSERT INTO Turnos (
        idDiasLaborales,
        LegajoMedico_Tr,
        IdEspecialidad_Tr,
        nombreMedico,
        DniPaciente_Tr,
        FechaTurno_Tr,
        Horario_Tr
          
    )
    VALUES (
        @idDiasLaborales,
        @LegajoMedico,
        @IdEspecialidad,
        @NombreMedico,
        @DniPaciente,
        @FechaTurno,
        @Horario

    );
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarEstadoPaciente]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--MODIFICAR Y BAJA LOGICA DE PACIENTE --


CREATE    PROCEDURE [dbo].[sp_ModificarEstadoPaciente]
    @DNI varchar(8)

AS
BEGIN
    UPDATE Pacientes
    SET Estado_Pa = 0
       
    WHERE DniPaciente_Pa = @DNI
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarMedico]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Modificar Medico
CREATE   PROCEDURE [dbo].[sp_ModificarMedico]
		@Legajo_Me char(5),
		@IdEspecialidad_Me char(2),
		@IdLocalidad_Me char(2),
		@IdProvincia_Me char(2),
		@Dni_Me varchar(8),
		@Nombre_Me varchar(50),
		@Apellido_Me varchar(50),
		@Sexo_Me CHAR(1), 
		@Nacionalidad_Me varchar(50),
		@FechaNacimiento_Me DATE,
		@Direccion_Me varchar(100),
		@CorreoElectronico_Me varchar(100),
		@Telefono_Me varchar(20)
AS
BEGIN
	UPDATE Medicos
	SET
		Legajo_Me=@Legajo_Me,
		IdEspecialidad_Me=@IdEspecialidad_Me,
		IdLocalidad_Me=@IdLocalidad_Me,
		IdProvincia_Me=@IdProvincia_Me,
		Dni_Me=@Dni_Me,
		Nombre_Me=@Nombre_Me,
		Apellido_Me=@Apellido_Me,
		Sexo_Me=@Sexo_Me, 
		Nacionalidad_Me=@Nacionalidad_Me,
		FechaNacimiento_Me=@FechaNacimiento_Me,
		Direccion_Me=@Direccion_Me,
		CorreoElectronico_Me=@CorreoElectronico_Me,
		Telefono_Me=@Telefono_Me
	WHERE Dni_Me = @Dni_Me;
	RETURN
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarPaciente]    Script Date: 17/03/2025 21:45:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- MODIFICAR PACIENTE

CREATE  PROCEDURE [dbo].[sp_ModificarPaciente]

     @DniPaciente_Pa VARCHAR(8),
     @Apellido_Pa VARCHAR(50),
     @Nombre_Pa VARCHAR(50),
     @Sexo_Pa CHAR(1),
	 @Edad_Pa TINYINT,
     @Telefono_Pa VARCHAR(20),    
     @Direccion_Pa VARCHAR(100),
    @Nacionalidad_Pa VARCHAR(50),
	 @IdProvincia_Pa CHAR(2),
    @IdLocalidad_Pa CHAR(2),
	@CorreoElectronico_Me VARCHAR(100)
	AS
	BEGIN
	    UPDATE Pacientes  set
		 Nombre_Pa= @Nombre_Pa,
		Apellido_Pa=  @Apellido_Pa,
        Sexo_Pa=     @Sexo_Pa,
		 Edad_Pa= @Edad_Pa,
		 IdLocalidad_Pa=  @IdLocalidad_Pa,
        IdProvincia_Pa=   @IdProvincia_Pa,
		 Nacionalidad_Pa=   @Nacionalidad_Pa, 
		Direccion_Pa=     @Direccion_Pa,
        CorreoElectronico_Me=@CorreoElectronico_Me,
		Telefono_Pa =  @Telefono_Pa      
		where  DniPaciente_Pa=   @DniPaciente_Pa;
            return
			END;
GO
USE [master]
GO
ALTER DATABASE [BDGrupo6] SET  READ_WRITE 
GO
