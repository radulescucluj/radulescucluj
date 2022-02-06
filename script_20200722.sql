USE [master]
GO
/****** Object:  Database [Screening]    Script Date: 7/22/2020 4:01:31 PM ******/
CREATE DATABASE [Screening]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pacienti-oncologie', FILENAME = N'C:\pacienti-oncologie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pacienti-oncologie_log', FILENAME = N'C:\pacienti-oncologie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 
GO
ALTER DATABASE [Screening] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Screening].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Screening] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Screening] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Screening] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Screening] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Screening] SET ARITHABORT OFF 
GO
ALTER DATABASE [Screening] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Screening] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Screening] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Screening] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Screening] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Screening] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Screening] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Screening] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Screening] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Screening] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Screening] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Screening] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Screening] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Screening] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Screening] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Screening] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Screening] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Screening] SET RECOVERY FULL 
GO
ALTER DATABASE [Screening] SET  MULTI_USER 
GO
ALTER DATABASE [Screening] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Screening] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Screening] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Screening] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Screening] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Screening] SET QUERY_STORE = OFF
GO
USE [Screening]
GO
/****** Object:  Table [dbo].[buletine_laborator]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buletine_laborator](
	[buletin_id] [bigint] IDENTITY(1,1) NOT NULL,
	[recoltare_id] [bigint] NOT NULL,
	[pacient_id] [bigint] NOT NULL,
	[nr_flacon] [int] NOT NULL,
	[data_primirii] [date] NOT NULL,
	[tehnician_laborator] [nvarchar](50) NOT NULL,
	[thin_prep] [bit] NOT NULL,
	[care_hpv] [bit] NOT NULL,
 CONSTRAINT [PK_buletine_laborator] PRIMARY KEY CLUSTERED 
(
	[buletin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categorii_populatie]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorii_populatie](
	[cod] [char](1) NOT NULL,
	[descriere] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_categorii_populatie] PRIMARY KEY CLUSTERED 
(
	[cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[centre_medicale]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[centre_medicale](
	[centru_id] [bigint] IDENTITY(1,1) NOT NULL,
	[denumire] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_centre_medicale] PRIMARY KEY CLUSTERED 
(
	[centru_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[etnii]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[etnii](
	[etnie_id] [tinyint] NOT NULL,
	[descriere] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_etnii] PRIMARY KEY CLUSTERED 
(
	[etnie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[examene_control]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examene_control](
	[examen_id] [bigint] IDENTITY(1,1) NOT NULL,
	[pacient_id] [bigint] NOT NULL,
	[data_examen] [date] NOT NULL,
	[rezultat] [bit] NULL,
	[medic_id] [bigint] NULL,
 CONSTRAINT [PK_examene_control] PRIMARY KEY CLUSTERED 
(
	[examen_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[judete]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[judete](
	[cod] [nvarchar](2) NOT NULL,
	[denumire] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_judete] PRIMARY KEY CLUSTERED 
(
	[cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medici]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medici](
	[medic_id] [bigint] IDENTITY(1,1) NOT NULL,
	[centru_id] [bigint] NOT NULL,
	[nume] [nvarchar](50) NOT NULL,
	[cod_specializare] [nchar](3) NULL,
 CONSTRAINT [PK_medici] PRIMARY KEY CLUSTERED 
(
	[medic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mobilizari]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mobilizari](
	[mobilizare_id] [bigint] IDENTITY(1,1) NOT NULL,
	[pacient_id] [bigint] NOT NULL,
	[centru_id] [bigint] NOT NULL,
	[medic_id] [bigint] NOT NULL,
	[data_mobilizarii] [date] NULL,
 CONSTRAINT [PK_mobilizari] PRIMARY KEY CLUSTERED 
(
	[mobilizare_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nivele_educationale]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nivele_educationale](
	[nivel_id] [tinyint] NOT NULL,
	[descriere] [nvarchar](50) NOT NULL,
	[varsta] [tinyint] NOT NULL,
 CONSTRAINT [PK_nivele_educationale] PRIMARY KEY CLUSTERED 
(
	[nivel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pacienti]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pacienti](
	[pacient_id] [bigint] IDENTITY(1,1) NOT NULL,
	[nume] [nvarchar](30) NOT NULL,
	[prenume] [nvarchar](30) NOT NULL,
	[sex] [char](1) NOT NULL,
	[cnp] [char](13) NOT NULL,
	[cod_judet] [nvarchar](2) NOT NULL,
	[tip_mediu] [char](1) NOT NULL,
	[localitate] [nvarchar](30) NULL,
	[cod_categorie] [char](1) NULL,
	[etnie_id] [tinyint] NULL,
	[nivel_id] [tinyint] NULL,
	[cu_dizabilitati] [bit] NULL,
 CONSTRAINT [PK_pacienti] PRIMARY KEY CLUSTERED 
(
	[pacient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proceduri]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proceduri](
	[cod] [nvarchar](8) NOT NULL,
	[denumire] [nvarchar](100) NOT NULL,
	[descriere] [nvarchar](1000) NULL,
 CONSTRAINT [PK_proceduri] PRIMARY KEY CLUSTERED 
(
	[cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recoltari]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recoltari](
	[recoltare_id] [bigint] IDENTITY(1,1) NOT NULL,
	[mobilizare_id] [bigint] NULL,
	[pacient_id] [bigint] NOT NULL,
	[centru_id] [bigint] NOT NULL,
	[medic_id] [bigint] NOT NULL,
	[data_recoltarii] [date] NOT NULL,
 CONSTRAINT [PK_recoltari] PRIMARY KEY CLUSTERED 
(
	[recoltare_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rezultate]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rezultate](
	[rezultat_id] [bigint] NOT NULL,
	[buletin_id] [bigint] NOT NULL,
	[pacient_id] [bigint] NOT NULL,
	[ratio_hpv] [decimal](5, 2) NOT NULL,
	[medic_id] [bigint] NOT NULL,
	[pozitiv] [bit] NOT NULL,
	[retestare_5ani] [bit] NOT NULL,
	[retestare_1an] [bit] NOT NULL,
	[evaluare_tratament] [bit] NOT NULL,
	[babes_papanicolau] [bit] NOT NULL,
 CONSTRAINT [PK_rezultate] PRIMARY KEY CLUSTERED 
(
	[rezultat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specializari_medicale]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specializari_medicale](
	[cod] [nchar](3) NOT NULL,
	[denumire] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_specializari_medicale] PRIMARY KEY CLUSTERED 
(
	[cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tratamente]    Script Date: 7/22/2020 4:01:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tratamente](
	[tratament_id] [bigint] IDENTITY(1,1) NOT NULL,
	[pacient_id] [bigint] NOT NULL,
	[cod_procedura] [nvarchar](8) NOT NULL,
	[data_tratament] [date] NOT NULL,
	[medic_id] [bigint] NOT NULL,
 CONSTRAINT [PK_tratamente] PRIMARY KEY CLUSTERED 
(
	[tratament_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[categorii_populatie] ([cod], [descriere]) VALUES (N'I', N'Inactiv(a)')
GO
INSERT [dbo].[categorii_populatie] ([cod], [descriere]) VALUES (N'O', N'Ocupat(a)')
GO
INSERT [dbo].[categorii_populatie] ([cod], [descriere]) VALUES (N'S', N'Somer(a)')
GO
SET IDENTITY_INSERT [dbo].[centre_medicale] ON 
GO
INSERT [dbo].[centre_medicale] ([centru_id], [denumire]) VALUES (1, N'CMI DR. ORBAN ECATERINA')
GO
SET IDENTITY_INSERT [dbo].[centre_medicale] OFF
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (1, N'maghiari')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (2, N'romi')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (3, N'ucraineni')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (4, N'germani')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (5, N'rusi-lipoveni')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (6, N'turci')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (7, N'tatari')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (8, N'sarbi')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (9, N'slovaci')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (10, N'bulgari')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (11, N'croati')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (12, N'greci')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (13, N'evrei')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (14, N'cehi')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (15, N'polonezi')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (16, N'italieni')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (17, N'chinezi')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (18, N'armeni')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (19, N'ceangai')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (20, N'macedoneni')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (21, N'spanioli')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (22, N'vietnamezi')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (23, N'indieni')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (24, N'pakistanezi')
GO
INSERT [dbo].[etnii] ([etnie_id], [descriere]) VALUES (25, N'afro-romani')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'AB', N'Alba')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'AG', N'Arges')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'AR', N'Arad')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'BC', N'Bacau')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'BH', N'Bihor')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'BN', N'Bistrita-Nasud')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'BR', N'Braila')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'BT', N'Botosani')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'BZ', N'Buzau')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'CJ', N'Cluj')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'CL', N'Calarasi')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'CS', N'Caras Severin')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'CT', N'Constanta')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'CV', N'Covasna')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'DB', N'Dambovita')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'DJ', N'Dolj')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'GJ', N'Gorj')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'GL', N'Galati')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'GR', N'Giurgiu')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'HD', N'Hunedoara')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'HR', N'Harghita')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'IF', N'Ilfov')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'IL', N'Ialomita')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'IS', N'Iasi')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'MH', N'Mehedinti')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'MM', N'Maramures')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'MS', N'Mures')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'NT', N'Neamt')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'OT', N'Olt')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'PH', N'Prahova')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'SB', N'Sibiu')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'SJ', N'Salaj')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'SM', N'Satu Mare')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'SV', N'Suceava')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'TL', N'Tulcea')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'TM', N'Timis')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'TR', N'Teleorman')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'VL', N'Valcea')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'VN', N'Vrancea')
GO
INSERT [dbo].[judete] ([cod], [denumire]) VALUES (N'VS', N'Vaslui')
GO
INSERT [dbo].[nivele_educationale] ([nivel_id], [descriere], [varsta]) VALUES (0, N'Invatamant prescolar', 5)
GO
INSERT [dbo].[nivele_educationale] ([nivel_id], [descriere], [varsta]) VALUES (1, N'Invatamant primar', 10)
GO
INSERT [dbo].[nivele_educationale] ([nivel_id], [descriere], [varsta]) VALUES (2, N'Invatamant gimnazial', 14)
GO
INSERT [dbo].[nivele_educationale] ([nivel_id], [descriere], [varsta]) VALUES (3, N'Invatamant liceal', 18)
GO
INSERT [dbo].[nivele_educationale] ([nivel_id], [descriere], [varsta]) VALUES (4, N'Jnvatamant postliceal', 21)
GO
INSERT [dbo].[nivele_educationale] ([nivel_id], [descriere], [varsta]) VALUES (5, N'Invatamant superior de scurta durata - 2 ani', 20)
GO
INSERT [dbo].[nivele_educationale] ([nivel_id], [descriere], [varsta]) VALUES (6, N'Studii universitare de licenta', 21)
GO
INSERT [dbo].[nivele_educationale] ([nivel_id], [descriere], [varsta]) VALUES (7, N'Studii universitare de Master', 23)
GO
INSERT [dbo].[nivele_educationale] ([nivel_id], [descriere], [varsta]) VALUES (8, N'Studii universitare de Doctorat', 26)
GO
INSERT [dbo].[proceduri] ([cod], [denumire], [descriere]) VALUES (N'35608-00', N'Cauterizare de col uterin', N'Diatermia de col uterin')
GO
INSERT [dbo].[proceduri] ([cod], [denumire], [descriere]) VALUES (N'35608-02', N'Biopsia de col uterin', N'Curetajul endocervical
 Biopsia punch a colului uterin')
GO
INSERT [dbo].[proceduri] ([cod], [denumire], [descriere]) VALUES (N'35614-00', N'Colposcopia', NULL)
GO
INSERT [dbo].[proceduri] ([cod], [denumire], [descriere]) VALUES (N'35618-00', N'Conizatia de col uterin', N'Exclude:
• cea prin laser (35618-01 [1276])')
GO
INSERT [dbo].[proceduri] ([cod], [denumire], [descriere]) VALUES (N'35640-00', N'Dilatarea si curetajul uterin [D&C]', N'Curetajul diagnostic
Exclude:
• curetajul aspirativ (35643-01 [1267])
• cea urmand:
- avortului (35643-00 [1267])
- nasterii (16564-00 [1345])
• cea pentru intreruperea sarcinii (35643-00 [1267])')
GO
INSERT [dbo].[proceduri] ([cod], [denumire], [descriere]) VALUES (N'35646-00', N'Diatermocoagularea colului uterin', N'Include:
• biopsia')
GO
INSERT [dbo].[proceduri] ([cod], [denumire], [descriere]) VALUES (N'35653-01', N'Histerectomia abdominala totala', N'Exclude:
• cea cu:
- disectie retroperitoneala extensiva (35661-00 [1268])
- excizie radicala de ganglioni limfatici pelvini (35670-00 [1268])
- anexectomie bilaterala (35653-03 [1268])
- anexectomie unilaterala (35653-02 [1268])')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'ANA', N'Anatomist')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'CAR', N'Cardiolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'CHI', N'Chihrurg')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'DER', N'Dermatolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'END', N'Endocrinolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'EPI', N'Epidemiolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'GAS', N'Gastroenterolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'GER', N'Gerontolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'GIN', N'Ginecolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'HIS', N'Histolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'HOM', N'Homeopat')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'IMU', N'Imunolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'NEU', N'Neurolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'NUT', N'Nutritionist')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'OBS', N'Obstetricieni')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'OFT', N'Oftalmolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'ONC', N'Oncolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'OTO', N'Otorinolaringolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'PAT', N'Patolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'PED', N'Pediatru')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'PSI', N'Psihiatru')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'RAD', N'Radiolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'STO', N'Stomatolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'URO', N'Urolog')
GO
INSERT [dbo].[specializari_medicale] ([cod], [denumire]) VALUES (N'VET', N'Veterinar')
GO
ALTER TABLE [dbo].[buletine_laborator] ADD  CONSTRAINT [DF_buletine_laborator_data_primirii]  DEFAULT (CONVERT([date],getdate())) FOR [data_primirii]
GO
ALTER TABLE [dbo].[examene_control] ADD  CONSTRAINT [DF_examene_control_data_examen]  DEFAULT (CONVERT([date],getdate())) FOR [data_examen]
GO
ALTER TABLE [dbo].[mobilizari] ADD  CONSTRAINT [DF_mobilizari_data_mobilizarii]  DEFAULT (CONVERT([date],getdate())) FOR [data_mobilizarii]
GO
ALTER TABLE [dbo].[pacienti] ADD  CONSTRAINT [DF_pacienti_sex]  DEFAULT ('F') FOR [sex]
GO
ALTER TABLE [dbo].[pacienti] ADD  CONSTRAINT [DF_pacienti_cu_dizabilitati]  DEFAULT ((0)) FOR [cu_dizabilitati]
GO
ALTER TABLE [dbo].[recoltari] ADD  CONSTRAINT [DF_recoltari_data_recoltarii]  DEFAULT (CONVERT([date],getdate())) FOR [data_recoltarii]
GO
ALTER TABLE [dbo].[tratamente] ADD  CONSTRAINT [DF_tratamente_data_tratament]  DEFAULT (CONVERT([date],getdate())) FOR [data_tratament]
GO
ALTER TABLE [dbo].[buletine_laborator]  WITH CHECK ADD  CONSTRAINT [FK_buletine_laborator_pacienti] FOREIGN KEY([pacient_id])
REFERENCES [dbo].[pacienti] ([pacient_id])
GO
ALTER TABLE [dbo].[buletine_laborator] CHECK CONSTRAINT [FK_buletine_laborator_pacienti]
GO
ALTER TABLE [dbo].[buletine_laborator]  WITH CHECK ADD  CONSTRAINT [FK_buletine_laborator_recoltari] FOREIGN KEY([recoltare_id])
REFERENCES [dbo].[recoltari] ([recoltare_id])
GO
ALTER TABLE [dbo].[buletine_laborator] CHECK CONSTRAINT [FK_buletine_laborator_recoltari]
GO
ALTER TABLE [dbo].[centre_medicale]  WITH CHECK ADD  CONSTRAINT [FK_centre_medicale_centre_medicale] FOREIGN KEY([centru_id])
REFERENCES [dbo].[centre_medicale] ([centru_id])
GO
ALTER TABLE [dbo].[centre_medicale] CHECK CONSTRAINT [FK_centre_medicale_centre_medicale]
GO
ALTER TABLE [dbo].[centre_medicale]  WITH CHECK ADD  CONSTRAINT [FK_centre_medicale_centre_medicale1] FOREIGN KEY([centru_id])
REFERENCES [dbo].[centre_medicale] ([centru_id])
GO
ALTER TABLE [dbo].[centre_medicale] CHECK CONSTRAINT [FK_centre_medicale_centre_medicale1]
GO
ALTER TABLE [dbo].[medici]  WITH CHECK ADD  CONSTRAINT [FK_medici_centre_medicale] FOREIGN KEY([centru_id])
REFERENCES [dbo].[centre_medicale] ([centru_id])
GO
ALTER TABLE [dbo].[medici] CHECK CONSTRAINT [FK_medici_centre_medicale]
GO
ALTER TABLE [dbo].[medici]  WITH CHECK ADD  CONSTRAINT [FK_medici_specializari_medicale] FOREIGN KEY([cod_specializare])
REFERENCES [dbo].[specializari_medicale] ([cod])
GO
ALTER TABLE [dbo].[medici] CHECK CONSTRAINT [FK_medici_specializari_medicale]
GO
ALTER TABLE [dbo].[mobilizari]  WITH CHECK ADD  CONSTRAINT [FK_mobilizari_centre_medicale] FOREIGN KEY([centru_id])
REFERENCES [dbo].[centre_medicale] ([centru_id])
GO
ALTER TABLE [dbo].[mobilizari] CHECK CONSTRAINT [FK_mobilizari_centre_medicale]
GO
ALTER TABLE [dbo].[mobilizari]  WITH CHECK ADD  CONSTRAINT [FK_mobilizari_medici] FOREIGN KEY([medic_id])
REFERENCES [dbo].[medici] ([medic_id])
GO
ALTER TABLE [dbo].[mobilizari] CHECK CONSTRAINT [FK_mobilizari_medici]
GO
ALTER TABLE [dbo].[mobilizari]  WITH CHECK ADD  CONSTRAINT [FK_mobilizari_pacienti] FOREIGN KEY([pacient_id])
REFERENCES [dbo].[pacienti] ([pacient_id])
GO
ALTER TABLE [dbo].[mobilizari] CHECK CONSTRAINT [FK_mobilizari_pacienti]
GO
ALTER TABLE [dbo].[pacienti]  WITH CHECK ADD  CONSTRAINT [FK_pacienti_categorii_populatie] FOREIGN KEY([cod_categorie])
REFERENCES [dbo].[categorii_populatie] ([cod])
GO
ALTER TABLE [dbo].[pacienti] CHECK CONSTRAINT [FK_pacienti_categorii_populatie]
GO
ALTER TABLE [dbo].[pacienti]  WITH CHECK ADD  CONSTRAINT [FK_pacienti_etnii] FOREIGN KEY([etnie_id])
REFERENCES [dbo].[etnii] ([etnie_id])
GO
ALTER TABLE [dbo].[pacienti] CHECK CONSTRAINT [FK_pacienti_etnii]
GO
ALTER TABLE [dbo].[pacienti]  WITH CHECK ADD  CONSTRAINT [FK_pacienti_judete] FOREIGN KEY([cod_judet])
REFERENCES [dbo].[judete] ([cod])
GO
ALTER TABLE [dbo].[pacienti] CHECK CONSTRAINT [FK_pacienti_judete]
GO
ALTER TABLE [dbo].[pacienti]  WITH CHECK ADD  CONSTRAINT [FK_pacienti_nivele_educationale] FOREIGN KEY([nivel_id])
REFERENCES [dbo].[nivele_educationale] ([nivel_id])
GO
ALTER TABLE [dbo].[pacienti] CHECK CONSTRAINT [FK_pacienti_nivele_educationale]
GO
ALTER TABLE [dbo].[recoltari]  WITH CHECK ADD  CONSTRAINT [FK_recoltari_centre_medicale] FOREIGN KEY([centru_id])
REFERENCES [dbo].[centre_medicale] ([centru_id])
GO
ALTER TABLE [dbo].[recoltari] CHECK CONSTRAINT [FK_recoltari_centre_medicale]
GO
ALTER TABLE [dbo].[recoltari]  WITH CHECK ADD  CONSTRAINT [FK_recoltari_medici] FOREIGN KEY([medic_id])
REFERENCES [dbo].[medici] ([medic_id])
GO
ALTER TABLE [dbo].[recoltari] CHECK CONSTRAINT [FK_recoltari_medici]
GO
ALTER TABLE [dbo].[recoltari]  WITH CHECK ADD  CONSTRAINT [FK_recoltari_mobilizari] FOREIGN KEY([mobilizare_id])
REFERENCES [dbo].[mobilizari] ([mobilizare_id])
GO
ALTER TABLE [dbo].[recoltari] CHECK CONSTRAINT [FK_recoltari_mobilizari]
GO
ALTER TABLE [dbo].[recoltari]  WITH CHECK ADD  CONSTRAINT [FK_recoltari_pacienti] FOREIGN KEY([pacient_id])
REFERENCES [dbo].[pacienti] ([pacient_id])
GO
ALTER TABLE [dbo].[recoltari] CHECK CONSTRAINT [FK_recoltari_pacienti]
GO
ALTER TABLE [dbo].[rezultate]  WITH CHECK ADD  CONSTRAINT [FK_rezultate_buletine_laborator] FOREIGN KEY([buletin_id])
REFERENCES [dbo].[buletine_laborator] ([buletin_id])
GO
ALTER TABLE [dbo].[rezultate] CHECK CONSTRAINT [FK_rezultate_buletine_laborator]
GO
ALTER TABLE [dbo].[rezultate]  WITH CHECK ADD  CONSTRAINT [FK_rezultate_medici] FOREIGN KEY([medic_id])
REFERENCES [dbo].[medici] ([medic_id])
GO
ALTER TABLE [dbo].[rezultate] CHECK CONSTRAINT [FK_rezultate_medici]
GO
ALTER TABLE [dbo].[rezultate]  WITH CHECK ADD  CONSTRAINT [FK_rezultate_pacienti] FOREIGN KEY([pacient_id])
REFERENCES [dbo].[pacienti] ([pacient_id])
GO
ALTER TABLE [dbo].[rezultate] CHECK CONSTRAINT [FK_rezultate_pacienti]
GO
ALTER TABLE [dbo].[tratamente]  WITH CHECK ADD  CONSTRAINT [FK_tratamente_medici] FOREIGN KEY([medic_id])
REFERENCES [dbo].[medici] ([medic_id])
GO
ALTER TABLE [dbo].[tratamente] CHECK CONSTRAINT [FK_tratamente_medici]
GO
ALTER TABLE [dbo].[tratamente]  WITH CHECK ADD  CONSTRAINT [FK_tratamente_pacienti] FOREIGN KEY([pacient_id])
REFERENCES [dbo].[pacienti] ([pacient_id])
GO
ALTER TABLE [dbo].[tratamente] CHECK CONSTRAINT [FK_tratamente_pacienti]
GO
ALTER TABLE [dbo].[tratamente]  WITH CHECK ADD  CONSTRAINT [FK_tratamente_proceduri] FOREIGN KEY([cod_procedura])
REFERENCES [dbo].[proceduri] ([cod])
GO
ALTER TABLE [dbo].[tratamente] CHECK CONSTRAINT [FK_tratamente_proceduri]
GO
ALTER TABLE [dbo].[buletine_laborator]  WITH CHECK ADD  CONSTRAINT [CK_buletine_laborator_1] CHECK  (([nr_flacon]>(0)))
GO
ALTER TABLE [dbo].[buletine_laborator] CHECK CONSTRAINT [CK_buletine_laborator_1]
GO
ALTER TABLE [dbo].[buletine_laborator]  WITH CHECK ADD  CONSTRAINT [CK_buletine_laborator_2] CHECK  (([data_primirii]<=CONVERT([date],getdate())))
GO
ALTER TABLE [dbo].[buletine_laborator] CHECK CONSTRAINT [CK_buletine_laborator_2]
GO
ALTER TABLE [dbo].[examene_control]  WITH CHECK ADD  CONSTRAINT [CK_examene_control_1] CHECK  (([data_examen]<=CONVERT([date],getdate())))
GO
ALTER TABLE [dbo].[examene_control] CHECK CONSTRAINT [CK_examene_control_1]
GO
ALTER TABLE [dbo].[mobilizari]  WITH CHECK ADD  CONSTRAINT [CK_mobilizari_1] CHECK  (([data_mobilizarii]<=CONVERT([date],getdate())))
GO
ALTER TABLE [dbo].[mobilizari] CHECK CONSTRAINT [CK_mobilizari_1]
GO
ALTER TABLE [dbo].[pacienti]  WITH CHECK ADD  CONSTRAINT [CK_pacienti_1] CHECK  (([sex]='F' OR [sex]='M'))
GO
ALTER TABLE [dbo].[pacienti] CHECK CONSTRAINT [CK_pacienti_1]
GO
ALTER TABLE [dbo].[pacienti]  WITH CHECK ADD  CONSTRAINT [CK_pacienti_2] CHECK  (([tip_mediu]='R' OR [tip_mediu]='U'))
GO
ALTER TABLE [dbo].[pacienti] CHECK CONSTRAINT [CK_pacienti_2]
GO
USE [master]
GO
ALTER DATABASE [Screening] SET  READ_WRITE 
GO
