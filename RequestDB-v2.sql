CREATE DATABASE RequestDB

USE [RequestDB]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 04/27/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[student_id] [char](8) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[date_of_birth] [date] NULL,
	[address] [nvarchar](50) NULL,
	[class] [nvarchar](50) NULL,
	[sex] [bit] NOT NULL,
	[school_year] [int] NOT NULL,
	[education_level] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/27/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[role] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiCauHoi]    Script Date: 04/27/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCauHoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoVu]    Script Date: 04/27/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GiaoVu](
	[ministry_id] [char](8) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[sex] [bit] NOT NULL,
 CONSTRAINT [PK_GiaoVu] PRIMARY KEY CLUSTERED 
(
	[ministry_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 04/27/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[username] [char](8) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[id_role] [int] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CauTraLoi]    Script Date: 04/27/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CauTraLoi](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[question_id] [bigint] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[ministry_id] [char](8) NOT NULL,
	[time_respond] [datetime] NOT NULL,
 CONSTRAINT [PK_CauTraLoi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CauHoi]    Script Date: 04/27/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CauHoi](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type_id] [int] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[student_id] [char](8) NOT NULL,
	[time_request] [datetime] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BoSung]    Script Date: 04/27/2017 23:49:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoSung](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[question_id] [bigint] NOT NULL,
	[isSupplement] [bit] NOT NULL,
	[isResponsed] [bit] NOT NULL,
 CONSTRAINT [PK_BoSung] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_BoSung_CauHoi]    Script Date: 04/27/2017 23:49:35 ******/
ALTER TABLE [dbo].[BoSung]  WITH CHECK ADD  CONSTRAINT [FK_BoSung_CauHoi] FOREIGN KEY([question_id])
REFERENCES [dbo].[CauHoi] ([id])
GO
ALTER TABLE [dbo].[BoSung] CHECK CONSTRAINT [FK_BoSung_CauHoi]
GO
/****** Object:  ForeignKey [FK_Question_QuestionType]    Script Date: 04/27/2017 23:49:35 ******/
ALTER TABLE [dbo].[CauHoi]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionType] FOREIGN KEY([type_id])
REFERENCES [dbo].[LoaiCauHoi] ([id])
GO
ALTER TABLE [dbo].[CauHoi] CHECK CONSTRAINT [FK_Question_QuestionType]
GO
/****** Object:  ForeignKey [FK_Question_Student]    Script Date: 04/27/2017 23:49:35 ******/
ALTER TABLE [dbo].[CauHoi]  WITH CHECK ADD  CONSTRAINT [FK_Question_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[SinhVien] ([student_id])
GO
ALTER TABLE [dbo].[CauHoi] CHECK CONSTRAINT [FK_Question_Student]
GO
/****** Object:  ForeignKey [FK_Answer_Ministry]    Script Date: 04/27/2017 23:49:35 ******/
ALTER TABLE [dbo].[CauTraLoi]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Ministry] FOREIGN KEY([ministry_id])
REFERENCES [dbo].[GiaoVu] ([ministry_id])
GO
ALTER TABLE [dbo].[CauTraLoi] CHECK CONSTRAINT [FK_Answer_Ministry]
GO
/****** Object:  ForeignKey [FK_Account_Role]    Script Date: 04/27/2017 23:49:35 ******/
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([id_role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_Account_Role]
GO


CREATE TRIGGER account_trig	ON [dbo].[TaiKhoan]
FOR INSERT
AS
IF (SELECT username from INSERTED)
NOT IN(SELECT s.student_id  FROM SinhVien s) 
BEGIN
Print 'Bạn không thể insert giá trị này'
ROLLBACK TRAN
END