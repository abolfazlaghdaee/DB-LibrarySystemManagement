--- Authentication System
CREATE TABLE [dbo].[Authentication System](
	[LoginId] [nvarchar](50) NOT NULL,
	[Password] [int] NOT NULL,
 CONSTRAINT [PK_Authentication System] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



--- Author
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] NOT NULL,
	[PersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Author]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])



--- Author_Book
CREATE TABLE [dbo].[Author_Book](
	[ISBN number] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Order] [int] NOT NULL
) ON [PRIMARY]



--- Book
CREATE TABLE [dbo].[Book](
	[ISBNnumber] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Edition] [int] NULL,
	[Category] [nvarchar](50) NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ISBNnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Book1] FOREIGN KEY([ISBNnumber])
REFERENCES [dbo].[Book] ([ISBNnumber])
GO

ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Book1]
GO



--- BookCount
CREATE TABLE [dbo].[BookCounts](
	[count] [int] NOT NULL
) ON [PRIMARY]



--- BookLog
CREATE TABLE [dbo].[BookLog](
	[ISBN number] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Edition] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[delDate] [nvarchar](50) NOT NULL
) ON [PRIMARY]



--- Person
CREATE TABLE [dbo].[Person](
	[PersonId] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Name]  AS (([FirstName]+' ')+[LastName]),
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



--- Publisher
CREATE TABLE [dbo].[Publisher](
	[PublisherId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



--- Publisher_Book
CREATE TABLE [dbo].[Publisher_Book](
	[PublisherId] [int] NOT NULL,
	[ISBN number] [int] NOT NULL,
	[PublishDate] [date] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Publisher_Book]  WITH CHECK ADD  CONSTRAINT [FK_PublisherBook_Publisher] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([PublisherId])
GO

ALTER TABLE [dbo].[Publisher_Book] CHECK CONSTRAINT [FK_PublisherBook_Publisher]




--- Reader
CREATE TABLE [dbo].[Reader](
	[UserId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[Email] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[PhoneNo] [varchar](20) NULL,
 CONSTRAINT [PK__Reader__1788CC4CA3710458] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reader]  WITH CHECK ADD  CONSTRAINT [FK__Reader__PersonId__4CA06362] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])


ALTER TABLE [dbo].[Reader] CHECK CONSTRAINT [FK__Reader__PersonId__4CA06362]



--- Reader_Book
CREATE TABLE [dbo].[Reader_Book](
	[ISBN number] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ReservationDate] [date] NULL,
	[LoanDate] [date] NULL,
	[BackDate] [date] NULL,
 CONSTRAINT [PK_Reader_Book] PRIMARY KEY CLUSTERED 
(
	[ISBN number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reader_Book]  WITH CHECK ADD  CONSTRAINT [FK_Reader_Book_Reader] FOREIGN KEY([UserId])
REFERENCES [dbo].[Reader] ([UserId])
GO

ALTER TABLE [dbo].[Reader_Book] CHECK CONSTRAINT [FK_Reader_Book_Reader]
GO



--- Staff
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] NOT NULL,
	[PersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])



--- Staff_Authentication
CREATE TABLE [dbo].[Staff_Authentication](
	[SttafId] [int] NOT NULL,
	[LoginId] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Staff_Authentication]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Authentication_Authentication System] FOREIGN KEY([LoginId])
REFERENCES [dbo].[Authentication System] ([LoginId])
GO

ALTER TABLE [dbo].[Staff_Authentication] CHECK CONSTRAINT [FK_Staff_Authentication_Authentication System]
GO

ALTER TABLE [dbo].[Staff_Authentication]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Authentication_Staff] FOREIGN KEY([SttafId])
REFERENCES [dbo].[Staff] ([StaffId])
GO

ALTER TABLE [dbo].[Staff_Authentication] CHECK CONSTRAINT [FK_Staff_Authentication_Staff]
GO



--- Staff_Reader
CREATE TABLE [dbo].[Staff_Reader](
	[StaffId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[GiveDate] [date] NULL,
	[GetDate] [date] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Staff_Reader]  WITH CHECK ADD  CONSTRAINT [FK_StaffReader_Reader] FOREIGN KEY([UserId])
REFERENCES [dbo].[Reader] ([UserId])
GO

ALTER TABLE [dbo].[Staff_Reader] CHECK CONSTRAINT [FK_StaffReader_Reader]
GO

ALTER TABLE [dbo].[Staff_Reader]  WITH CHECK ADD  CONSTRAINT [FK_StaffReader_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO

ALTER TABLE [dbo].[Staff_Reader] CHECK CONSTRAINT [FK_StaffReader_Staff]
GO




--- StaffSave
CREATE TABLE [dbo].[StaffSave](
	[StaffId] [int] NOT NULL,
	[QuantitySave] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[StaffSave]  WITH CHECK ADD  CONSTRAINT [FK_StaffSave_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO

ALTER TABLE [dbo].[StaffSave] CHECK CONSTRAINT [FK_StaffSave_Staff]
GO




















