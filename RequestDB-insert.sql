USE [master]
GO
/****** Object:  Database [RequestDB]    Script Date: 5/6/2017 12:55:50 AM ******/
CREATE DATABASE [RequestDB] ON  PRIMARY 
( NAME = N'RequestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RequestDB.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RequestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RequestDB_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RequestDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RequestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RequestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RequestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RequestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RequestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RequestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RequestDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RequestDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RequestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RequestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RequestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RequestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RequestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RequestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RequestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RequestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RequestDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RequestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RequestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RequestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RequestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RequestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RequestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RequestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RequestDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RequestDB] SET  MULTI_USER 
GO
ALTER DATABASE [RequestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RequestDB] SET DB_CHAINING OFF 
GO
USE [RequestDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/6/2017 12:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](8) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[id_role] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 5/6/2017 12:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[question_id] [bigint] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[ministry_id] [char](10) NOT NULL,
	[time_respond] [datetime] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ministry]    Script Date: 5/6/2017 12:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ministry](
	[ministry_id] [char](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[sex] [bit] NOT NULL,
 CONSTRAINT [PK_GiaoVu] PRIMARY KEY CLUSTERED 
(
	[ministry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Question]    Script Date: 5/6/2017 12:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type_id] [int] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[student_id] [char](8) NOT NULL,
	[time_request] [datetime] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 5/6/2017 12:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/6/2017 12:55:50 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/6/2017 12:55:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [char](8) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[address] [nvarchar](50) NULL,
	[class] [nvarchar](50) NOT NULL,
	[sex] [bit] NOT NULL,
	[school_year] [int] NULL,
	[education_level] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([username], [password], [id_role]) VALUES (N'12032541', N'12032541', 1)
INSERT [dbo].[Account] ([username], [password], [id_role]) VALUES (N'12097634', N'12097634', 1)
INSERT [dbo].[Account] ([username], [password], [id_role]) VALUES (N'13097616', N'13097616', 1)
INSERT [dbo].[Account] ([username], [password], [id_role]) VALUES (N'13097675', N'13097675', 1)
INSERT [dbo].[Account] ([username], [password], [id_role]) VALUES (N'14087765', N'14087765', 1)
INSERT [dbo].[Account] ([username], [password], [id_role]) VALUES (N'99046821', N'99046821  ', 2)
INSERT [dbo].[Account] ([username], [password], [id_role]) VALUES (N'99054871', N'99054871  ', 2)
INSERT [dbo].[Account] ([username], [password], [id_role]) VALUES (N'99076851', N'99076851  ', 2)
INSERT [dbo].[Account] ([username], [password], [id_role]) VALUES (N'admin', N'admin', 3)
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (2, 1, N'Theo qui chế, thời gian ôn thi tối thiểu 1 ngày ôn thi/1tín chỉ, đây là nguyên tắc xuyên suốt và phải chấp hành tuyệt đối khi bố trí lịch thi cuối kỳ. Trong thời gian qua khi bố trí lịch thi, phòng Đào tạo đã đảm bảo số ngày ôn thi theo qui định trên và cố gắng giãn đều lịch thi. Tuy nhiên, đối với trường hợp cá biệt khi các em đăng ký học nhanh có thể dẫn đến một vài học phần có lịch thi gần nhau. Vì vậy các em phải chủ động lập kế hoạch ôn thi theo nguyên tắc chỉ dành số ngày tối thiểu để ôn thi cho 1 tín chỉ. Sinh viên đăng ký học nhanh được bố trí thi cùng lớp học phần được duyệt đăng ký học nhanh vì vậy sinh viên phải quan tâm lịch thi, thực hiện đúng lịch thi.', N'99046821  ', CAST(0x0000A6F800FA7E2C AS DateTime))
INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (3, 2, N'
Hiện nay phần lớn các học phần đang được giảng dạy tại trường đều có giáo trình hoặc bài giảng chuẩn. Sinh viên hệ liên thông hay sinh viên chính quy khi học cùng 1 học phần đều dùng chung giáo trình, bởi vì yêu cầu về kiến thức đều như nhau.', N'99046821  ', CAST(0x0000A6F800FA88B8 AS DateTime))
INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (5, 4, N'Việc đăng ký bổ sung và rút bớt học phần được quy định rõ tại điều 8 trong quy chế 192.1 của trường về thời gian, số lượng và trình tự thực hiện. Trong thời gian tới, trường sẽ có quy định cụ thể để hướng dẫn thực hiện điều này với sinh viên và giáo viên. Đề nghị các em đọc và thực hiện đúng qui chế, hướng dẫn. Các em cần lưu ý tranh thủ vai trò tư vấn của cố vấn học tập trong đăng ký bổ sung và rút bớt học phần.', N'99046821  ', CAST(0x0000A6F800FA8E94 AS DateTime))
INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (6, 5, N'Việc phân công số lượng giáo viên giảng dạy cho 1 lớp học phần được thực hiện theo 1 trong 2 cách phổ biến: (1) Phân công 1 giáo viên giảng dạy / 1 lớp học phần. (2) Phân công nhiều giáo viên giảng dạy /1 lớp HP. Cách (2) phù hợp với những sinh viên năng động, ưa thích sự thay đổi, vì theo cách này sinh viên có thể tiếp cận được nhiều phương pháp giảng dạy với những cách thức truyền tải thông tin đa dạng hơn, phong phú hơn', N'99054871  ', CAST(0x0000A6F800CE043C AS DateTime))
INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (7, 6, N'
Trước hết sinh viên cần tự xem lại mình xem đã thực sự quan tâm đến hoạt động của Nhà trường hay chưa bởi mọi thông tin về các hoạt động của Nhà trường đều được thông báo công khai tại bảng tin và được thông báo bằng văn bản theo các kênh thông tin cần thiết.', N'99054871  ', CAST(0x0000A6F800CF6750 AS DateTime))
INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (8, 7, N'Để có thể tham gia vào đội thanh niên tình nguyện thì trước hết các bạn phải có tinh thần nhiệt tình với các hoạt động phong trào và hoạt động xã hội, tiếp đó các bạn phải có thể bố trí được thời gian để tham gia (tránh không làm ảnh hưởng đến học tập của các bạn). Để tham gia vào đội thanh niên tinh nguyện thì các bạn cần đăng ký tại văn phòng đoàn trường hoặc thông qua hội sinh viên (trong bản đăng ký cần ghi rõ họ và tên, địa chỉ liên hệ, số điện thoại có thể liên hệ khi cần thiết)', N'99054871  ', CAST(0x0000A6F800CFFAF8 AS DateTime))
INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (9, 9, N'- Một năm Nhà trường đầu tư cho thư viện mua từ 700 đến 1000 tên sách với số  bản mỗi loại từ 3 đến 6 cuốn. Tất cả những tài liệu này đều do các bộ môn lựa chọn và Tổ tư vấn xét chọn của Nhà trường cùng Ban Giám hiệu đã kiểm duyệt sát với các học phần đào tạo của trường. Do đó không thể nói thư viện ít sách. Có chăng đó là tài liệu của những năm trước đây có số bản không nhiều, do đó nếu có 4 người mượn về nhà cùng một lúc thì chắc chắn sách đã hết. Tuy nhiên sinh viên có thể đọc tại chỗ cuốn sách đó tại phòng đọc. Hơn nữa, hiện nay Nhà trường tăng cường tập trung mua các đầu sách tham khảo bắt buộc theo biểu mẫu số 4 mỗi loại 30 cuốn nên sẽ đáp ứng nhu cầu học tập của sinh viên tới đây.
- Sách ngoại văn không cho sinh viên mượn về nhà với lý do sau: Sách ngoại văn quá đắt tiền, hơn nữa mỗi cuốn sách ngoại văn chỉ có một bản. Vì thế không thể cho sinh viên mượn về nhà được. Tuy nhiên Thư viện có thể cho phép các em photo những trang tài liệu cần thiết. Các em cần đọc kỹ trang mục lục để lựa chọn những phần quan trọng yêu cầu Thư viện photo.', N'99076851  ', CAST(0x0000A6F800ED5D3C AS DateTime))
INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (10, 10, N'Điều này Thư viện xin ghi nhận để rút kinh nghiệm. Tuy nhiên thái độ trên chỉ tập trung ở một vài đối tượng chủ yếu. Hiện nay Thư viện đã có giải pháp khắc phục tình trạng này bằng cách đưa toàn bộ cán bộ trẻ ra phục vụ và lấy thái độ phục vụ làm tiêu chí bình bầu thi đua cuối năm nên đã hạn chế nhiều. Về phía sinh viên cũng phải lưu ý có thái độ đúng mực với cán bộ thư viện. Không nên chen lấn xô đẩy và phát ngôn thiếu văn hoá đối với cán bộ thủ thư.', N'99076851  ', CAST(0x0000A6F800EEA430 AS DateTime))
INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (11, 11, N'- Sinh viên thuộc đối tượng miễn học phí thì được miễn học phí trong 1 lần học lại, học lần 2 đóng 50% học phí, lần tiếp theo trở đi phải đóng 100% học phí.
- Với sinh viên thuộc diện giảm học phí thì chỉ áp dụng đối với học lần đầu, sinh viên học lại lần thứ nhất phải đóng 75% học phí, lần tiếp theo trở đi phải đóng 100% học phí.', N'99076851  ', CAST(0x0000A6F800F03D2C AS DateTime))
INSERT [dbo].[Answer] ([id], [question_id], [text], [ministry_id], [time_respond]) VALUES (12, 12, N'Chuyển từ đào tạo niên chế sang đào tạo theo tín chỉ, nhà trường đã tạo rất nhiều cơ hội cho sinh viên tiếp cận với thực tế kinh doanh. Trong mỗi năm các sinh viên từ năm thứ 2 trở đi, đều có các chuyên đề  thực tế mà nhà trường mời giáo viên thực tế báo cáo, đồng thời trong chương trình đào tạo, có nhiều học phần thuộc khối kiến thức ngành và chuyên ngành có tiết giảng thực tế của giáo viên thực tế (thường là 3 tiết). Ngoài ra, các học phần có tiết thảo luận, thông qua các đề tài thảo luận, giáo viên giảng dạy hướng dẫn cho sinh viên tìm hiểu thực tế để thực hiện đề tài thảo luận, cùng với đó nhà trường luôn khuyến khích các sinh viên nghiên cứu khoa học, thông qua nghiên cứu khoa học, giáo viên hướng dẫn cho các sinh viên nghiên cứu, khảo sát thực tế để thực hiện đề tài. Như vậy, trong chương trình đào tạo, nhà trường đã bố trí nhiều tiết giảng thực tế và tạo nhiều cơ hội để sinh viên nghiên cứu, khảo sát thực tế, phát huy được tính chủ động, sáng tạo, tự học, tự nghiên cứu của sinh viên, đảm bảo được sự phù hợp giữa học lý thuyết và thực tế trong chương trình đào tạo.', N'99054871  ', CAST(0x0000A6F800D78C14 AS DateTime))
SET IDENTITY_INSERT [dbo].[Answer] OFF
INSERT [dbo].[Ministry] ([ministry_id], [name], [date_of_birth], [address], [sex]) VALUES (N'99046821  ', N'Nguyễn Thị Hiền', CAST(0x06F20A00 AS Date), N'125 Nguyễn Trãi, Q.5, Tp.HCM', 0)
INSERT [dbo].[Ministry] ([ministry_id], [name], [date_of_birth], [address], [sex]) VALUES (N'99054871  ', N'Nguyễn Hoàng Hiên', CAST(0x91070B00 AS Date), N'127/4/8 Lý Tự Trọng, Q.3, Tp.HCM', 1)
INSERT [dbo].[Ministry] ([ministry_id], [name], [date_of_birth], [address], [sex]) VALUES (N'99076851  ', N'Trần Văn Vũ', CAST(0x0C050B00 AS Date), N'452/5 Phạm Ngũ Lão, Q.1, Tp.HCM', 1)
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (1, 1, N'Việc bố trí lịch thi cuối kỳ dày đặc?', N'12032541', CAST(0x0000A6F800A51A04 AS DateTime))
INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (2, 1, N'Vấn đề về giáo trình học tập chuẩn của nhà trường cho các môn học của sinh viên hệ hoàn chỉnh kiến thức được nhà trường đáp ứng như thế nào?', N'12097634', CAST(0x0000A6F800A51FE0 AS DateTime))
INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (4, 1, N'Điều kiện đăng ký rút bớt và bổ sung học phần?', N'13097616', CAST(0x0000A6F800A525BC AS DateTime))
INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (5, 1, N'Mỗi học phần không nên thay đổi quá nhiều giáo viên', N'13097675', CAST(0x0000A6F800A56630 AS DateTime))
INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (6, 4, N'Các hoạt động do Nhà trường tổ chức, làm thế nào để sinh viên chúng em có thể biết và tham gia? Vì có rất nhiều hoạt động Nhà trường tổ chức mà chúng em không biết', N'13097616', CAST(0x0000A6F800A56C0C AS DateTime))
INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (7, 4, N'
Những điều kiện để sinh viên được tham gia vào đội thanh niên tình nguyện là như thế nào? Để được vào đội “thanh niên tình nguyện” sinh viên chúng em cần phải làm gì? và đăng ký ở đâu?', N'12032541', CAST(0x0000A6F800A5756C AS DateTime))
INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (9, 1, N'Thư viện ít sách, nhiều khi sinh viên được trả lời hết tài liệu; sinh viên không được mượn sách ngoại văn về nhà ?', N'14087765', CAST(0x0000A6F800863184 AS DateTime))
INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (10, 1, N'Cán bộ thư viện khó tính, tạo ra sự ngại ngùng cho sinh viên khi lên đọc, mượn tài liệu trên Thư viện?', N'13097616', CAST(0x0000A6F8009671AC AS DateTime))
INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (11, 3, N'Em thuộc diện miễn học phí, nếu học lại một môn thì có phải đóng học phí không?', N'13097675', CAST(0x0000A6F80075C27C AS DateTime))
INSERT [dbo].[Question] ([id], [type_id], [text], [student_id], [time_request]) VALUES (12, 1, N'Chúng em rất muốn có cơ hội đi thực tế từ năm thứ 3 để có nhiều kiến thức thực tế hơn. Vậy nhà trường có kế hoạch gì về vấn đề này không?', N'13097616', CAST(0x0000A6F800ADC58C AS DateTime))
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuestionType] ON 

INSERT [dbo].[QuestionType] ([id], [type]) VALUES (1, N'Đào tạo')
INSERT [dbo].[QuestionType] ([id], [type]) VALUES (2, N'Văn bằng')
INSERT [dbo].[QuestionType] ([id], [type]) VALUES (3, N'Tài chính - Kế toán')
INSERT [dbo].[QuestionType] ([id], [type]) VALUES (4, N'Công tác Sinh viên')
INSERT [dbo].[QuestionType] ([id], [type]) VALUES (5, N'Sau Đại học')
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
INSERT [dbo].[Role] ([id], [role]) VALUES (1, N'sinh viên')
INSERT [dbo].[Role] ([id], [role]) VALUES (2, N'giáo vụ')
INSERT [dbo].[Role] ([id], [role]) VALUES (3, N'admin')
INSERT [dbo].[Student] ([student_id], [name], [date_of_birth], [address], [class], [sex], [school_year], [education_level]) VALUES (N'12032541', N'Nguyễn Thị Cẩm', CAST(0x1A1C0B00 AS Date), N'Cần Thơ', N'DHHOA8A', 0, 2012, N'Đại học')
INSERT [dbo].[Student] ([student_id], [name], [date_of_birth], [address], [class], [sex], [school_year], [education_level]) VALUES (N'12097634', N'Trần Văn Tâm', CAST(0xD51B0B00 AS Date), N'Hà Nội', N'DHQTKD8A', 1, 2012, N'Đại học')
INSERT [dbo].[Student] ([student_id], [name], [date_of_birth], [address], [class], [sex], [school_year], [education_level]) VALUES (N'13097616', N'Nguyễn Lê Thị Ngọc', CAST(0x3D1D0B00 AS Date), N'Tp.HCM', N'DHKT9C', 0, 2013, N'Đại học')
INSERT [dbo].[Student] ([student_id], [name], [date_of_birth], [address], [class], [sex], [school_year], [education_level]) VALUES (N'13097675', N'Nguyễn Văn Lâm', CAST(0x631C0B00 AS Date), N'Bình Định', N'DHCK9B', 1, 2013, N'Đại học')
INSERT [dbo].[Student] ([student_id], [name], [date_of_birth], [address], [class], [sex], [school_year], [education_level]) VALUES (N'14087765', N'Lê Thị Thơ', CAST(0xB71F0B00 AS Date), N'Huế', N'DHKT10A', 0, 2014, N'Đại học')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Account__F3DBC5720BC6C43E]    Script Date: 5/6/2017 12:55:50 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__F3DBC5720BC6C43E] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Answer__2EC215480EA330E9]    Script Date: 5/6/2017 12:55:50 AM ******/
ALTER TABLE [dbo].[Answer] ADD UNIQUE NONCLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([id_role])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Ministry] FOREIGN KEY([ministry_id])
REFERENCES [dbo].[Ministry] ([ministry_id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Ministry]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuestionType] FOREIGN KEY([type_id])
REFERENCES [dbo].[QuestionType] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuestionType]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Student]
GO
USE [master]
GO
ALTER DATABASE [RequestDB] SET  READ_WRITE 
GO
