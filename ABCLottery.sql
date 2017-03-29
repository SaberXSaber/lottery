-- SQL Manager 2008 for SQL Server 3.2.0.2
-- ---------------------------------------
-- 主机     : 180.97.75.169
--  数据库   : ABCLottery
-- 版本     : Microsoft SQL Server  11.0.2100.60


--
-- Definition for contract DEFAULT : 
--

CREATE CONTRACT [DEFAULT] 
  AUTHORIZATION [dbo]
  ([DEFAULT] SENT BY ANY)
GO

--
-- Definition for table Users : 
--

CREATE TABLE [dbo].[Users] (
  [UserId] int IDENTITY(1, 1) NOT NULL,
  [RoleId] int NULL,
  [UserName] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LoginName] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LoginPwd] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table UserOrderDetail : 
--

CREATE TABLE [dbo].[UserOrderDetail] (
  [OrderDetailId] int IDENTITY(1, 1) NOT NULL,
  [Currentdate] date NULL,
  [OrderId] int NULL,
  [CartId] int NULL,
  [UserId] int NULL,
  [LotteryTypeId] int NULL,
  [DetailType] int NULL,
  [LotteryDateNum] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [LotteryString] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CostMoney] decimal(18, 6) NULL,
  [OrderDetailState] int NULL,
  [LotteryLevel] int NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL,
  [SelectType] int CONSTRAINT [DF__UserOrder__Selec__4CA06362] DEFAULT 1 NOT NULL
)
ON [PRIMARY]
GO

EXEC sp_addextendedproperty 'MS_Description', N'1单式,2复式3胆投', 'schema', 'dbo', 'table', 'UserOrderDetail', 'column', 'SelectType'
GO

--
-- Definition for table UserOrderCart : 
--

CREATE TABLE [dbo].[UserOrderCart] (
  [CartId] int IDENTITY(1, 1) NOT NULL,
  [UserId] int NULL,
  [OrderId] int NULL,
  [CartNum] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table UserOrder : 
--

CREATE TABLE [dbo].[UserOrder] (
  [OrderId] int IDENTITY(1, 1) NOT NULL,
  [Currentdate] date NULL,
  [UserId] int NULL,
  [OrderType] int NULL,
  [OrderMoney] decimal(18, 6) NULL,
  [BeginLotteryDateNum] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [DoubleNum] int NULL,
  [MoreNum] int NULL,
  [TatalNum] int NULL,
  [OrderState] int NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table UserMoneyDetail : 
--

CREATE TABLE [dbo].[UserMoneyDetail] (
  [DetailId] int IDENTITY(1, 1) NOT NULL,
  [Currentdate] date NULL,
  [UserId] int NULL,
  [TypeId] int NULL,
  [TypeDetailId] int NULL,
  [LotteryTypeId] int NULL,
  [Money] decimal(18, 6) NULL,
  [Remark] varchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table UserInfo : 
--

CREATE TABLE [dbo].[UserInfo] (
  [UserId] int IDENTITY(1, 1) NOT NULL,
  [MobilePhone] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [NickName] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LoginAccount] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LoginPwd] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LogoUrl] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

EXEC sp_addextendedproperty 'MS_Description', N'主键，用户ID', 'schema', 'dbo', 'table', 'UserInfo', 'column', 'UserId'
GO

EXEC sp_addextendedproperty 'MS_Description', N'手机号', 'schema', 'dbo', 'table', 'UserInfo', 'column', 'MobilePhone'
GO

EXEC sp_addextendedproperty 'MS_Description', N'昵称', 'schema', 'dbo', 'table', 'UserInfo', 'column', 'NickName'
GO

EXEC sp_addextendedproperty 'MS_Description', N'登陆名', 'schema', 'dbo', 'table', 'UserInfo', 'column', 'LoginAccount'
GO

EXEC sp_addextendedproperty 'MS_Description', N'登陆密码', 'schema', 'dbo', 'table', 'UserInfo', 'column', 'LoginPwd'
GO

EXEC sp_addextendedproperty 'MS_Description', N'头像', 'schema', 'dbo', 'table', 'UserInfo', 'column', 'LogoUrl'
GO

EXEC sp_addextendedproperty 'MS_Description', N'当前状态 0，无效 1，有效', 'schema', 'dbo', 'table', 'UserInfo', 'column', 'CurState'
GO

EXEC sp_addextendedproperty 'MS_Description', N'最后修改时间', 'schema', 'dbo', 'table', 'UserInfo', 'column', 'UpdateTime'
GO

EXEC sp_addextendedproperty 'MS_Description', N'注册时间', 'schema', 'dbo', 'table', 'UserInfo', 'column', 'CreateTime'
GO

--
-- Definition for table UserBankCard : 
--

CREATE TABLE [dbo].[UserBankCard] (
  [BankCardId] int IDENTITY(1, 1) NOT NULL,
  [BankName] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [BankAddress] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CardNum] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [MobilePhone] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL,
  [AccountId] int NOT NULL
)
ON [PRIMARY]
GO

EXEC sp_addextendedproperty 'MS_Description', N'账户Id', 'schema', 'dbo', 'table', 'UserBankCard', 'column', 'AccountId'
GO

--
-- Definition for table UserAccount : 
--

CREATE TABLE [dbo].[UserAccount] (
  [AccountId] int IDENTITY(1, 1) NOT NULL,
  [UserId] int NULL,
  [UserBalance] decimal(18, 6) NULL,
  [FreezeMoney] decimal(18, 6) NULL,
  [IDCardNum] varchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [IDCardUrlP] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [IDCardUrlN] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [IsRealNA] int NULL,
  [IsBindBankCard] int NULL,
  [PayPwd] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL,
  [RealName] varchar(500) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

EXEC sp_addextendedproperty 'MS_Description', N'主键，账户ID', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'AccountId'
GO

EXEC sp_addextendedproperty 'MS_Description', N'用户ID', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'UserId'
GO

EXEC sp_addextendedproperty 'MS_Description', N'用户余额', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'UserBalance'
GO

EXEC sp_addextendedproperty 'MS_Description', N'冻结金额', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'FreezeMoney'
GO

EXEC sp_addextendedproperty 'MS_Description', N'身份证号码', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'IDCardNum'
GO

EXEC sp_addextendedproperty 'MS_Description', N'身份证正面', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'IDCardUrlP'
GO

EXEC sp_addextendedproperty 'MS_Description', N'身份证反面', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'IDCardUrlN'
GO

EXEC sp_addextendedproperty 'MS_Description', N'是否实名认证', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'IsRealNA'
GO

EXEC sp_addextendedproperty 'MS_Description', N'是否绑定银行卡', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'IsBindBankCard'
GO

EXEC sp_addextendedproperty 'MS_Description', N'支付密码', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'PayPwd'
GO

EXEC sp_addextendedproperty 'MS_Description', N'当前状态', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'CurState'
GO

EXEC sp_addextendedproperty 'MS_Description', N'最后修改时间', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'UpdateTime'
GO

EXEC sp_addextendedproperty 'MS_Description', N'注册时间', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'CreateTime'
GO

EXEC sp_addextendedproperty 'MS_Description', N'真实姓名', 'schema', 'dbo', 'table', 'UserAccount', 'column', 'RealName'
GO

--
-- Definition for table trace_xe_event_map : 
--

CREATE TABLE [sys].[trace_xe_event_map] (
  [trace_event_id] smallint NOT NULL,
  [package_name] nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [xe_event_name] nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

--
-- Definition for table trace_xe_action_map : 
--

CREATE TABLE [sys].[trace_xe_action_map] (
  [trace_column_id] smallint NOT NULL,
  [package_name] nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [xe_action_name] nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

--
-- Definition for table t_plan_keyword : 
--

CREATE TABLE [dbo].[t_plan_keyword] (
  [ItemId] int IDENTITY(1, 1) NOT NULL,
  [keyword] varchar(500) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table RolePage : 
--

CREATE TABLE [dbo].[RolePage] (
  [Id] int IDENTITY(1, 1) NOT NULL,
  [RoleId] int NULL,
  [PageId] int NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Role : 
--

CREATE TABLE [dbo].[Role] (
  [RoleId] int IDENTITY(1, 1) NOT NULL,
  [RoleName] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Page : 
--

CREATE TABLE [dbo].[Page] (
  [PageId] int IDENTITY(1, 1) NOT NULL,
  [PageName] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [PageGroupName] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [PagePath] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table OperationLog : 
--

CREATE TABLE [dbo].[OperationLog] (
  [Id] int IDENTITY(1, 1) NOT NULL,
  [UserId] int NOT NULL,
  [OperatorType] int NULL,
  [Descr] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [RequestIp] nvarchar(300) COLLATE Chinese_PRC_CI_AS NULL,
  [Params] nvarchar(300) COLLATE Chinese_PRC_CI_AS NULL,
  [OperatorTime] datetime CONSTRAINT [DF__Operation__Opera__3D5E1FD2] DEFAULT getdate() NOT NULL
)
ON [PRIMARY]
GO

EXEC sp_addextendedproperty 'MS_Description', N'操作类型  , 0 删除，1 新增  2 编辑，3 登录，4 其他', 'schema', 'dbo', 'table', 'OperationLog', 'column', 'OperatorType'
GO

--
-- Definition for table LotteryType : 
--

CREATE TABLE [dbo].[LotteryType] (
  [TypeId] int IDENTITY(1, 1) NOT NULL,
  [SeqNum] int NULL,
  [TypeName] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [Tips] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [ParentId] int NULL,
  [ParentName] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LogoUrl] varchar(max) COLLATE Chinese_PRC_CI_AS NULL,
  [Price] decimal(18, 6) NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table LotteryHistory : 
--

CREATE TABLE [dbo].[LotteryHistory] (
  [ItemId] int IDENTITY(1, 1) NOT NULL,
  [LotteryType] int NULL,
  [LotterySeq] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LotteryDate] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LotteryString] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LotteryStringTry] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [TotalMoney] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [LotteryMoney] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [Lottery1Num] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [Lottery1NumString] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [Lottery2Num] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [Lottery2NumString] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [Lottery3Num] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [Lottery3NumString] varchar(500) COLLATE Chinese_PRC_CI_AS NULL,
  [CurState] int NULL,
  [UpdateTime] datetime NULL,
  [CreateTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Data for table dbo.LotteryHistory  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[LotteryHistory] ON
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, 1, N'2017013', N'2017-02-05（日）', N'081128293133 06', N'', N'377,878,424元', N'924,629,020元', N'10', N'6997500', N'99', N'252209', N'', N'', 1, '20170322 14:01:19.157', '20170207 16:24:40.683')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, 1, N'2017012', N'2017-01-26（四）', N'101114151624 07', N'', N'329,120,186元', N'', N'9', N'7016617', N'80', N'283586', N'', N'', 1, '20170322 14:01:19.310', '20170207 16:24:43.580')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, 1, N'2017011', N'2017-01-24（二）', N'101112232629 16', N'', N'318,019,266元', N'', N'11', N'6835064', N'229', N'110184', N'', N'', 1, '20170322 14:01:19.490', '20170207 16:24:45.210')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, 1, N'2017010', N'2017-01-22（日）', N'050819252830 07', N'', N'350,388,682元', N'', N'30', N'5251359', N'231', N'40805', N'', N'', 1, '20170322 14:01:19.653', '20170207 16:24:46.677')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (5, 1, N'2017009', N'2017-01-19（四）', N'020608091529 14', N'', N'318,286,702元', N'', N'9', N'6976497', N'145', N'153348', N'', N'', 1, '20170322 14:01:19.810', '20170207 16:24:48.777')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (6, 1, N'2017008', N'2017-01-17（二）', N'071315272829 13', N'', N'318,368,112元', N'', N'10', N'6455001', N'165', N'110227', N'', N'', 1, '20170322 14:01:19.967', '20170207 16:24:49.843')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (7, 1, N'2017007', N'2017-01-15（日）', N'020405242633 15', N'', N'358,098,002元', N'', N'7', N'8376630', N'62', N'476540', N'', N'', 1, '20170322 14:01:20.143', '20170207 16:24:50.363')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (8, 1, N'2017006', N'2017-01-12（四）', N'020408262933 08', N'', N'327,823,184元', N'', N'4', N'6946576', N'70', N'139041', N'', N'', 1, '20170322 14:01:20.310', '20170207 16:24:50.903')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (9, 1, N'2017005', N'2017-01-10（二）', N'061112222330 05', N'', NULL, N'', N'14', N'6083962', N'204', N'92986', N'', N'', 1, '20170322 14:01:20.473', '20170207 16:24:51.420')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (10, 1, N'2017004', N'2017-01-08（日）', N'051317262730 07', N'', NULL, N'', N'18', N'5946813', N'294', N'72460', N'', N'', 1, '20170322 14:01:20.627', '20170207 16:24:51.977')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (11, 1, N'2017003', N'2017-01-05（四）', N'010408152732 16', N'', NULL, N'', N'3', N'10000000', N'80', N'305874', N'', N'', 1, '20170322 14:01:20.800', '20170207 16:24:52.507')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (12, 1, N'2017002', N'2017-01-03（二）', N'151923242532 03', N'', NULL, N'', N'4', N'10000000', N'67', N'391374', N'', N'', 1, '20170307 09:28:13.247', '20170207 16:24:53.053')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (13, 1, N'2017001', N'2017-01-01（日）', N'091114202526 15', N'', NULL, N'', N'9', N'7522351', N'184', N'154219', N'', N'', 1, '20170307 09:28:13.390', '20170207 16:24:54.027')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (14, 1, N'2016153', N'2016-12-29（四）', N'070916242529 06', N'', NULL, N'', N'5', N'7932287', N'247', N'74197', N'', N'', 1, '20170307 09:28:13.540', '20170207 16:24:55.023')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (15, 1, N'2016152', N'2016-12-27（二）', N'020809162022 07', N'', NULL, N'', N'17', N'5986457', N'247', N'84867', N'', N'', 1, '20170307 09:28:13.667', '20170207 16:24:55.570')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (16, 1, N'2016151', N'2016-12-25（日）', N'061116202233 07', N'', NULL, N'', N'11', N'6923271', N'130', N'203422', N'', N'', 1, '20170307 09:28:13.803', '20170207 16:24:56.160')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (17, 1, N'2016150', N'2016-12-22（四）', N'020405091321 05', N'', NULL, N'', N'22', N'5849327', N'140', N'166832', N'', N'', 1, '20170307 09:28:13.920', '20170207 16:24:57.330')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (18, 1, N'2016149', N'2016-12-20（二）', N'032023263233 07', N'', NULL, N'', N'5', N'7413987', N'77', N'195940', N'', N'', 1, '20170307 09:28:14.053', '20170207 16:24:57.900')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (19, 1, N'2016148', N'2016-12-18（日）', N'010211202630 14', NULL, NULL, NULL, N'10', N'7088635', N'158', N'165240', NULL, NULL, 1, '20170207 16:24:58.467', '20170207 16:24:58.467')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (20, 1, N'2016147', N'2016-12-15（四）', N'041418283132 12', NULL, NULL, NULL, N'5', N'8475931', N'113', N'192252', NULL, NULL, 1, '20170207 16:24:59.050', '20170207 16:24:59.050')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (21, 1, N'2016146', N'2016-12-13（二）', N'030715161723 10', NULL, NULL, NULL, N'8', N'7329207', N'133', N'175128', NULL, NULL, 1, '20170207 16:25:02.633', '20170207 16:25:02.633')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (22, 1, N'2016145', N'2016-12-11（日）', N'010307121920 06', NULL, NULL, NULL, N'8', N'6264341', N'157', N'80531', NULL, NULL, 1, '20170207 16:25:03.407', '20170207 16:25:03.407')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (23, 1, N'2016144', N'2016-12-08（四）', N'041012273233 05', NULL, NULL, NULL, N'14', N'6201501', N'86', N'244491', NULL, NULL, 1, '20170207 16:25:03.957', '20170207 16:25:03.957')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (24, 1, N'2016143', N'2016-12-06（二）', N'060923242533 13', NULL, NULL, NULL, N'5', N'9007647', N'143', N'175159', NULL, NULL, 1, '20170207 16:25:04.363', '20170207 16:25:04.363')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (25, 1, N'2016142', N'2016-12-04（日）', N'011017212330 12', NULL, NULL, NULL, N'11', N'6818174', N'85', N'294116', NULL, NULL, 1, '20170207 16:25:04.757', '20170207 16:25:04.757')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (26, 1, N'2016141', N'2016-12-01（四）', N'041315172124 15', NULL, NULL, NULL, N'7', N'8186439', N'106', N'263031', NULL, NULL, 1, '20170207 16:25:05.590', '20170207 16:25:05.590')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (27, 1, N'2016140', N'2016-11-29（二）', N'010205172632 10', NULL, NULL, NULL, N'16', N'5846950', N'84', N'201654', NULL, NULL, 1, '20170207 16:25:05.970', '20170207 16:25:05.970')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (28, 1, N'2016139', N'2016-11-27（日）', N'010619262830 03', NULL, NULL, NULL, N'5', N'9936561', N'94', N'328228', NULL, NULL, 1, '20170207 16:25:06.367', '20170207 16:25:06.367')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (29, 1, N'2016138', N'2016-11-24（四）', N'071620242530 07', NULL, NULL, NULL, N'12', N'6052114', N'160', N'98635', NULL, NULL, 1, '20170207 16:25:06.757', '20170207 16:25:06.757')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (30, 1, N'2016137', N'2016-11-22（二）', N'010609101532 14', NULL, NULL, NULL, N'4', N'9970303', N'90', N'276127', NULL, NULL, 1, '20170207 16:25:07.653', '20170207 16:25:07.653')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (31, 2, N'2017032', N'2017-02-08（三）', N'237', N'394', NULL, N'39,955,650', N'14682', N'1040', N'0', N'346', N'17037', N'173', 1, '20170307 09:28:17.700', '20170209 14:14:21.530')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (32, 2, N'2017031', N'2017-02-07（二）', N'376', N'579', NULL, N'39,475,188', N'17016', N'1040', N'0', N'346', N'28675', N'173', 1, '20170307 09:28:17.837', '20170209 14:14:21.670')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (33, 2, N'2017030', N'2017-02-06（一）', N'107', N'541', NULL, N'39,176,878', N'11742', N'1040', N'0', N'346', N'19374', N'173', 1, '20170307 09:28:17.987', '20170209 14:14:21.850')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (34, 2, N'2017029', N'2017-02-05（日）', N'272', N'145', NULL, N'38,513,422', N'16970', N'1040', N'23260', N'346', N'0', N'173', 1, '20170307 09:28:18.123', '20170209 14:14:21.977')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (35, 2, N'2017028', N'2017-02-04（六）', N'193', N'579', NULL, N'36,527,012', N'9881', N'1040', N'0', N'346', N'28381', N'173', 1, '20170209 14:31:47.213', '20170209 14:14:22.090')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (36, 2, N'2017027', N'2017-02-03（五）', N'873', N'150', NULL, N'33,280,928', N'11507', N'1040', N'0', N'346', N'23841', N'173', 1, '20170209 14:31:47.340', '20170209 14:14:22.197')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (37, 2, N'2017026', N'2017-01-26（四）', N'259', N'978', NULL, N'41,206,326', N'6499', N'1040', N'0', N'346', N'12258', N'173', 1, '20170209 14:31:47.460', '20170209 14:14:22.313')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (38, 2, N'2017024', N'2017-01-24（二）', N'709', N'472', NULL, N'45,068,642', N'16691', N'1040', N'0', N'346', N'24521', N'173', 1, '20170209 14:31:47.660', '20170209 14:14:22.430')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (39, 2, N'2017022', N'2017-01-22（日）', N'028', N'862', NULL, N'44,862,754', N'23428', N'1040', N'0', N'346', N'26759', N'173', 1, '20170209 14:31:47.780', '20170209 14:14:22.543')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (40, 2, N'2017021', N'2017-01-21（六）', N'854', N'616', NULL, N'43,560,544', N'11820', N'1040', N'0', N'346', N'50750', N'173', 1, '20170209 14:31:47.900', '20170209 14:14:22.660')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (41, 2, N'2017020', N'2017-01-20（五）', N'893', N'257', NULL, N'44,602,200', N'16826', N'1040', N'0', N'346', N'41599', N'173', 1, '20170209 14:31:48.017', '20170209 14:14:22.800')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (42, 2, N'2017019', N'2017-01-19（四）', N'606', N'772', NULL, N'47,163,972', N'20402', N'1040', N'19570', N'346', N'0', N'173', 1, '20170209 14:31:48.140', '20170209 14:14:22.927')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (43, 2, N'2017018', N'2017-01-18（三）', N'315', N'400', NULL, N'45,338,116', N'26849', N'1040', N'0', N'346', N'31936', N'173', 1, '20170209 14:31:48.253', '20170209 14:14:23.050')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (44, 2, N'2017017', N'2017-01-17（二）', N'817', N'923', NULL, N'44,841,668', N'37535', N'1040', N'0', N'346', N'51387', N'173', 1, '20170209 14:31:48.387', '20170209 14:14:23.197')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (45, 2, N'2017016', N'2017-01-16（一）', N'469', N'832', NULL, N'42,816,064', N'20332', N'1040', N'0', N'346', N'36967', N'173', 1, '20170209 14:31:48.573', '20170209 14:14:23.363')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (46, 2, N'2017015', N'2017-01-15（日）', N'950', N'460', NULL, N'41,649,168', N'8937', N'1040', N'0', N'346', N'24004', N'173', 1, '20170209 14:31:48.740', '20170209 14:14:23.477')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (47, 2, N'2017014', N'2017-01-14（六）', N'221', N'898', NULL, N'43,540,354', N'9180', N'1040', N'10359', N'346', N'0', N'173', 1, '20170209 14:31:48.880', '20170209 14:14:23.597')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (48, 2, N'2017013', N'2017-01-13（五）', N'582', N'991', NULL, N'45,404,526', N'17861', N'1040', N'0', N'346', N'47799', N'173', 1, '20170209 14:31:49.013', '20170209 14:14:23.733')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (49, 2, N'2017012', N'2017-01-12（四）', N'125', N'775', NULL, N'44,116,942', N'8939', N'1040', N'0', N'346', N'20329', N'173', 1, '20170209 14:31:49.127', '20170209 14:14:23.903')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (50, 2, N'2017011', N'2017-01-11（三）', N'909', N'534', NULL, N'44,494,992', N'8901', N'1040', N'10937', N'346', N'0', N'173', 1, '20170209 14:31:49.263', '20170209 14:14:24.020')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (51, 2, N'2017010', N'2017-01-10（二）', N'976', N'332', NULL, N'44,273,782', N'9235', N'1040', N'0', N'346', N'24744', N'173', 1, '20170209 14:31:49.377', '20170209 14:14:24.130')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (52, 2, N'2017009', N'2017-01-09（一）', N'202', N'754', NULL, N'46,734,400', N'13129', N'1040', N'12348', N'346', N'0', N'173', 1, '20170209 14:31:49.503', '20170209 14:14:24.250')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (53, 2, N'2017008', N'2017-01-08（日）', N'169', N'702', NULL, N'44,452,040', N'37743', N'1040', N'0', N'346', N'52484', N'173', 1, '20170209 14:31:49.627', '20170209 14:14:24.373')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (54, 2, N'2017007', N'2017-01-07（六）', N'783', N'888', NULL, N'40,703,854', N'14541', N'1040', N'0', N'346', N'37632', N'173', 1, '20170209 14:31:49.740', '20170209 14:14:24.493')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (55, 2, N'2017006', N'2017-01-06（五）', N'888', N'465', NULL, N'45,881,388', N'42818', N'1040', N'0', N'346', N'0', N'173', 1, '20170209 14:31:49.857', '20170209 14:14:24.617')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (56, 2, N'2017005', N'2017-01-05（四）', N'246', N'249', NULL, N'44,818,408', N'39722', N'1040', N'0', N'346', N'53970', N'173', 1, '20170209 14:31:49.980', '20170209 14:14:24.727')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (57, 2, N'2017004', N'2017-01-04（三）', N'317', N'546', NULL, N'43,890,190', N'11572', N'1040', N'0', N'346', N'25424', N'173', 1, '20170209 14:31:50.107', '20170209 14:14:24.870')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (58, 2, N'2017003', N'2017-01-03（二）', N'650', N'320', NULL, N'42,206,588', N'16062', N'1040', N'0', N'346', N'41742', N'173', 1, '20170209 14:31:50.233', '20170209 14:14:24.983')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (59, 3, N'2017014', N'2017-02-08', N'04 05 15 16 22 26 27 19', N'', NULL, N'5,962,156', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:06.137', '20170209 14:41:06.137')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (60, 3, N'2017013', N'2017-02-06', N'02 06 19 26 27 29 30 10', N'', NULL, N'6,263,450', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:06.270', '20170209 14:41:06.270')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (61, 3, N'2017012', N'2017-02-03', N'07 08 10 12 14 19 25 03', N'', NULL, N'7,380,058', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:06.387', '20170209 14:41:06.387')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (62, 3, N'2017011', N'2017-01-25', N'21 22 23 26 27 29 30 06', N'', NULL, N'6,550,868', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:06.600', '20170209 14:41:06.600')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (63, 3, N'2017010', N'2017-01-23', N'02 04 05 13 27 29 30 01', N'', NULL, N'8,297,188', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:06.733', '20170209 14:41:06.733')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (64, 3, N'2017009', N'2017-01-20', N'02 11 12 13 15 16 22 30', N'', NULL, N'8,367,700', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:06.860', '20170209 14:41:06.860')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (65, 3, N'2017008', N'2017-01-18', N'02 04 08 22 24 26 27 23', N'', NULL, N'6,622,474', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:06.987', '20170209 14:41:06.987')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (66, 3, N'2017007', N'2017-01-16', N'08 12 18 19 26 27 30 14', N'', NULL, N'6,975,996', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:07.120', '20170209 14:41:07.120')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (67, 3, N'2017006', N'2017-01-13', N'06 10 13 15 16 25 30 08', N'', NULL, N'8,401,624', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:07.240', '20170209 14:41:07.240')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (68, 3, N'2017005', N'2017-01-11', N'12 16 17 18 21 25 28 27', N'', NULL, N'6,557,916', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:07.373', '20170209 14:41:07.373')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (69, 3, N'2017004', N'2017-01-09', N'02 17 20 21 23 24 25 07', N'', NULL, N'7,003,948', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:07.497', '20170209 14:41:07.497')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (70, 3, N'2017003', N'2017-01-06', N'04 05 08 16 23 27 30 28', N'', NULL, N'11,499,420', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:07.713', '20170209 14:41:07.713')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (71, 3, N'2017002', N'2017-01-04', N'03 07 16 19 20 22 23 27', N'', NULL, N'7,869,066', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:07.840', '20170209 14:41:07.840')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (72, 3, N'2017001', N'2017-01-02', N'01 07 10 11 12 17 25 23', N'', NULL, N'6,844,268', N'', N'', N'', N'', N'', N'', 1, '20170209 14:41:07.980', '20170209 14:41:07.980')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (73, 4, N'2017032', N'2017-02-08', N'2 3 7', N'', NULL, N'39,955,650', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:02.977', '20170209 14:47:18.283')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (74, 4, N'2017031', N'2017-02-07', N'3 7 6', N'', NULL, N'39,475,188', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:03.140', '20170209 14:47:18.550')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (75, 4, N'2017030', N'2017-02-06', N'1 0 7', N'', NULL, N'39,176,878', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:03.263', '20170209 14:47:18.760')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (76, 4, N'2017029', N'2017-02-05', N'2 7 2', N'', NULL, N'38,513,422', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:03.433', '20170209 14:47:18.877')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (77, 4, N'2017028', N'2017-02-04', N'1 9 3', N'', NULL, N'36,527,012', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:03.597', '20170209 14:47:19')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (78, 4, N'2017027', N'2017-02-03', N'8 7 3', N'', NULL, N'33,280,928', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:03.750', '20170209 14:47:19.120')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (79, 4, N'2017026', N'2017-01-26', N'2 5 9', N'', NULL, N'41,206,326', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:03.883', '20170209 14:47:19.240')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (80, 4, N'2017025', N'2017-01-25', N'3 5 9', N'', NULL, N'43,549,888', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:04.010', '20170209 14:47:19.353')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (81, 4, N'2017024', N'2017-01-24', N'7 0 9', N'', NULL, N'45,068,642', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:04.140', '20170209 14:47:19.457')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (82, 4, N'2017023', N'2017-01-23', N'2 5 0', N'', NULL, N'44,587,890', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:04.310', '20170209 14:47:19.603')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (83, 4, N'2017022', N'2017-01-22', N'0 2 8', N'', NULL, N'44,862,754', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:04.460', '20170209 14:47:19.760')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (84, 4, N'2017021', N'2017-01-21', N'8 5 4', N'', NULL, N'43,560,544', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:04.613', '20170209 14:47:19.893')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (85, 4, N'2017020', N'2017-01-20', N'8 9 3', N'', NULL, N'44,602,200', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:05.247', '20170209 14:47:20.040')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (86, -7, N'2017019', N'2017-01-19', N'6 0 6', N'', NULL, N'47,163,972', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:05.377', '20170209 14:47:20.180')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (87, 4, N'2017018', N'2017-01-18', N'3 1 5', N'', NULL, N'45,338,116', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:05.537', '20170209 14:47:20.323')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (88, 4, N'2017017', N'2017-01-17', N'8 1 7', N'', NULL, N'44,841,668', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:05.700', '20170209 14:47:20.433')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (89, 4, N'2017016', N'2017-01-16', N'4 6 9', N'', NULL, N'42,816,064', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:05.920', '20170209 14:47:20.567')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (90, 4, N'2017015', N'2017-01-15', N'9 5 0', N'', NULL, N'41,649,168', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:06.200', '20170209 14:47:20.707')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (91, 4, N'2017014', N'2017-01-14', N'2 2 1', N'', NULL, N'43,540,354', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:06.473', '20170209 14:47:20.823')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (92, 4, N'2017013', N'2017-01-13', N'5 8 2', N'', NULL, N'45,404,526', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:06.643', '20170209 14:47:20.943')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (93, 4, N'2017012', N'2017-01-12', N'1 2 5', N'', NULL, N'44,116,942', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:06.890', '20170209 14:47:21.073')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (94, 4, N'2017011', N'2017-01-11', N'9 0 9', N'', NULL, N'44,494,992', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:07.060', '20170209 14:47:21.213')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (95, 4, N'2017010', N'2017-01-10', N'9 7 6', N'', NULL, N'44,273,782', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:07.367', '20170209 14:47:21.353')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (96, 4, N'2017009', N'2017-01-09', N'2 0 2', N'', NULL, N'46,734,400', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:07.583', '20170209 14:47:21.477')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (97, 4, N'2017008', N'2017-01-08', N'1 6 9', N'', NULL, N'44,452,040', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:07.810', '20170209 14:47:21.673')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (98, 4, N'2017007', N'2017-01-07', N'7 8 3', N'', NULL, N'40,703,854', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:08.273', '20170209 14:47:21.807')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (99, 4, N'2017006', N'2017-01-06', N'8 8 8', N'', NULL, N'45,881,388', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:08.413', '20170209 14:47:21.920')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (100, 4, N'2017005', N'2017-01-05', N'2 4 6', N'', NULL, N'4,481,840', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:08.563', '20170209 14:47:22.040')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (101, 4, N'2017004', N'2017-01-04', N'3 1 7', N'', NULL, N'43,890,190', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:08.763', '20170209 14:47:22.200')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (102, 4, N'2017003', N'2017-01-03', N'6 5 0', N'', NULL, N'42,206,588', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:08.937', '20170209 14:47:22.340')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (103, 4, N'2017002', N'2017-01-02', N'7 7 9', N'', NULL, N'42,048,806', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:09.083', '20170209 14:47:22.460')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (104, 4, N'2017001', N'2017-01-01', N'3 6 9', N'', NULL, N'40,532,262', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:09.220', '20170209 14:47:22.713')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (105, 5, N'17014', N'2017-02-08（三）', N'0408152425 02 05', N'', NULL, N'', N'1', N'10000000', N'68', N'119082', N'', N'', 1, '20170307 09:28:20.177', '20170209 14:55:10.127')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (106, 5, N'17013', N'2017-02-06（一）', N'0512173034 11 12', N'', NULL, N'', N'1', N'10000000', N'43', N'191627', N'', N'', 1, '20170307 09:28:20.320', '20170209 14:55:10.260')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (107, 5, N'17012', N'2017-02-04（六）', N'0405242635 07 12', N'', NULL, N'', N'2', N'10000000', N'48', N'188622', N'', N'', 1, '20170307 09:28:20.457', '20170209 14:55:10.390')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (108, 5, N'17011', N'2017-01-25（三）', N'0515212934 06 09', N'', NULL, N'', N'4', N'7753983', N'57', N'140980', N'', N'', 1, '20170307 09:28:20.617', '20170209 14:55:10.517')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (109, 5, N'17010', N'2017-01-23（一）', N'0410131835 01 02', N'', NULL, N'', N'7', N'6781359', N'42', N'225866', N'', N'', 1, '20170307 09:28:20.760', '20170209 14:55:10.700')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (110, 5, N'17009', N'2017-01-21（六）', N'0506081222 03 04', N'', NULL, N'', N'1', N'10000000', N'76', N'123464', N'', N'', 1, '20170307 09:28:20.893', '20170209 14:55:10.833')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (111, 5, N'17008', N'2017-01-18（三）', N'0304092532 02 04', N'', NULL, N'', N'2', N'10000000', N'48', N'183841', N'', N'', 1, '20170307 09:28:21.030', '20170209 14:55:10.977')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (112, 5, N'17007', N'2017-01-16（一）', N'0811172527 02 04', N'', NULL, N'', N'3', N'10000000', N'54', N'163945', N'', N'', 1, '20170307 09:28:21.173', '20170209 14:55:11.100')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (113, 5, N'17006', N'2017-01-14（六）', N'0406233233 05 06', N'', NULL, N'', N'13', N'6247111', N'127', N'63619', N'', N'', 1, '20170307 09:28:21.320', '20170209 14:55:11.220')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (114, 5, N'17005', N'2017-01-11（三）', N'0509202635 02 11', N'', NULL, N'', N'0', N'0', N'72', N'124767', N'', N'', 1, '20170307 09:28:21.457', '20170209 14:55:11.340')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (115, 5, N'17004', N'2017-01-09（一）', N'0508112831 06 07', N'', NULL, N'', N'4', N'8648787', N'97', N'73849', N'', N'', 1, '20170307 09:28:21.590', '20170209 14:55:11.480')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (116, 5, N'17003', N'2017-01-07（六）', N'0305061322 09 12', N'', NULL, N'', N'2', N'10000000', N'46', N'211393', N'', N'', 1, '20170307 09:28:21.723', '20170209 14:55:11.670')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (117, 5, N'17002', N'2017-01-04（三）', N'0712143134 09 11', N'', NULL, N'', N'1', N'10000000', N'112', N'94533', N'', N'', 1, '20170307 09:28:21.860', '20170209 14:55:11.823')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (118, 5, N'17001', N'2017-01-02（一）', N'0709203133 08 10', N'', NULL, N'', N'8', N'6898280', N'89', N'81529', N'', N'', 1, '20170307 09:28:21.983', '20170209 14:55:11.953')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (119, 5, N'16154', N'2016-12-31（六）', N'0616172129 04 06', N'', NULL, N'', N'10', N'6729997', N'92', N'101048', N'', N'', 1, '20170307 09:28:22.117', '20170209 14:55:12.080')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (120, 5, N'16153', N'2016-12-28（三）', N'1318252935 03 11', N'', NULL, N'', N'0', N'0', N'59', N'160380', N'', N'', 1, '20170307 09:28:22.233', '20170209 14:55:12.223')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (121, 5, N'16152', N'2016-12-26（一）', N'0817222430 05 11', N'', NULL, N'', N'3', N'9894220', N'97', N'93852', N'', N'', 1, '20170307 09:28:22.367', '20170209 14:55:12.343')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (122, 5, N'16151', N'2016-12-24（六）', N'0407111421 05 12', N'', NULL, N'', N'5', N'7764199', N'101', N'89308', N'', N'', 1, '20170307 09:28:22.490', '20170209 14:55:12.507')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (123, 5, N'16150', N'2016-12-21（三）', N'0110182429 07 10', N'', NULL, N'', N'106', N'5002840', N'2251', N'15000', N'', N'', 1, '20170307 09:28:22.633', '20170209 14:55:12.960')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (124, 5, N'16149', N'2016-12-19（一）', N'0102031233 04 09', N'', NULL, N'', N'2', N'10000000', N'96', N'73600', N'', N'', 1, '20170209 14:55:13.100', '20170209 14:55:13.100')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (125, 5, N'16148', N'2016-12-17（六）', N'0514152325 06 08', N'', NULL, N'', N'3', N'10000000', N'70', N'136062', N'', N'', 1, '20170209 14:55:13.220', '20170209 14:55:13.220')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (126, 5, N'16147', N'2016-12-14（三）', N'0719202830 04 12', N'', NULL, N'', N'22', N'5356179', N'413', N'15000', N'', N'', 1, '20170209 14:55:13.363', '20170209 14:55:13.363')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (127, 5, N'16146', N'2016-12-12（一）', N'2122252934 01 11', N'', NULL, N'', N'4', N'9377831', N'56', N'182464', N'', N'', 1, '20170209 14:55:13.483', '20170209 14:55:13.483')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (128, 5, N'16145', N'2016-12-10（六）', N'0109111728 03 08', N'', NULL, N'', N'4', N'8669836', N'224', N'24515', N'', N'', 1, '20170209 14:55:13.637', '20170209 14:55:13.637')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (129, 5, N'16144', N'2016-12-07（三）', N'0405132231 05 10', N'', NULL, N'', N'3', N'10000000', N'75', N'113410', N'', N'', 1, '20170209 14:55:13.787', '20170209 14:55:13.787')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (130, 5, N'16143', N'2016-12-05（一）', N'0406222731 06 07', N'', NULL, N'', N'3', N'10000000', N'59', N'145073', N'', N'', 1, '20170209 14:55:13.913', '20170209 14:55:13.913')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (131, 5, N'16142', N'2016-12-03（六）', N'0106172326 06 12', N'', NULL, N'', N'1', N'10000000', N'51', N'206031', N'', N'', 1, '20170209 14:55:14.030', '20170209 14:55:14.030')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (132, 5, N'16141', N'2016-11-30（三）', N'0206071928 11 12', N'', NULL, N'', N'2', N'10000000', N'91', N'105391', N'', N'', 1, '20170209 14:55:14.157', '20170209 14:55:14.157')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (133, 5, N'16140', N'2016-11-28（一）', N'1216232934 04 11', N'', NULL, N'', N'9', N'7220551', N'121', N'79106', N'', N'', 1, '20170209 14:55:14.280', '20170209 14:55:14.280')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (134, 5, N'16139', N'2016-11-26（六）', N'1321303135 01 08', N'', NULL, N'', N'1', N'10000000', N'42', N'225438', N'', N'', 1, '20170209 14:55:14.403', '20170209 14:55:14.403')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (135, 6, N'17014', N'2017-02-07', N'3 8 2 4 9 7 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:25.033', '20170209 15:00:09.050')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (136, 6, N'17013', N'2017-02-05', N'9 3 9 4 8 0 8', N'', NULL, N'11,541,002', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:25.180', '20170209 15:00:09.273')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (137, 6, N'17012', N'2017-02-03', N'7 7 7 6 8 5 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:25.320', '20170209 15:00:09.430')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (138, 6, N'17011', N'2017-01-24', N'0 6 0 7 4 7 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:25.467', '20170209 15:00:09.580')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (139, 6, N'17010', N'2017-01-22', N'0 9 7 1 8 2 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:25.633', '20170209 15:00:09.723')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (140, 6, N'17009', N'2017-01-20', N'2 0 0 9 1 0 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:25.813', '20170209 15:00:09.880')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (141, 6, N'17008', N'2017-01-17', N'1 0 0 0 2 3 4', N'', NULL, N'11,880,628', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:25.973', '20170209 15:00:10.013')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (142, 6, N'17007', N'2017-01-15', N'8 8 2 7 2 7 6', N'', NULL, N'11,811,546', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:26.117', '20170209 15:00:10.163')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (143, 6, N'17006', N'2017-01-13', N'2 0 9 0 9 0 6', N'', NULL, N'15,999,934', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:26.297', '20170209 15:00:10.330')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (144, 6, N'17005', N'2017-01-10', N'3 8 4 7 1 1 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:26.460', '20170209 15:00:10.460')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (145, 6, N'17004', N'2017-01-08', N'5 2 9 6 8 6 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:26.643', '20170209 15:00:10.623')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (146, 6, N'17003', N'2017-01-06', N'6 3 8 7 4 8 5', N'', NULL, N'17,722,534', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:26.840', '20170209 15:00:10.803')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (147, 6, N'17002', N'2017-01-03', N'4 8 7 8 7 6 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:27.523', '20170209 15:00:10.927')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (148, 6, N'17001', N'2017-01-01', N'2 5 3 5 3 8 9', N'', NULL, N'13,333,696', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:27.693', '20170209 15:00:11.060')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (149, 7, N'17032', N'2017-02-08', N'7 3 8', N'', NULL, N'13,797,572', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:33.100', '20170209 15:01:38.560')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (150, 7, N'17031', N'2017-02-07', N'5 0 2', N'', NULL, N'13,294,246', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:33.230', '20170209 15:01:38.737')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (151, 7, N'17030', N'2017-02-06', N'8 9 6', N'', NULL, N'13,122,170', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:33.353', '20170209 15:01:38.867')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (152, 7, N'17029', N'2017-02-05', N'8 0 4', N'', NULL, N'12,227,718', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:33.503', '20170209 15:01:38.983')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (153, 7, N'17028', N'2017-02-04', N'9 5 5', N'', NULL, N'12,474,730', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:33.650', '20170209 15:01:39.100')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (154, 7, N'17027', N'2017-02-03', N'3 2 5', N'', NULL, N'12,060,110', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:33.803', '20170209 15:01:39.223')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (155, 7, N'17026', N'2017-01-26', N'0 8 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:34.083', '20170209 15:01:39.337')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (156, 7, N'17025', N'2017-01-25', N'2 7 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:34.370', '20170209 15:01:39.467')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (157, 7, N'17024', N'2017-01-24', N'0 4 3', N'', NULL, N'15,089,806', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:34.573', '20170209 15:01:39.627')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (158, 7, N'17023', N'2017-01-23', N'2 3 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:34.707', '20170209 15:01:39.760')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (159, 7, N'17022', N'2017-01-22', N'6 7 7', N'', NULL, N'15,385,626', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:34.847', '20170209 15:01:39.887')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (160, 7, N'17021', N'2017-01-21', N'8 7 4', N'', NULL, N'15,109,100', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:35.030', '20170209 15:01:40.010')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (161, 7, N'17020', N'2017-01-20', N'5 2 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:35.187', '20170209 15:01:40.147')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (162, 7, N'17019', N'2017-01-19', N'8 4 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:35.410', '20170209 15:01:40.280')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (163, 7, N'17018', N'2017-01-18', N'3 9 7', N'', NULL, N'14,894,894', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:35.537', '20170209 15:01:40.397')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (164, 7, N'17017', N'2017-01-17', N'8 9 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:35.700', '20170209 15:01:40.517')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (165, 7, N'17016', N'2017-01-16', N'7 9 6', N'', NULL, N'14,769,450', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:35.827', '20170209 15:01:40.723')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (166, 7, N'17015', N'2017-01-15', N'6 8 6', N'', NULL, N'15,485,888', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:36.010', '20170209 15:01:40.850')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (167, 7, N'17014', N'2017-01-14', N'4 2 8', N'', NULL, N'15,323,270', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:36.157', '20170209 15:01:40.980')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (168, 7, N'17013', N'2017-01-13', N'0 3 9', N'', NULL, N'16,437,028', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:36.303', '20170209 15:01:41.107')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (169, 7, N'17012', N'2017-01-12', N'0 5 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:36.467', '20170209 15:01:41.240')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (170, 7, N'17011', N'2017-01-11', N'4 8 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:36.607', '20170209 15:01:41.400')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (171, 7, N'17010', N'2017-01-10', N'2 6 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:36.857', '20170209 15:01:41.640')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (172, 7, N'17009', N'2017-01-09', N'3 1 7', N'', NULL, N'15,415,862', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:37.027', '20170209 15:01:41.803')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (173, 7, N'17008', N'2017-01-08', N'5 9 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:37.203', '20170209 15:01:41.927')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (174, 7, N'17007', N'2017-01-07', N'6 9 2', N'', NULL, N'15,068,440', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:37.327', '20170209 15:01:42.067')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (175, 7, N'17006', N'2017-01-06', N'4 2 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:37.480', '20170209 15:01:42.190')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (176, 7, N'17005', N'2017-01-05', N'3 4 2', N'', NULL, N'14,745,772', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:37.633', '20170209 15:01:42.320')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (177, 7, N'17004', N'2017-01-04', N'6 1 6', N'', NULL, N'15,225,316', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:37.813', '20170209 15:01:42.440')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (178, 7, N'17003', N'2017-01-03', N'3 7 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:37.987', '20170209 15:01:42.573')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (179, 7, N'17002', N'2017-01-02', N'7 5 8', N'', NULL, N'13,402,912', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:38.280', '20170209 15:01:42.690')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (180, 7, N'17001', N'2017-01-01', N'0 9 2', N'', NULL, N'13,069,192', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:38.490', '20170209 15:01:42.820')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (181, 8, N'17032', N'2017-02-08', N'7 3 8 7 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:43.423', '20170209 15:02:53.903')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (182, 8, N'17031', N'2017-02-07', N'5 0 2 0 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:44.100', '20170209 15:02:54.040')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (183, 8, N'17030', N'2017-02-06', N'8 9 6 3 1', N'', NULL, N'8,499,088', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:44.280', '20170209 15:02:54.157')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (184, 8, N'17029', N'2017-02-05', N'8 0 4 7 8', N'', NULL, N'8,103,810', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:44.417', '20170209 15:02:54.277')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (185, 8, N'17028', N'2017-02-04', N'9 5 5 0 4', N'', NULL, N'8,281,770', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:44.563', '20170209 15:02:54.383')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (186, 8, N'17027', N'2017-02-03', N'3 2 5 3 2', N'', NULL, N'9,064,372', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:44.697', '20170209 15:02:54.507')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (187, 8, N'17026', N'2017-01-26', N'0 8 1 4 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:44.823', '20170209 15:02:54.667')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (188, 8, N'17025', N'2017-01-25', N'2 7 7 9 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:44.963', '20170209 15:02:54.807')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (189, 8, N'17024', N'2017-01-24', N'0 4 3 9 0', N'', NULL, N'9,222,296', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:45.080', '20170209 15:02:54.933')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (190, 8, N'17023', N'2017-01-23', N'2 3 7 5 2', N'', NULL, N'9,387,466', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:45.230', '20170209 15:02:55.077')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (191, 8, N'17022', N'2017-01-22', N'6 7 7 5 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:48.410', '20170209 15:02:55.213')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (192, 8, N'17021', N'2017-01-21', N'8 7 4 9 1', N'', NULL, N'9,379,838', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:48.537', '20170209 15:02:55.337')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (193, 8, N'17020', N'2017-01-20', N'5 2 6 1 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:48.673', '20170209 15:02:55.470')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (194, 8, N'17019', N'2017-01-19', N'8 4 4 9 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:48.837', '20170209 15:02:55.633')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (195, 8, N'17018', N'2017-01-18', N'3 9 7 9 5', N'', NULL, N'9,487,192', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:48.990', '20170209 15:02:55.897')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (196, 8, N'17017', N'2017-01-17', N'8 9 7 6 2', N'', NULL, N'9,473,472', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:49.150', '20170209 15:02:56.047')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (197, 8, N'17016', N'2017-01-16', N'7 9 6 3 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:49.297', '20170209 15:02:56.180')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (198, 8, N'17015', N'2017-01-15', N'6 8 6 0 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:49.463', '20170209 15:02:56.300')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (199, 8, N'17014', N'2017-01-14', N'4 2 8 3 6', N'', NULL, N'9,313,702', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:49.720', '20170209 15:02:56.410')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (200, 8, N'17013', N'2017-01-13', N'0 3 9 6 4', N'', NULL, N'10,781,964', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:49.890', '20170209 15:02:56.517')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (201, 8, N'17012', N'2017-01-12', N'0 5 9 9 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:50.037', '20170209 15:02:56.643')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (202, 8, N'17011', N'2017-01-11', N'4 8 6 8 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:50.237', '20170209 15:02:56.770')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (203, 8, N'17010', N'2017-01-10', N'2 6 1 5 8', N'', NULL, N'9,400,702', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:50.397', '20170209 15:02:56.893')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (204, 8, N'17009', N'2017-01-09', N'3 1 7 8 4', N'', NULL, N'9,463,810', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:50.550', '20170209 15:02:57.020')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (205, 8, N'17008', N'2017-01-08', N'5 9 7 0 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:50.683', '20170209 15:02:57.143')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (206, 8, N'17007', N'2017-01-07', N'6 9 2 8 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:50.833', '20170209 15:02:57.260')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (207, 8, N'17006', N'2017-01-06', N'4 2 6 7 0', N'', NULL, N'10,346,700', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:50.970', '20170209 15:02:57.370')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (208, 8, N'17005', N'2017-01-05', N'3 4 2 3 0', N'', NULL, N'9,476,036', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:51.127', '20170209 15:02:57.503')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (209, 8, N'17004', N'2017-01-04', N'6 1 6 6 0', N'', NULL, N'9,652,330', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:51.280', '20170209 15:02:57.727')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (210, 8, N'17003', N'2017-01-03', N'3 7 4 0 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:51.430', '20170209 15:02:57.880')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (211, 8, N'17002', N'2017-01-02', N'7 5 8 5 5', N'', NULL, N'9,033,268', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:51.577', '20170209 15:02:58.030')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (212, 8, N'17001', N'2017-01-01', N'0 9 2 3 1', N'', NULL, N'8,661,696', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:51.730', '20170209 15:02:58.193')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (213, 9, N'17016', N'2017-02-09', N'3 0 0 1 1 3 0 3 3 3 3 * 0 1', N'', NULL, N'12,420,280', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:54.487', '20170209 15:03:51.497')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (214, 9, N'17015', N'2017-02-06', N'3 0 3 3 1 3 1 0 0 3 3 3 * 0', N'', NULL, N'20,886,804', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:54.653', '20170209 15:03:51.670')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (215, 9, N'17014', N'2017-02-05', N'0 3 3 0 3 3 3 3 3 1 3 3 3 3', N'', NULL, N'24,964,000', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:54.787', '20170209 15:03:51.803')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (216, 9, N'17013', N'2017-02-04', N'3 3 3 3 * 3 3 1 3 3 1 0 1 1', N'', NULL, N'8,142,950', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:54.943', '20170209 15:03:51.933')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (217, 9, N'17012', N'2017-02-03', N'3 1 1 3 3 3 0 1 3 3 3 3 0 1', N'', NULL, N'6,954,322', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:55.067', '20170209 15:03:52.087')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (218, 9, N'17011', N'2017-02-03', N'3 3 0 0 0 0 1 1 0 3 1 3 0 0', N'', NULL, N'10,133,672', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:55.187', '20170209 15:03:52.223')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (219, 9, N'17010', N'2017-02-03', N'0 3 0 3 1 3 1 3 0 3 1 1 3 0', N'', NULL, N'4,583,780', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:55.420', '20170209 15:03:52.347')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (220, 9, N'17009', N'2017-01-23', N'3 3 1 3 3 1 0 0 3 3 1 1 3 0', N'', NULL, N'27,546,744', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:55.560', '20170209 15:03:52.480')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (221, 9, N'17008', N'2017-01-22', N'1 0 0 1 3 1 0 3 1 3 0 3 0 0', N'', NULL, N'18,680,386', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:55.680', '20170209 15:03:52.650')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (222, 9, N'17007', N'2017-01-21', N'0 1 1 3 0 0 3 1 * 3 1 0 3 3', N'', NULL, N'13,909,432', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:55.817', '20170209 15:03:52.783')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (223, 9, N'17006', N'2017-01-16', N'3 1 3 3 1 0 3 3 3 1 0 3 1 0', N'', NULL, N'23,278,356', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:55.957', '20170209 15:03:52.903')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (224, 9, N'17005', N'2017-01-15', N'3 3 0 0 1 3 0 0 3 0 1 3 3 1', N'', NULL, N'18,387,532', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:56.100', '20170209 15:03:53.023')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (225, 9, N'17004', N'2017-01-14', N'1 3 3 1 0 1 0 0 0 0 1 0 1 3', N'', NULL, N'6,787,162', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:56.497', '20170209 15:03:53.137')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (226, 9, N'17003', N'2017-01-09', N'1 3 3 3 0 0 * 3 1 3 3 3 1 3', N'', NULL, N'31,062,764', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:56.663', '20170209 15:03:53.247')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (227, 9, N'17002', N'2017-01-08', N'0 3 3 1 0 1 0 3 0 3 3 0 0 3', N'', NULL, N'22,268,552', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:56.827', '20170209 15:03:53.353')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (228, 9, N'17001', N'2017-01-04', N'3 3 1 3 0 1 0 3 0 3 0 0 3 0', N'', NULL, N'20,405,530', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:56.953', '20170209 15:03:53.473')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (229, 9, N'16199', N'2017-01-02', N'3 3 3 3 0 0 3 3 1 1 1 1 0 1', N'', NULL, N'17,946,458', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:57.097', '20170209 15:03:53.630')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (230, 10, N'17016', N'2017-02-09', N'3 0 0 1 1 3 0 3 3 3 3 * 0 1', N'', NULL, N'13,361,360', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:00.340', '20170209 15:04:44.237')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (231, 10, N'17015', N'2017-02-06', N'3 0 3 3 1 3 1 0 0 3 3 3 * 0', N'', NULL, N'15,073,050', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:00.503', '20170209 15:04:44.353')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (232, 10, N'17014', N'2017-02-05', N'0 3 3 0 3 3 3 3 3 1 3 3 3 3', N'', NULL, N'15,337,408', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:00.643', '20170209 15:04:44.470')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (233, 10, N'17013', N'2017-02-04', N'3 3 3 3 * 3 3 1 3 3 1 0 1 1', N'', NULL, N'9,271,072', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:00.780', '20170209 15:04:44.603')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (234, 10, N'17012', N'2017-02-03', N'3 1 1 3 3 3 0 1 3 3 3 3 0 1', N'', NULL, N'6,308,240', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:00.937', '20170209 15:04:44.790')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (235, 10, N'17011', N'2017-02-03', N'3 3 0 0 0 0 1 1 0 3 1 3 0 0', N'', NULL, N'6,830,056', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:01.080', '20170209 15:04:44.920')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (236, 10, N'17010', N'2017-02-03', N'0 3 0 3 1 3 1 3 0 3 1 1 3 0', N'', NULL, N'7,094,856', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:01.260', '20170209 15:04:45.040')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (237, 10, N'17009', N'2017-01-23', N'3 3 1 3 3 1 0 0 3 3 1 1 3 0', N'', NULL, N'17,326,804', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:01.387', '20170209 15:04:45.170')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (238, 10, N'17008', N'2017-01-22', N'1 0 0 1 3 1 0 3 1 3 0 3 0 0', N'', NULL, N'15,615,842', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:01.560', '20170209 15:04:45.297')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (239, 10, N'17007', N'2017-01-21', N'0 1 1 3 0 0 3 1 * 3 1 0 3 3', N'', NULL, N'15,326,612', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:01.730', '20170209 15:04:45.430')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (240, 10, N'17006', N'2017-01-16', N'3 1 3 3 1 0 3 3 3 1 0 3 1 0', N'', NULL, N'18,293,156', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:01.883', '20170209 15:04:45.553')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (241, 10, N'17005', N'2017-01-15', N'3 3 0 0 1 3 0 0 3 0 1 3 3 1', N'', NULL, N'16,803,056', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:02.023', '20170209 15:04:45.677')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (242, 10, N'17004', N'2017-01-14', N'1 3 3 1 0 1 0 0 0 0 1 0 1 3', N'', NULL, N'15,138,792', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:02.153', '20170209 15:04:45.797')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (243, 10, N'17003', N'2017-01-09', N'1 3 3 3 0 0 * 3 1 3 3 3 1 3', N'', NULL, N'13,493,182', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:02.273', '20170209 15:04:45.940')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (244, 10, N'17002', N'2017-01-08', N'0 3 3 1 0 1 0 3 0 3 3 0 0 3', N'', NULL, N'16,111,602', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:02.420', '20170209 15:04:46.050')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (245, 10, N'17001', N'2017-01-04', N'3 3 1 3 0 1 0 3 0 3 0 0 3 0', N'', NULL, N'18,155,172', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:02.570', '20170209 15:04:46.163')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (246, 10, N'16199', N'2017-01-02', N'3 3 3 3 0 0 3 3 1 1 1 1 0 1', N'', NULL, N'15,133,662', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:02.687', '20170209 15:04:46.280')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (247, 11, N'17016', N'2017-02-09', N'3 0 0 2 0 1 2 1', N'', NULL, N'693,946', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:05.373', '20170209 15:05:34.510')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (248, 11, N'17015', N'2017-02-06', N'0 0 1 1 2 3 1 0', N'', NULL, N'1,615,066', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:05.540', '20170209 15:05:34.660')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (249, 11, N'17014', N'2017-02-05', N'0 3 3 3 2 0 1 3', N'', NULL, N'478,424', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:05.687', '20170209 15:05:34.790')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (250, 11, N'17013', N'2017-02-04', N'2 1 1 1 3 2 2 0', N'', NULL, N'335,728', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:05.847', '20170209 15:05:34.927')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (251, 11, N'17012', N'2017-02-03', N'1 1 2 1 0 2 1 1', N'', NULL, N'205,330', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:06.003', '20170209 15:05:35.100')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (252, 11, N'17011', N'2017-02-03', N'2 1 1 2 1 2 2 3', N'', NULL, N'225,624', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:06.160', '20170209 15:05:35.250')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (253, 11, N'17010', N'2017-02-03', N'1 1 3 2 0 1 2 1', N'', NULL, N'240,392', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:06.310', '20170209 15:05:35.370')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (254, 11, N'17009', N'2017-01-23', N'2 0 1 0 0 1 1 0', N'', NULL, N'687,062', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:06.437', '20170209 15:05:35.497')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (255, 11, N'17008', N'2017-01-22', N'2 2 0 1 1 1 2 2', N'', NULL, N'634,210', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:06.573', '20170209 15:05:35.627')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (256, 11, N'17007', N'2017-01-21', N'1 0 1 2 0 2 2 1', N'', NULL, N'428,718', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:06.747', '20170209 15:05:35.757')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (257, 11, N'17006', N'2017-01-16', N'2 1 3 1 0 1 2 1', N'', NULL, N'948,898', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:06.883', '20170209 15:05:35.877')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (258, 11, N'17005', N'2017-01-15', N'1 0 3 1 1 3 0 3', N'', NULL, N'579,626', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:07.110', '20170209 15:05:36')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (259, 11, N'17004', N'2017-01-14', N'2 0 1 0 2 2 1 2', N'', NULL, N'428,430', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:07.270', '20170209 15:05:36.130')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (260, 11, N'17003', N'2017-01-09', N'0 1 1 0 1 0 3 0', N'', NULL, N'909,756', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:07.420', '20170209 15:05:36.260')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (261, 11, N'17002', N'2017-01-08', N'1 2 2 0 2 2 1 2', N'', NULL, N'580,808', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:07.567', '20170209 15:05:36.390')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (262, 11, N'17001', N'2017-01-03', N'3 0 2 1 2 2 0 2', N'', NULL, N'1,081,680', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:07.690', '20170209 15:05:36.510')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (263, 11, N'16205', N'2017-01-01', N'3 2 1 0 2 1 1 0', N'', NULL, N'1,002,804', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:07.827', '20170209 15:05:36.640')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (264, 12, N'17016', N'2017-02-09', N'3 3 1 0 1 0 0 0 3 3 1 3', N'', NULL, N'53,984', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:10.723', '20170209 15:06:32.130')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (265, 12, N'17015', N'2017-02-06', N'1 1 3 3 1 1 0 0 1 0 3 3', N'', NULL, N'35,274', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:10.850', '20170209 15:06:32.300')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (266, 12, N'17014', N'2017-02-05', N'0 0 3 3 3 3 0 0 3 3 3 3', N'', NULL, N'397,392', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:11', '20170209 15:06:32.457')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (267, 12, N'17013', N'2017-02-04', N'3 3 3 1 0 3 1 3 1 1 1 0', N'', NULL, N'148,556', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:11.153', '20170209 15:06:32.633')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (268, 12, N'17012', N'2017-02-03', N'3 1 1 3 1 3 1 3 0 0 0 1', N'', NULL, N'42,330', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:11.300', '20170209 15:06:32.810')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (269, 12, N'17011', N'2017-02-03', N'3 3 1 3 0 0 1 0 0 0 3 0', N'', NULL, N'54,704', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:11.460', '20170209 15:06:32.983')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (270, 12, N'17010', N'2017-02-03', N'1 1 3 3 1 0 3 3 3 1 1 1', N'', NULL, N'57,278', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:11.590', '20170209 15:06:33.157')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (271, 12, N'17009', N'2017-01-23', N'3 3 1 3 3 1 0 0 1 0 1 3', N'', NULL, N'76,508', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:11.720', '20170209 15:06:33.340')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (272, 12, N'17008', N'2017-01-22', N'0 1 1 0 0 0 3 1 3 3 1 1', N'', NULL, N'25,626', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:11.873', '20170209 15:06:33.507')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (273, 12, N'17007', N'2017-01-21', N'1 3 0 0 0 0 3 3 3 1 * *', N'', NULL, N'14,762', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:12.033', '20170209 15:06:33.670')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (274, 12, N'17006', N'2017-01-16', N'1 3 1 3 1 1 0 0 3 3 3 3', N'', NULL, N'109,506', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:12.167', '20170209 15:06:33.827')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (275, 12, N'17005', N'2017-01-15', N'1 3 1 3 0 0 0 0 1 1 1 3', N'', NULL, N'28,274', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:12.303', '20170209 15:06:33.950')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (276, 12, N'17004', N'2017-01-14', N'3 3 1 3 0 1 1 0 1 1 0 0', N'', NULL, N'16,194', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:12.457', '20170209 15:06:34.093')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (277, 12, N'17003', N'2017-01-09', N'0 0 * * 1 3 1 1 1 3 3 3', N'', NULL, N'327,992', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:12.640', '20170209 15:06:34.227')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (278, 12, N'17002', N'2017-01-08', N'1 0 1 3 3 3 0 1 1 1 3 0', N'', NULL, N'79,570', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:12.780', '20170209 15:06:34.347')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (279, 12, N'17001', N'2017-01-04', N'1 3 1 3 1 1 0 3 1 0 3 1', N'', NULL, N'74,220', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:12.933', '20170209 15:06:34.470')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (280, 12, N'16205', N'2017-01-01', N'3 3 3 3 3 3 1 3 0 0 3 3', N'', NULL, N'55,164', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:13.163', '20170209 15:06:34.630')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (281, 14, N'17020878', N'2017-02-08', N'09 03 01 10 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:55.873', '20170209 15:12:55.873')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (282, 14, N'17020877', N'2017-02-08', N'10 02 04 11 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:56.140', '20170209 15:12:56.140')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (283, 14, N'17020876', N'2017-02-08', N'08 10 11 03 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:56.273', '20170209 15:12:56.273')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (284, 14, N'17020875', N'2017-02-08', N'07 08 11 10 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:56.387', '20170209 15:12:56.387')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (285, 14, N'17020874', N'2017-02-08', N'02 03 10 09 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:57.327', '20170209 15:12:57.327')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (286, 14, N'17020873', N'2017-02-08', N'03 08 10 07 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:57.447', '20170209 15:12:57.447')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (287, 14, N'17020872', N'2017-02-08', N'02 01 05 09 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:57.563', '20170209 15:12:57.563')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (288, 14, N'17020871', N'2017-02-08', N'03 10 09 11 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:57.683', '20170209 15:12:57.683')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (289, 14, N'17020870', N'2017-02-08', N'08 06 02 04 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:57.793', '20170209 15:12:57.793')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (290, 14, N'17020869', N'2017-02-08', N'10 09 05 03 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:57.917', '20170209 15:12:57.917')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (291, 14, N'17020868', N'2017-02-08', N'04 03 02 08 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:58.083', '20170209 15:12:58.083')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (292, 14, N'17020867', N'2017-02-08', N'07 05 11 04 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:58.200', '20170209 15:12:58.200')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (293, 14, N'17020866', N'2017-02-08', N'07 02 05 06 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:58.333', '20170209 15:12:58.333')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (294, 14, N'17020865', N'2017-02-08', N'06 10 09 07 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:58.480', '20170209 15:12:58.480')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (295, 14, N'17020864', N'2017-02-08', N'01 10 08 07 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:58.597', '20170209 15:12:58.597')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (296, 14, N'17020863', N'2017-02-08', N'09 04 03 11 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:58.740', '20170209 15:12:58.740')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (297, 14, N'17020862', N'2017-02-08', N'02 09 01 07 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:12:58.863', '20170209 15:12:58.863')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (298, 14, N'17020861', N'2017-02-08', N'03 07 04 10 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:00.137', '20170209 15:13:00.137')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (299, 14, N'17020860', N'2017-02-08', N'10 09 06 11 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:00.257', '20170209 15:13:00.257')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (300, 14, N'17020859', N'2017-02-08', N'02 09 08 01 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:00.377', '20170209 15:13:00.377')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (301, 14, N'17020858', N'2017-02-08', N'01 02 09 04 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:00.493', '20170209 15:13:00.493')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (302, 14, N'17020857', N'2017-02-08', N'11 10 01 09 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:00.600', '20170209 15:13:00.600')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (303, 14, N'17020856', N'2017-02-08', N'03 06 05 08 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:00.717', '20170209 15:13:00.717')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (304, 14, N'17020855', N'2017-02-08', N'03 10 04 02 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:00.830', '20170209 15:13:00.830')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (305, 14, N'17020854', N'2017-02-08', N'05 08 04 01 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:00.970', '20170209 15:13:00.970')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (306, 14, N'17020853', N'2017-02-08', N'06 03 11 01 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:01.200', '20170209 15:13:01.200')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (307, 14, N'17020852', N'2017-02-08', N'10 02 01 04 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:01.320', '20170209 15:13:01.320')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (308, 14, N'17020851', N'2017-02-08', N'06 04 07 09 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:01.500', '20170209 15:13:01.500')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (309, 14, N'17020850', N'2017-02-08', N'03 05 09 07 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:01.620', '20170209 15:13:01.620')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (310, 14, N'17020849', N'2017-02-08', N'07 08 10 01 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:01.773', '20170209 15:13:01.773')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (311, 14, N'17020848', N'2017-02-08', N'04 08 02 03 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:01.900', '20170209 15:13:01.900')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (312, 14, N'17020847', N'2017-02-08', N'02 04 09 07 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:02.033', '20170209 15:13:02.033')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (313, 14, N'17020846', N'2017-02-08', N'01 10 02 08 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:02.203', '20170209 15:13:02.203')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (314, 14, N'17020845', N'2017-02-08', N'11 01 08 02 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:02.403', '20170209 15:13:02.403')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (315, 14, N'17020844', N'2017-02-08', N'02 03 04 01 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:02.557', '20170209 15:13:02.557')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (316, 14, N'17020843', N'2017-02-08', N'04 09 10 06 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:02.683', '20170209 15:13:02.683')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (317, 14, N'17020842', N'2017-02-08', N'09 04 07 05 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:02.867', '20170209 15:13:02.867')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (318, 14, N'17020841', N'2017-02-08', N'07 04 11 05 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:03.007', '20170209 15:13:03.007')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (319, 14, N'17020840', N'2017-02-08', N'05 07 01 11 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:03.137', '20170209 15:13:03.137')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (320, 14, N'17020839', N'2017-02-08', N'03 10 11 04 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:03.320', '20170209 15:13:03.320')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (321, 14, N'17020838', N'2017-02-08', N'08 11 06 10 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:03.453', '20170209 15:13:03.453')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (322, 14, N'17020837', N'2017-02-08', N'03 11 01 07 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:03.577', '20170209 15:13:03.577')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (323, 14, N'17020836', N'2017-02-08', N'09 10 07 02 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:03.707', '20170209 15:13:03.707')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (324, 14, N'17020835', N'2017-02-08', N'08 10 11 05 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:03.843', '20170209 15:13:03.843')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (325, 14, N'17020834', N'2017-02-08', N'11 02 09 07 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:04', '20170209 15:13:04')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (326, 14, N'17020833', N'2017-02-08', N'01 04 03 10 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:04.143', '20170209 15:13:04.143')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (327, 14, N'17020832', N'2017-02-08', N'06 02 10 08 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:04.260', '20170209 15:13:04.260')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (328, 14, N'17020831', N'2017-02-08', N'09 03 04 10 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:04.417', '20170209 15:13:04.417')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (329, 14, N'17020830', N'2017-02-08', N'03 02 10 05 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:04.537', '20170209 15:13:04.537')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (330, 14, N'17020829', N'2017-02-08', N'08 07 06 05 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:04.653', '20170209 15:13:04.653')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (331, 14, N'17020828', N'2017-02-08', N'08 05 03 06 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:04.790', '20170209 15:13:04.790')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (332, 14, N'17020827', N'2017-02-08', N'01 10 08 05 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:04.917', '20170209 15:13:04.917')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (333, 14, N'17020826', N'2017-02-08', N'07 09 01 05 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:05.077', '20170209 15:13:05.077')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (334, 14, N'17020825', N'2017-02-08', N'02 03 10 01 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:05.187', '20170209 15:13:05.187')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (335, 14, N'17020824', N'2017-02-08', N'10 05 08 06 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:05.297', '20170209 15:13:05.297')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (336, 14, N'17020823', N'2017-02-08', N'08 06 07 03 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:05.413', '20170209 15:13:05.413')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (337, 14, N'17020822', N'2017-02-08', N'03 07 08 04 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:05.530', '20170209 15:13:05.530')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (338, 14, N'17020821', N'2017-02-08', N'04 01 10 09 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:05.650', '20170209 15:13:05.650')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (339, 14, N'17020820', N'2017-02-08', N'02 09 07 05 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:05.770', '20170209 15:13:05.770')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (340, 14, N'17020819', N'2017-02-08', N'08 01 10 11 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:05.887', '20170209 15:13:05.887')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (341, 14, N'17020818', N'2017-02-08', N'04 03 01 08 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:06.053', '20170209 15:13:06.053')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (342, 14, N'17020817', N'2017-02-08', N'05 09 08 03 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:06.183', '20170209 15:13:06.183')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (343, 14, N'17020816', N'2017-02-08', N'10 08 06 09 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:06.320', '20170209 15:13:06.320')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (344, 14, N'17020815', N'2017-02-08', N'02 03 07 08 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:06.447', '20170209 15:13:06.447')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (345, 14, N'17020814', N'2017-02-08', N'07 09 10 04 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:06.570', '20170209 15:13:06.570')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (346, 14, N'17020813', N'2017-02-08', N'11 05 08 06 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:06.697', '20170209 15:13:06.697')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (347, 14, N'17020812', N'2017-02-08', N'03 07 04 02 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:06.890', '20170209 15:13:06.890')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (348, 14, N'17020811', N'2017-02-08', N'04 06 08 03 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:07.060', '20170209 15:13:07.060')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (349, 14, N'17020810', N'2017-02-08', N'11 09 07 08 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:07.197', '20170209 15:13:07.197')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (350, 14, N'17020809', N'2017-02-08', N'11 04 05 03 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:07.333', '20170209 15:13:07.333')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (351, 14, N'17020808', N'2017-02-08', N'01 09 04 05 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:07.500', '20170209 15:13:07.500')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (352, 14, N'17020807', N'2017-02-08', N'04 11 03 06 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:07.700', '20170209 15:13:07.700')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (353, 14, N'17020806', N'2017-02-08', N'07 10 03 01 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:07.817', '20170209 15:13:07.817')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (354, 14, N'17020805', N'2017-02-08', N'09 05 04 08 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:07.933', '20170209 15:13:07.933')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (355, 14, N'17020804', N'2017-02-08', N'10 11 07 03 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:08.153', '20170209 15:13:08.153')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (356, 14, N'17020803', N'2017-02-08', N'05 03 04 10 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:08.290', '20170209 15:13:08.290')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (357, 14, N'17020802', N'2017-02-08', N'01 09 05 03 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:08.417', '20170209 15:13:08.417')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (358, 14, N'17020801', N'2017-02-08', N'11 08 05 07 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:08.560', '20170209 15:13:08.560')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (359, 15, N'20170208120', N'2017-02-09', N'7 5 7 7 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:56.760', '20170209 15:13:56.760')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (360, 15, N'20170208119', N'2017-02-08', N'8 9 8 4 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:56.923', '20170209 15:13:56.923')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (361, 15, N'20170208118', N'2017-02-08', N'6 1 8 3 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:57.060', '20170209 15:13:57.060')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (362, 15, N'20170208117', N'2017-02-08', N'3 9 0 2 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:57.203', '20170209 15:13:57.203')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (363, 15, N'20170208116', N'2017-02-08', N'8 3 7 3 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:57.340', '20170209 15:13:57.340')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (364, 15, N'20170208115', N'2017-02-08', N'5 1 3 4 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:57.460', '20170209 15:13:57.460')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (365, 15, N'20170208114', N'2017-02-08', N'7 3 8 1 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:57.593', '20170209 15:13:57.593')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (366, 15, N'20170208113', N'2017-02-08', N'2 5 6 4 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:57.717', '20170209 15:13:57.717')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (367, 15, N'20170208112', N'2017-02-08', N'3 2 7 8 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:57.833', '20170209 15:13:57.833')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (368, 15, N'20170208111', N'2017-02-08', N'4 8 1 5 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:57.983', '20170209 15:13:57.983')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (369, 15, N'20170208110', N'2017-02-08', N'6 0 1 4 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:58.110', '20170209 15:13:58.110')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (370, 15, N'20170208109', N'2017-02-08', N'5 3 2 0 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:58.247', '20170209 15:13:58.247')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (371, 15, N'20170208108', N'2017-02-08', N'9 0 8 3 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:58.383', '20170209 15:13:58.383')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (372, 15, N'20170208107', N'2017-02-08', N'4 8 2 7 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:58.520', '20170209 15:13:58.520')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (373, 15, N'20170208106', N'2017-02-08', N'6 7 2 8 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:58.660', '20170209 15:13:58.660')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (374, 15, N'20170208105', N'2017-02-08', N'5 4 9 8 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:58.780', '20170209 15:13:58.780')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (375, 15, N'20170208104', N'2017-02-08', N'1 8 0 1 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:58.900', '20170209 15:13:58.900')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (376, 15, N'20170208103', N'2017-02-08', N'3 2 8 9 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:59.063', '20170209 15:13:59.063')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (377, 15, N'20170208102', N'2017-02-08', N'3 2 8 9 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:59.210', '20170209 15:13:59.210')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (378, 15, N'20170208101', N'2017-02-08', N'5 7 2 4 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:59.347', '20170209 15:13:59.347')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (379, 15, N'20170208100', N'2017-02-08', N'9 7 8 7 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:59.480', '20170209 15:13:59.480')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (380, 15, N'20170208099', N'2017-02-08', N'9 7 2 0 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:59.607', '20170209 15:13:59.607')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (381, 15, N'20170208098', N'2017-02-08', N'8 2 7 3 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:59.743', '20170209 15:13:59.743')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (382, 15, N'20170208097', N'2017-02-08', N'3 3 1 2 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:13:59.867', '20170209 15:13:59.867')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (383, 15, N'20170208096', N'2017-02-08', N'2 3 1 0 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:00.010', '20170209 15:14:00.010')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (384, 15, N'20170208095', N'2017-02-08', N'6 2 6 4 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:00.120', '20170209 15:14:00.120')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (385, 15, N'20170208094', N'2017-02-08', N'3 6 3 7 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:00.237', '20170209 15:14:00.237')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (386, 15, N'20170208093', N'2017-02-08', N'4 6 0 7 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:00.370', '20170209 15:14:00.370')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (387, 15, N'20170208092', N'2017-02-08', N'4 4 6 2 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:00.567', '20170209 15:14:00.567')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (388, 15, N'20170208091', N'2017-02-08', N'8 7 0 3 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:00.680', '20170209 15:14:00.680')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (389, 15, N'20170208090', N'2017-02-08', N'0 2 1 8 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:00.807', '20170209 15:14:00.807')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (390, 15, N'20170208089', N'2017-02-08', N'9 8 7 6 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:00.947', '20170209 15:14:00.947')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (391, 15, N'20170208088', N'2017-02-08', N'9 9 1 5 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:01.090', '20170209 15:14:01.090')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (392, 15, N'20170208087', N'2017-02-08', N'1 3 3 3 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:01.220', '20170209 15:14:01.220')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (393, 15, N'20170208086', N'2017-02-08', N'4 7 3 1 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:01.357', '20170209 15:14:01.357')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (394, 15, N'20170208085', N'2017-02-08', N'0 7 3 6 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:02.013', '20170209 15:14:02.013')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (395, 15, N'20170208084', N'2017-02-08', N'4 4 1 0 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:02.147', '20170209 15:14:02.147')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (396, 15, N'20170208083', N'2017-02-08', N'5 2 2 6 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:02.267', '20170209 15:14:02.267')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (397, 15, N'20170208082', N'2017-02-08', N'6 5 3 2 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:02.390', '20170209 15:14:02.390')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (398, 15, N'20170208081', N'2017-02-08', N'0 3 3 7 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:02.530', '20170209 15:14:02.530')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (399, 15, N'20170208080', N'2017-02-08', N'6 0 6 2 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:02.657', '20170209 15:14:02.657')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (400, 15, N'20170208079', N'2017-02-08', N'0 1 2 2 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:02.787', '20170209 15:14:02.787')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (401, 15, N'20170208078', N'2017-02-08', N'4 7 8 7 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:02.920', '20170209 15:14:02.920')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (402, 15, N'20170208077', N'2017-02-08', N'2 3 8 0 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:03.047', '20170209 15:14:03.047')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (403, 15, N'20170208076', N'2017-02-08', N'9 6 6 0 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:03.183', '20170209 15:14:03.183')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (404, 15, N'20170208075', N'2017-02-08', N'5 9 3 1 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:04.520', '20170209 15:14:04.520')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (405, 15, N'20170208074', N'2017-02-08', N'0 3 4 1 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:04.650', '20170209 15:14:04.650')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (406, 15, N'20170208073', N'2017-02-08', N'3 1 0 9 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:04.797', '20170209 15:14:04.797')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (407, 15, N'20170208072', N'2017-02-08', N'8 1 1 6 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:05.013', '20170209 15:14:05.013')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (408, 15, N'20170208071', N'2017-02-08', N'5 9 2 5 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:05.140', '20170209 15:14:05.140')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (409, 15, N'20170208070', N'2017-02-08', N'5 8 6 9 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:05.270', '20170209 15:14:05.270')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (410, 15, N'20170208069', N'2017-02-08', N'5 9 8 3 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:05.387', '20170209 15:14:05.387')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (411, 15, N'20170208068', N'2017-02-08', N'1 8 4 0 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:05.517', '20170209 15:14:05.517')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (412, 15, N'20170208067', N'2017-02-08', N'2 1 1 3 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:05.647', '20170209 15:14:05.647')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (413, 15, N'20170208066', N'2017-02-08', N'1 8 8 7 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:05.763', '20170209 15:14:05.763')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (414, 15, N'20170208065', N'2017-02-08', N'9 9 8 9 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:05.947', '20170209 15:14:05.947')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (415, 15, N'20170208064', N'2017-02-08', N'8 1 5 2 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:06.167', '20170209 15:14:06.167')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (416, 15, N'20170208063', N'2017-02-08', N'4 1 9 5 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:06.427', '20170209 15:14:06.427')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (417, 15, N'20170208062', N'2017-02-08', N'7 9 9 6 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:06.567', '20170209 15:14:06.567')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (418, 15, N'20170208061', N'2017-02-08', N'5 3 6 4 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:06.707', '20170209 15:14:06.707')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (419, 15, N'20170208060', N'2017-02-08', N'5 1 5 0 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:06.817', '20170209 15:14:06.817')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (420, 15, N'20170208059', N'2017-02-08', N'4 1 3 4 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:06.943', '20170209 15:14:06.943')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (421, 15, N'20170208058', N'2017-02-08', N'1 9 5 6 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:07.090', '20170209 15:14:07.090')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (422, 15, N'20170208057', N'2017-02-08', N'7 0 9 4 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:07.220', '20170209 15:14:07.220')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (423, 15, N'20170208056', N'2017-02-08', N'4 1 2 3 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:07.343', '20170209 15:14:07.343')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (424, 15, N'20170208055', N'2017-02-08', N'8 4 7 5 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:07.463', '20170209 15:14:07.463')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (425, 15, N'20170208054', N'2017-02-08', N'7 8 9 3 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:07.593', '20170209 15:14:07.593')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (426, 15, N'20170208053', N'2017-02-08', N'9 0 3 3 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:10.747', '20170209 15:14:10.747')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (427, 15, N'20170208052', N'2017-02-08', N'8 0 0 3 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:10.873', '20170209 15:14:10.873')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (428, 15, N'20170208051', N'2017-02-08', N'7 6 4 1 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:10.990', '20170209 15:14:10.990')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (429, 15, N'20170208050', N'2017-02-08', N'9 5 9 2 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:11.137', '20170209 15:14:11.137')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (430, 15, N'20170208049', N'2017-02-08', N'3 9 3 9 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:11.253', '20170209 15:14:11.253')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (431, 15, N'20170208048', N'2017-02-08', N'8 0 7 9 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:11.357', '20170209 15:14:11.357')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (432, 15, N'20170208047', N'2017-02-08', N'9 4 5 0 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:11.463', '20170209 15:14:11.463')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (433, 15, N'20170208046', N'2017-02-08', N'0 6 0 3 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:11.577', '20170209 15:14:11.577')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (434, 15, N'20170208045', N'2017-02-08', N'9 6 8 2 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:11.703', '20170209 15:14:11.703')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (435, 15, N'20170208044', N'2017-02-08', N'6 6 3 5 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:11.847', '20170209 15:14:11.847')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (436, 15, N'20170208043', N'2017-02-08', N'5 9 1 2 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:11.973', '20170209 15:14:11.973')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (437, 15, N'20170208042', N'2017-02-08', N'1 8 7 7 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:12.087', '20170209 15:14:12.087')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (438, 15, N'20170208041', N'2017-02-08', N'0 4 3 5 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:12.227', '20170209 15:14:12.227')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (439, 15, N'20170208040', N'2017-02-08', N'6 6 6 2 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:12.340', '20170209 15:14:12.340')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (440, 15, N'20170208039', N'2017-02-08', N'5 2 6 0 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:12.457', '20170209 15:14:12.457')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (441, 15, N'20170208038', N'2017-02-08', N'0 7 1 1 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:12.613', '20170209 15:14:12.613')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (442, 15, N'20170208037', N'2017-02-08', N'5 2 2 0 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:12.753', '20170209 15:14:12.753')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (443, 15, N'20170208036', N'2017-02-08', N'6 8 3 0 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:12.870', '20170209 15:14:12.870')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (444, 15, N'20170208035', N'2017-02-08', N'0 1 4 9 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:13', '20170209 15:14:13')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (445, 15, N'20170208034', N'2017-02-08', N'8 0 8 5 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:13.120', '20170209 15:14:13.120')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (446, 15, N'20170208033', N'2017-02-08', N'2 8 7 0 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:13.237', '20170209 15:14:13.237')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (447, 15, N'20170208032', N'2017-02-08', N'0 3 9 9 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:13.360', '20170209 15:14:13.360')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (448, 15, N'20170208031', N'2017-02-08', N'6 9 8 7 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:13.573', '20170209 15:14:13.573')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (449, 15, N'20170208030', N'2017-02-08', N'3 0 7 0 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:13.687', '20170209 15:14:13.687')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (450, 15, N'20170208029', N'2017-02-08', N'7 2 6 9 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:13.813', '20170209 15:14:13.813')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (451, 15, N'20170208028', N'2017-02-08', N'4 1 8 8 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:13.950', '20170209 15:14:13.950')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (452, 15, N'20170208027', N'2017-02-08', N'1 4 0 9 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:14.103', '20170209 15:14:14.103')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (453, 15, N'20170208026', N'2017-02-08', N'0 6 2 3 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:14.247', '20170209 15:14:14.247')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (454, 15, N'20170208025', N'2017-02-08', N'7 4 6 3 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:14.390', '20170209 15:14:14.390')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (455, 15, N'20170208024', N'2017-02-08', N'0 8 0 6 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:14.513', '20170209 15:14:14.513')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (456, 15, N'20170208023', N'2017-02-08', N'2 5 8 3 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:14.633', '20170209 15:14:14.633')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (457, 15, N'20170208022', N'2017-02-08', N'3 5 4 1 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:14.740', '20170209 15:14:14.740')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (458, 15, N'20170208021', N'2017-02-08', N'1 4 9 3 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:14.847', '20170209 15:14:14.847')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (459, 15, N'20170208020', N'2017-02-08', N'9 0 0 2 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:14.980', '20170209 15:14:14.980')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (460, 15, N'20170208019', N'2017-02-08', N'0 6 6 0 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:15.110', '20170209 15:14:15.110')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (461, 15, N'20170208018', N'2017-02-08', N'7 1 1 4 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:15.330', '20170209 15:14:15.330')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (462, 15, N'20170208017', N'2017-02-08', N'6 9 1 9 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:15.457', '20170209 15:14:15.457')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (463, 15, N'20170208016', N'2017-02-08', N'8 7 5 6 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:15.570', '20170209 15:14:15.570')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (464, 15, N'20170208015', N'2017-02-08', N'5 7 6 5 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:15.723', '20170209 15:14:15.723')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (465, 15, N'20170208014', N'2017-02-08', N'1 7 0 9 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:15.863', '20170209 15:14:15.863')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (466, 15, N'20170208013', N'2017-02-08', N'5 4 6 3 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:16.017', '20170209 15:14:16.017')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (467, 15, N'20170208012', N'2017-02-08', N'0 0 5 3 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:16.130', '20170209 15:14:16.130')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (468, 15, N'20170208011', N'2017-02-08', N'0 8 7 4 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:16.237', '20170209 15:14:16.237')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (469, 15, N'20170208010', N'2017-02-08', N'3 0 2 0 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:16.363', '20170209 15:14:16.363')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (470, 15, N'20170208009', N'2017-02-08', N'5 9 9 2 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:16.490', '20170209 15:14:16.490')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (471, 15, N'20170208008', N'2017-02-08', N'4 2 3 3 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:16.630', '20170209 15:14:16.630')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (472, 15, N'20170208007', N'2017-02-08', N'2 3 5 8 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:16.737', '20170209 15:14:16.737')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (473, 15, N'20170208006', N'2017-02-08', N'1 6 7 5 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:16.833', '20170209 15:14:16.833')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (474, 15, N'20170208005', N'2017-02-08', N'9 2 1 6 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:17.053', '20170209 15:14:17.053')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (475, 15, N'20170208004', N'2017-02-08', N'4 0 2 5 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:17.197', '20170209 15:14:17.197')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (476, 15, N'20170208003', N'2017-02-08', N'9 1 6 8 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:17.340', '20170209 15:14:17.340')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (477, 15, N'20170208002', N'2017-02-08', N'5 7 6 5 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:17.467', '20170209 15:14:17.467')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (478, 15, N'20170208001', N'2017-02-08', N'0 7 7 4 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170209 15:14:17.603', '20170209 15:14:17.603')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (479, 15, N'20170223120', N'2017-02-24', N'2 0 8 6 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170224 13:48:39.220', '20170224 13:48:39.220')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (481, 4, N'2017058', N'2017-03-06', N'2 6 2', N'', NULL, N'43,354,494', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:58.467', '20170307 09:27:58.467')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (482, 4, N'2017057', N'2017-03-05', N'2 4 2', N'', NULL, N'43,898,312', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:58.627', '20170307 09:27:58.627')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (483, 4, N'2017056', N'2017-03-04', N'1 0 2', N'', NULL, N'45,252,372', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:58.847', '20170307 09:27:58.847')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (484, 4, N'2017055', N'2017-03-03', N'2 7 6', N'', NULL, N'47,008,498', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:59.017', '20170307 09:27:59.017')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (485, 4, N'2017054', N'2017-03-02', N'7 5 4', N'', NULL, N'46,643,308', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:59.160', '20170307 09:27:59.160')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (486, 4, N'2017053', N'2017-03-01', N'6 5 2', N'', NULL, N'45,304,308', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:59.317', '20170307 09:27:59.317')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (487, 4, N'2017052', N'2017-02-28', N'7 3 1', N'', NULL, N'45,451,026', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:59.503', '20170307 09:27:59.503')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (488, 4, N'2017051', N'2017-02-27', N'7 0 2', N'', NULL, N'44,679,886', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:59.643', '20170307 09:27:59.643')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (489, 4, N'2017050', N'2017-02-26', N'2 7 8', N'', NULL, N'42,907,740', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:59.817', '20170307 09:27:59.817')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (490, 4, N'2017049', N'2017-02-25', N'0 3 6', N'', NULL, N'41,312,528', N'', N'', N'', N'', N'', N'', 1, '20170307 09:27:59.963', '20170307 09:27:59.963')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (491, 4, N'2017048', N'2017-02-24', N'5 5 7', N'', NULL, N'44,328,926', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:00.113', '20170307 09:28:00.113')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (492, 4, N'2017047', N'2017-02-23', N'9 4 5', N'', NULL, N'42,280,860', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:00.253', '20170307 09:28:00.253')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (493, 4, N'2017046', N'2017-02-22', N'5 7 0', N'', NULL, N'41,158,480', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:00.430', '20170307 09:28:00.430')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (494, 4, N'2017045', N'2017-02-21', N'6 7 9', N'', NULL, N'40,797,910', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:00.760', '20170307 09:28:00.760')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (495, 4, N'2017044', N'2017-02-20', N'8 6 1', N'', NULL, N'38,257,620', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:00.967', '20170307 09:28:00.967')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (496, 4, N'2017043', N'2017-02-19', N'0 5 0', N'', NULL, N'36,851,842', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:01.240', '20170307 09:28:01.240')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (497, 4, N'2017042', N'2017-02-18', N'0 0 0', N'', NULL, N'40,592,188', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:01.417', '20170307 09:28:01.417')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (498, 4, N'2017041', N'2017-02-17', N'4 8 0', N'', NULL, N'40,449,832', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:01.550', '20170307 09:28:01.550')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (499, 4, N'2017040', N'2017-02-16', N'8 9 9', N'', NULL, N'43,566,574', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:01.670', '20170307 09:28:01.670')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (500, 4, N'2017039', N'2017-02-15', N'3 9 5', N'', NULL, N'41,892,482', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:01.833', '20170307 09:28:01.833')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (501, 4, N'2017038', N'2017-02-14', N'1 3 4', N'', NULL, N'41,215,136', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:02.030', '20170307 09:28:02.030')
GO

--
-- Data for table dbo.LotteryHistory  (LIMIT 500,500)
--

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (502, 4, N'2017037', N'2017-02-13', N'8 9 7', N'', NULL, N'41,779,470', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:02.190', '20170307 09:28:02.190')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (503, 4, N'2017036', N'2017-02-12', N'6 5 0', N'', NULL, N'40,375,428', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:02.370', '20170307 09:28:02.370')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (504, 4, N'2017035', N'2017-02-11', N'6 2 4', N'', NULL, N'37,761,014', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:02.553', '20170307 09:28:02.553')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (505, 4, N'2017034', N'2017-02-10', N'3 4 8', N'', NULL, N'38,998,338', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:02.710', '20170307 09:28:02.710')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (506, 4, N'2017033', N'2017-02-09', N'1 1 4', N'', NULL, N'40,052,228', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:02.843', '20170307 09:28:02.843')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (507, 1, N'2017025', N'2017-03-05（日）', N'021516172232 07', N'', N'372,684,176元', N'1,076,249,141元', N'11', N'6246929', N'176', N'97416', N'', N'', 1, '20170327 14:27:13.653', '20170307 09:28:09.757')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (508, 1, N'2017024', N'2017-03-02（四）', N'092125262931 13', N'', N'342,020,216元', N'1,093,529,538元', N'6', N'8107050', N'120', N'194190', N'', N'', 1, '20170327 14:27:45.340', '20170307 09:28:09.940')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (509, 1, N'2017023', N'2017-02-28（二）', N'010304111822 14', N'', N'337,872,226元', N'1,072,263,213元', N'3', N'10000000', N'108', N'223769', N'', N'', 1, '20170327 14:27:47.087', '20170307 09:28:10.087')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (510, 1, N'2017022', N'2017-02-26（日）', N'020615161832 15', N'', N'370,988,738元', N'1,029,761,908元', N'4', N'10000000', N'63', N'452069', N'', N'', 1, '20170327 14:27:49.270', '20170307 09:28:10.267')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (511, 1, N'2017021', N'2017-02-23（四）', N'020510223233 09', N'', N'329,896,520元', N'984,320,688元', N'16', N'6097279', N'115', N'190831', N'', N'', 1, '20170327 14:28:20.340', '20170307 09:28:10.413')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (512, 1, N'2017020', N'2017-02-21（二）', N'040810123133 10', N'', N'321,450,250元', N'1,016,040,400元', N'4', N'8928802', N'87', N'225793', N'', N'', 1, '20170327 14:28:21.983', '20170307 09:28:10.550')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (513, 1, N'2017019', N'2017-02-19（日）', N'040608122325 08', N'', N'362,828,374元', N'992,823,572元', N'4', N'8296217', N'111', N'148478', N'', N'', 1, '20170327 14:28:23.450', '20170307 09:28:10.690')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (514, 1, N'2017018', N'2017-02-16（四）', N'010203172531 09', N'', N'332,385,048元', N'976,565,180元', N'5', N'7041328', N'91', N'140201', N'', N'', 1, '20170327 14:28:57.500', '20170307 09:28:10.830')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (515, 1, N'2017017', N'2017-02-14（二）', N'030708102223 12', N'', N'329,086,094元', N'973,496,920元', N'5', N'7986377', N'120', N'155540', N'', N'', 1, '20170322 14:01:18.580', '20170307 09:28:10.980')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (516, 1, N'2017016', N'2017-02-12（日）', N'050816222729 02', N'', N'349,767,606元', N'957,434,232元', N'12', N'6237727', N'222', N'83630', N'', N'', 1, '20170322 14:01:18.730', '20170307 09:28:11.113')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (517, 1, N'2017015', N'2017-02-09（四）', N'010809141732 01', N'', N'314,977,594元', N'976,589,244元', N'4', N'9713530', N'101', N'233343', N'', N'', 1, '20170322 14:01:18.887', '20170307 09:28:11.270')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (518, 1, N'2017014', N'2017-02-07（二）', N'060818202331 13', N'', N'307,538,720元', N'944,740,410元', N'5', N'8280828', N'144', N'142397', N'', N'', 1, '20170322 14:01:19.020', '20170307 09:28:11.403')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (519, 2, N'2017058', N'2017-03-06（一）', N'262', N'056', NULL, N'43,354,494', N'7662', N'1040', N'10195', N'346', N'0', N'173', 1, '20170307 09:28:14.563', '20170307 09:28:14.563')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (520, 2, N'2017057', N'2017-03-05（日）', N'242', N'207', NULL, N'43,898,312', N'12360', N'1040', N'20378', N'346', N'0', N'173', 1, '20170307 09:28:14.700', '20170307 09:28:14.700')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (521, 2, N'2017056', N'2017-03-04（六）', N'102', N'297', NULL, N'45,252,372', N'11735', N'1040', N'0', N'346', N'18216', N'173', 1, '20170307 09:28:14.860', '20170307 09:28:14.860')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (522, 2, N'2017055', N'2017-03-03（五）', N'276', N'552', NULL, N'47,008,498', N'22480', N'1040', N'0', N'346', N'34386', N'173', 1, '20170307 09:28:15', '20170307 09:28:15')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (523, 2, N'2017054', N'2017-03-02（四）', N'754', N'069', NULL, N'46,643,308', N'7856', N'1040', N'0', N'346', N'48245', N'173', 1, '20170307 09:28:15.133', '20170307 09:28:15.133')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (524, 2, N'2017053', N'2017-03-01（三）', N'652', N'747', NULL, N'45,304,308', N'17547', N'1040', N'0', N'346', N'48794', N'173', 1, '20170307 09:28:15.297', '20170307 09:28:15.297')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (525, 2, N'2017052', N'2017-02-28（二）', N'731', N'889', NULL, N'45,451,026', N'10603', N'1040', N'0', N'346', N'31302', N'173', 1, '20170307 09:28:15.450', '20170307 09:28:15.450')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (526, 2, N'2017051', N'2017-02-27（一）', N'702', N'828', NULL, N'44,679,886', N'18667', N'1040', N'0', N'346', N'20926', N'173', 1, '20170307 09:28:15.570', '20170307 09:28:15.570')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (527, 2, N'2017050', N'2017-02-26（日）', N'278', N'966', NULL, N'42,907,740', N'17261', N'1040', N'0', N'346', N'34051', N'173', 1, '20170307 09:28:15.707', '20170307 09:28:15.707')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (528, 2, N'2017048', N'2017-02-24（五）', N'557', N'045', NULL, N'44,328,926', N'17326', N'1040', N'15753', N'346', N'0', N'173', 1, '20170307 09:28:15.840', '20170307 09:28:15.840')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (529, 2, N'2017047', N'2017-02-23（四）', N'945', N'192', NULL, N'42,280,860', N'29944', N'1040', N'0', N'346', N'43344', N'173', 1, '20170307 09:28:15.983', '20170307 09:28:15.983')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (530, 2, N'2017046', N'2017-02-22（三）', N'570', N'714', NULL, N'41,158,480', N'7119', N'1040', N'0', N'346', N'20085', N'173', 1, '20170307 09:28:16.133', '20170307 09:28:16.133')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (531, 2, N'2017045', N'2017-02-21（二）', N'679', N'792', NULL, N'40,797,910', N'14937', N'1040', N'0', N'346', N'29155', N'173', 1, '20170307 09:28:16.263', '20170307 09:28:16.263')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (532, 2, N'2017044', N'2017-02-20（一）', N'861', N'805', NULL, N'38,257,620', N'14708', N'1040', N'0', N'346', N'38414', N'173', 1, '20170307 09:28:16.400', '20170307 09:28:16.400')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (533, 2, N'2017043', N'2017-02-19（日）', N'050', N'835', NULL, N'36,851,842', N'9060', N'1040', N'12849', N'346', N'0', N'173', 1, '20170307 09:28:16.560', '20170307 09:28:16.560')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (534, 2, N'2017042', N'2017-02-18（六）', N'000', N'961', NULL, N'40,592,188', N'97715', N'1040', N'0', N'346', N'0', N'173', 1, '20170307 09:28:16.687', '20170307 09:28:16.687')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (535, 2, N'2017041', N'2017-02-17（五）', N'480', N'631', NULL, N'40,449,832', N'11343', N'1040', N'0', N'346', N'21673', N'173', 1, '20170307 09:28:16.807', '20170307 09:28:16.807')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (536, 2, N'2017040', N'2017-02-16（四）', N'899', N'408', NULL, N'43,566,574', N'23435', N'1040', N'23900', N'346', N'0', N'173', 1, '20170307 09:28:16.927', '20170307 09:28:16.927')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (537, 2, N'2017039', N'2017-02-15（三）', N'395', N'997', NULL, N'41,892,482', N'7629', N'1040', N'0', N'346', N'22577', N'173', 1, '20170307 09:28:17.060', '20170307 09:28:17.060')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (538, 2, N'2017038', N'2017-02-14（二）', N'134', N'589', NULL, N'41,215,136', N'11892', N'1040', N'0', N'346', N'27915', N'173', 1, '20170307 09:28:17.200', '20170307 09:28:17.200')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (539, 2, N'2017037', N'2017-02-13（一）', N'897', N'586', NULL, N'41,779,470', N'12870', N'1040', N'0', N'346', N'39742', N'173', 1, '20170307 09:28:17.323', '20170307 09:28:17.323')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (540, 2, N'2017036', N'2017-02-12（日）', N'650', N'647', NULL, N'40,375,428', N'13211', N'1040', N'0', N'346', N'36621', N'173', 1, '20170307 09:28:17.453', '20170307 09:28:17.453')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (541, 2, N'2017033', N'2017-02-09（四）', N'114', N'505', NULL, N'40,052,228', N'14159', N'1040', N'16903', N'346', N'0', N'173', 1, '20170307 09:28:17.577', '20170307 09:28:17.577')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (542, 5, N'17025', N'2017-03-06（一）', N'1016192034 04 05', N'', NULL, N'', N'2', N'10000000', N'49', N'160881', N'', N'', 1, '20170307 09:28:18.600', '20170307 09:28:18.600')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (543, 5, N'17024', N'2017-03-04（六）', N'2123293235 11 12', N'', NULL, N'', N'3', N'10000000', N'73', N'131828', N'', N'', 1, '20170307 09:28:18.730', '20170307 09:28:18.730')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (544, 5, N'17023', N'2017-03-01（三）', N'0508122434 07 10', N'', NULL, N'', N'1', N'10000000', N'97', N'72605', N'', N'', 1, '20170307 09:28:18.867', '20170307 09:28:18.867')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (545, 5, N'17022', N'2017-02-27（一）', N'0203091724 06 12', N'', NULL, N'', N'0', N'0', N'39', N'250053', N'', N'', 1, '20170307 09:28:19.023', '20170307 09:28:19.023')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (546, 5, N'17021', N'2017-02-25（六）', N'0115172026 06 08', N'', NULL, N'', N'1', N'10000000', N'89', N'92353', N'', N'', 1, '20170307 09:28:19.187', '20170307 09:28:19.187')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (547, 5, N'17020', N'2017-02-22（三）', N'1621242728 04 07', N'', NULL, N'', N'6', N'6970810', N'117', N'54136', N'', N'', 1, '20170307 09:28:19.330', '20170307 09:28:19.330')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (548, 5, N'17019', N'2017-02-20（一）', N'0206142325 02 10', N'', NULL, N'', N'11', N'6272113', N'57', N'145860', N'', N'', 1, '20170307 09:28:19.473', '20170307 09:28:19.473')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (549, 5, N'17018', N'2017-02-18（六）', N'0607101723 01 09', N'', NULL, N'', N'2', N'10000000', N'52', N'173163', N'', N'', 1, '20170307 09:28:19.617', '20170307 09:28:19.617')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (550, 5, N'17017', N'2017-02-15（三）', N'0419242629 04 06', N'', NULL, N'', N'3', N'10000000', N'70', N'124952', N'', N'', 1, '20170307 09:28:19.740', '20170307 09:28:19.740')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (551, 5, N'17016', N'2017-02-13（一）', N'0313283033 09 10', N'', NULL, N'', N'3', N'10000000', N'84', N'97252', N'', N'', 1, '20170307 09:28:19.883', '20170307 09:28:19.883')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (552, 5, N'17015', N'2017-02-11（六）', N'0107192734 01 02', N'', NULL, N'', N'3', N'10000000', N'83', N'112410', N'', N'', 1, '20170307 09:28:20.037', '20170307 09:28:20.037')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (553, 6, N'17025', N'2017-03-05', N'8 8 9 8 0 5 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:23.437', '20170307 09:28:23.437')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (554, 6, N'17024', N'2017-03-03', N'3 1 6 8 6 6 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:23.580', '20170307 09:28:23.580')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (555, 6, N'17023', N'2017-02-28', N'3 2 0 9 1 6 9', N'', NULL, N'13,160,262', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:23.733', '20170307 09:28:23.733')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (556, 6, N'17022', N'2017-02-26', N'8 7 8 3 7 3 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:23.890', '20170307 09:28:23.890')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (557, 6, N'17021', N'2017-02-24', N'1 7 2 9 2 9 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:24.040', '20170307 09:28:24.040')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (558, 6, N'17020', N'2017-02-21', N'6 1 8 8 9 0 0', N'', NULL, N'12,216,988', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:24.210', '20170307 09:28:24.210')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (559, 6, N'17019', N'2017-02-19', N'1 1 2 7 8 0 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:24.343', '20170307 09:28:24.343')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (560, 6, N'17018', N'2017-02-17', N'4 2 4 5 6 2 7', N'', NULL, N'16,701,100', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:24.463', '20170307 09:28:24.463')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (561, 6, N'17017', N'2017-02-14', N'9 3 2 1 1 9 0', N'', NULL, N'12,613,216', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:24.603', '20170307 09:28:24.603')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (562, 6, N'17016', N'2017-02-12', N'2 4 6 6 1 4 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:24.750', '20170307 09:28:24.750')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (563, 6, N'17015', N'2017-02-10', N'9 4 1 1 6 6 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:24.907', '20170307 09:28:24.907')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (564, 7, N'17058', N'2017-03-06', N'7 3 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:28.447', '20170307 09:28:28.447')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (565, 7, N'17057', N'2017-03-05', N'9 2 1', N'', NULL, N'14,733,748', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:28.597', '20170307 09:28:28.597')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (566, 7, N'17056', N'2017-03-04', N'2 3 2', N'', NULL, N'14,911,998', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:28.720', '20170307 09:28:28.720')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (567, 7, N'17055', N'2017-03-03', N'3 6 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:29.183', '20170307 09:28:29.183')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (568, 7, N'17054', N'2017-03-02', N'7 0 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:29.383', '20170307 09:28:29.383')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (569, 7, N'17053', N'2017-03-01', N'9 2 1', N'', NULL, N'16,076,686', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:29.553', '20170307 09:28:29.553')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (570, 7, N'17052', N'2017-02-28', N'1 5 9', N'', NULL, N'15,066,440', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:29.810', '20170307 09:28:29.810')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (571, 7, N'17051', N'2017-02-27', N'4 4 4', N'', NULL, N'16,114,604', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:30', '20170307 09:28:30')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (572, 7, N'17050', N'2017-02-26', N'3 0 7', N'', NULL, N'14,991,698', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:30.157', '20170307 09:28:30.157')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (573, 7, N'17049', N'2017-02-25', N'6 6 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:30.300', '20170307 09:28:30.300')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (574, 7, N'17048', N'2017-02-24', N'1 6 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:30.440', '20170307 09:28:30.440')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (575, 7, N'17047', N'2017-02-23', N'2 8 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:30.580', '20170307 09:28:30.580')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (576, 7, N'17046', N'2017-02-22', N'8 8 7', N'', NULL, N'17,702,298', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:30.787', '20170307 09:28:30.787')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (577, 7, N'17045', N'2017-02-21', N'7 3 5', N'', NULL, N'17,225,922', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:30.920', '20170307 09:28:30.920')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (578, 7, N'17044', N'2017-02-20', N'1 3 8', N'', NULL, N'17,929,962', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:31.053', '20170307 09:28:31.053')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (579, 7, N'17043', N'2017-02-19', N'5 0 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:31.197', '20170307 09:28:31.197')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (580, 7, N'17042', N'2017-02-18', N'1 4 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:31.423', '20170307 09:28:31.423')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (581, 7, N'17041', N'2017-02-17', N'9 8 2', N'', NULL, N'1,774,284', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:31.600', '20170307 09:28:31.600')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (582, 7, N'17040', N'2017-02-16', N'3 9 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:31.750', '20170307 09:28:31.750')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (583, 7, N'17039', N'2017-02-15', N'5 9 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:31.960', '20170307 09:28:31.960')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (584, 7, N'17038', N'2017-02-14', N'8 2 3', N'', NULL, N'15,056,404', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:32.177', '20170307 09:28:32.177')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (585, 7, N'17037', N'2017-02-13', N'3 8 0', N'', NULL, N'15,091,482', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:32.367', '20170307 09:28:32.367')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (586, 7, N'17036', N'2017-02-12', N'4 7 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:32.510', '20170307 09:28:32.510')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (587, 7, N'17035', N'2017-02-11', N'8 9 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:32.690', '20170307 09:28:32.690')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (588, 7, N'17034', N'2017-02-10', N'8 9 5', N'', NULL, N'14,778,148', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:32.827', '20170307 09:28:32.827')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (589, 7, N'17033', N'2017-02-09', N'7 8 5', N'', NULL, N'14,441,444', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:32.967', '20170307 09:28:32.967')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (590, 8, N'17058', N'2017-03-06', N'7 3 0 0 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:39.130', '20170307 09:28:39.130')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (591, 8, N'17057', N'2017-03-05', N'9 2 1 6 8', N'', NULL, N'9,151,940', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:39.327', '20170307 09:28:39.327')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (592, 8, N'17056', N'2017-03-04', N'2 3 2 7 2', N'', NULL, N'9,189,216', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:39.467', '20170307 09:28:39.467')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (593, 8, N'17055', N'2017-03-03', N'3 6 6 5 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:39.640', '20170307 09:28:39.640')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (594, 8, N'17054', N'2017-03-02', N'7 0 2 4 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:39.790', '20170307 09:28:39.790')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (595, 8, N'17053', N'2017-03-01', N'9 2 1 8 3', N'', NULL, N'9,701,052', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:39.980', '20170307 09:28:39.980')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (596, 8, N'17052', N'2017-02-28', N'1 5 9 5 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:40.137', '20170307 09:28:40.137')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (597, 8, N'17051', N'2017-02-27', N'4 4 4 8 8', N'', NULL, N'9,727,774', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:40.313', '20170307 09:28:40.313')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (598, 8, N'17050', N'2017-02-26', N'3 0 7 8 0', N'', NULL, N'9,179,568', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:40.483', '20170307 09:28:40.483')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (599, 8, N'17049', N'2017-02-25', N'6 6 5 3 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:40.730', '20170307 09:28:40.730')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (600, 8, N'17048', N'2017-02-24', N'1 6 4 2 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:40.897', '20170307 09:28:40.897')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (601, 8, N'17047', N'2017-02-23', N'2 8 3 6 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:41.047', '20170307 09:28:41.047')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (602, 8, N'17046', N'2017-02-22', N'8 8 7 6 6', N'', NULL, N'9,839,658', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:41.217', '20170307 09:28:41.217')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (603, 8, N'17045', N'2017-02-21', N'7 3 5 1 7', N'', NULL, N'9,544,348', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:41.357', '20170307 09:28:41.357')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (604, 8, N'17044', N'2017-02-20', N'1 3 8 5 0', N'', NULL, N'9,871,826', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:41.490', '20170307 09:28:41.490')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (605, 8, N'17043', N'2017-02-19', N'5 0 8 3 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:41.627', '20170307 09:28:41.627')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (606, 8, N'17042', N'2017-02-18', N'1 4 9 9 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:41.780', '20170307 09:28:41.780')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (607, 8, N'17041', N'2017-02-17', N'9 8 2 8 2', N'', NULL, N'10,684,326', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:41.960', '20170307 09:28:41.960')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (608, 8, N'17040', N'2017-02-16', N'3 9 5 0 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:42.123', '20170307 09:28:42.123')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (609, 8, N'17039', N'2017-02-15', N'5 9 8 8 1', N'', NULL, N'9,538,412', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:42.310', '20170307 09:28:42.310')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (610, 8, N'17038', N'2017-02-14', N'8 2 3 5 2', N'', NULL, N'8,910,690', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:42.470', '20170307 09:28:42.470')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (611, 8, N'17037', N'2017-02-13', N'3 8 0 8 0', N'', NULL, N'9,115,214', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:42.613', '20170307 09:28:42.613')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (612, 8, N'17036', N'2017-02-12', N'4 7 2 8 0', N'', NULL, N'8,444,990', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:42.773', '20170307 09:28:42.773')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (613, 8, N'17035', N'2017-02-11', N'8 9 0 7 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:42.980', '20170307 09:28:42.980')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (614, 8, N'17034', N'2017-02-10', N'8 9 5 7 6', N'', NULL, N'9,772,586', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:43.150', '20170307 09:28:43.150')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (615, 8, N'17033', N'2017-02-09', N'7 8 5 6 6', N'', NULL, N'9,135,182', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:43.307', '20170307 09:28:43.307')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (616, 9, N'17032', N'2017-03-06', N'3 0 0 3 0 0 1 3 1 0 3 3 3 1', N'', NULL, N'23,742,530', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:52.257', '20170307 09:28:52.257')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (617, 9, N'17031', N'2017-03-05', N'3 3 3 0 0 3 0 3 1 3 3 3 0 3', N'', NULL, N'26,725,140', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:52.397', '20170307 09:28:52.397')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (618, 9, N'17030', N'2017-03-04', N'0 1 3 1 0 0 1 0 1 0 1 0 0 0', N'', NULL, N'9,399,694', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:52.547', '20170307 09:28:52.547')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (619, 9, N'17029', N'2017-03-02', N'3 0 3 3 0 3 3 1 1 1 0 1 0 1', N'', NULL, N'14,297,952', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:52.683', '20170307 09:28:52.683')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (620, 9, N'17028', N'2017-03-01', N'3 0 0 0 3 3 3 0 3 * 3 1 0 3', N'', NULL, N'9,844,456', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:52.823', '20170307 09:28:52.823')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (621, 9, N'17027', N'2017-02-27', N'0 1 3 0 1 3 0 0 0 3 1 0 3 0', N'', NULL, N'18,452,588', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:52.980', '20170307 09:28:52.980')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (622, 9, N'17026', N'2017-02-26', N'3 3 3 1 3 1 0 3 3 0 0 3 0 3', N'', NULL, N'29,243,498', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:53.113', '20170307 09:28:53.113')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (623, 9, N'17025', N'2017-02-25', N'0 3 1 0 0 3 1 3 0 1 0 0 0 1', N'', NULL, N'7,270,790', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:53.243', '20170307 09:28:53.243')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (624, 9, N'17024', N'2017-02-24', N'0 3 0 3 0 1 3 3 0 3 0 3 0 1', N'', NULL, N'17,928,016', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:53.357', '20170307 09:28:53.357')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (625, 9, N'17023', N'2017-02-20', N'0 1 0 3 1 0 3 3 3 3 3 3 3 1', N'', NULL, N'20,928,644', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:53.487', '20170307 09:28:53.487')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (626, 9, N'17022', N'2017-02-19', N'3 0 0 1 3 1 3 0 3 0 3 3 1 0', N'', NULL, N'25,882,886', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:53.623', '20170307 09:28:53.623')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (627, 9, N'17021', N'2017-02-18', N'0 0 3 1 3 3 3 3 3 0 1 1 1 1', N'', NULL, N'7,894,194', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:53.793', '20170307 09:28:53.793')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (628, 9, N'17020', N'2017-02-17', N'3 3 3 3 0 0 3 0 3 0 1 3 0 3', N'', NULL, N'12,395,976', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:53.940', '20170307 09:28:53.940')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (629, 9, N'17019', N'2017-02-13', N'1 3 3 3 3 3 0 0 3 0 3 0 0 1', N'', NULL, N'20,202,394', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:54.070', '20170307 09:28:54.070')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (630, 9, N'17018', N'2017-02-12', N'3 1 3 0 1 3 3 0 0 3 0 3 0 3', N'', NULL, N'23,915,024', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:54.207', '20170307 09:28:54.207')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (631, 9, N'17017', N'2017-02-11', N'3 1 1 1 3 0 0 3 3 3 3 1 3 1', N'', NULL, N'8,162,048', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:54.340', '20170307 09:28:54.340')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (632, 10, N'17032', N'2017-03-06', N'3 0 0 3 0 0 1 3 1 0 3 3 3 1', N'', NULL, N'17,842,284', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:57.660', '20170307 09:28:57.660')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (633, 10, N'17031', N'2017-03-05', N'3 3 3 0 0 3 0 3 1 3 3 3 0 3', N'', NULL, N'18,127,558', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:57.790', '20170307 09:28:57.790')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (634, 10, N'17030', N'2017-03-04', N'0 1 3 1 0 0 1 0 1 0 1 0 0 0', N'', NULL, N'14,904,412', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:57.977', '20170307 09:28:57.977')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (635, 10, N'17029', N'2017-03-02', N'3 0 3 3 0 3 3 1 1 1 0 1 0 1', N'', NULL, N'10,160,450', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:58.170', '20170307 09:28:58.170')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (636, 10, N'17028', N'2017-03-01', N'3 0 0 0 3 3 3 0 3 * 3 1 0 3', N'', NULL, N'11,865,034', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:58.330', '20170307 09:28:58.330')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (637, 10, N'17027', N'2017-02-27', N'0 1 3 0 1 3 0 0 0 3 1 0 3 0', N'', NULL, N'18,487,328', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:58.487', '20170307 09:28:58.487')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (638, 10, N'17026', N'2017-02-26', N'3 3 3 1 3 1 0 3 3 0 0 3 0 3', N'', NULL, N'18,517,970', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:58.773', '20170307 09:28:58.773')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (639, 10, N'17025', N'2017-02-25', N'0 3 1 0 0 3 1 3 0 1 0 0 0 1', N'', NULL, N'11,732,364', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:58.943', '20170307 09:28:58.943')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (640, 10, N'17024', N'2017-02-24', N'0 3 0 3 0 1 3 3 0 3 0 3 0 1', N'', NULL, N'13,687,544', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:59.100', '20170307 09:28:59.100')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (641, 10, N'17023', N'2017-02-20', N'0 1 0 3 1 0 3 3 3 3 3 3 3 1', N'', NULL, N'17,580,102', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:59.233', '20170307 09:28:59.233')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (642, 10, N'17022', N'2017-02-19', N'3 0 0 1 3 1 3 0 3 0 3 3 1 0', N'', NULL, N'18,933,340', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:59.407', '20170307 09:28:59.407')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (643, 10, N'17021', N'2017-02-18', N'0 0 3 1 3 3 3 3 3 0 1 1 1 1', N'', NULL, N'13,613,264', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:59.563', '20170307 09:28:59.563')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (644, 10, N'17020', N'2017-02-17', N'3 3 3 3 0 0 3 0 3 0 1 3 0 3', N'', NULL, N'13,278,718', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:59.713', '20170307 09:28:59.713')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (645, 10, N'17019', N'2017-02-13', N'1 3 3 3 3 3 0 0 3 0 3 0 0 1', N'', NULL, N'17,163,412', N'', N'', N'', N'', N'', N'', 1, '20170307 09:28:59.917', '20170307 09:28:59.917')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (646, 10, N'17018', N'2017-02-12', N'3 1 3 0 1 3 3 0 0 3 0 3 0 3', N'', NULL, N'18,664,962', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:00.053', '20170307 09:29:00.053')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (647, 10, N'17017', N'2017-02-11', N'3 1 1 1 3 0 0 3 3 3 3 1 3 1', N'', NULL, N'14,049,944', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:00.187', '20170307 09:29:00.187')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (648, 11, N'17032', N'2017-03-06', N'1 3 3 1 1 1 0 2', N'', NULL, N'671,166', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:03.087', '20170307 09:29:03.087')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (649, 11, N'17031', N'2017-03-05', N'3 1 3 2 3 3 3 1', N'', NULL, N'603,396', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:03.233', '20170307 09:29:03.233')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (650, 11, N'17030', N'2017-03-04', N'1 2 0 1 0 1 2 3', N'', NULL, N'390,424', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:03.367', '20170307 09:29:03.367')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (651, 11, N'17029', N'2017-03-02', N'0 2 1 1 1 2 2 2', N'', NULL, N'554,622', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:03.513', '20170307 09:29:03.513')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (652, 11, N'17028', N'2017-03-01', N'2 1 2 3 2 3 1 2', N'', NULL, N'310,150', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:03.660', '20170307 09:29:03.660')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (653, 11, N'17027', N'2017-02-27', N'1 1 1 0 0 1 1 3', N'', NULL, N'564,984', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:03.800', '20170307 09:29:03.800')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (654, 11, N'17026', N'2017-02-26', N'3 1 2 0 2 1 1 1', N'', NULL, N'687,764', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:03.940', '20170307 09:29:03.940')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (655, 11, N'17025', N'2017-02-25', N'0 0 1 0 2 3 1 1', N'', NULL, N'458,890', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:04.080', '20170307 09:29:04.080')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (656, 11, N'17024', N'2017-02-23', N'2 3 3 3 0 2 2 1', N'', NULL, N'747,978', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:04.227', '20170307 09:29:04.227')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (657, 11, N'17023', N'2017-02-20', N'1 3 1 2 3 1 2 1', N'', NULL, N'719,678', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:04.383', '20170307 09:29:04.383')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (658, 11, N'17022', N'2017-02-19', N'3 0 0 2 0 2 1 1', N'', NULL, N'681,174', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:04.530', '20170307 09:29:04.530')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (659, 11, N'17021', N'2017-02-18', N'1 0 1 0 3 2 0 1', N'', NULL, N'368,296', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:04.680', '20170307 09:29:04.680')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (660, 11, N'17020', N'2017-02-16', N'3 0 1 0 3 1 3 1', N'', NULL, N'667,476', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:04.810', '20170307 09:29:04.810')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (661, 11, N'17019', N'2017-02-13', N'3 3 2 0 3 1 0 2', N'', NULL, N'800,424', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:04.943', '20170307 09:29:04.943')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (662, 11, N'17018', N'2017-02-12', N'2 0 0 0 0 3 2 0', N'', NULL, N'1,307,010', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:05.090', '20170307 09:29:05.090')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (663, 11, N'17017', N'2017-02-11', N'3 2 3 0 3 1 3 2', N'', NULL, N'361,450', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:05.213', '20170307 09:29:05.213')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (664, 12, N'17032', N'2017-03-06', N'0 0 1 0 1 1 0 3 3 1 0 0', N'', NULL, N'120,042', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:08.313', '20170307 09:29:08.313')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (665, 12, N'17031', N'2017-03-05', N'1 3 3 3 1 3 0 0 1 0 3 3', N'', NULL, N'37,086', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:08.453', '20170307 09:29:08.453')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (666, 12, N'17030', N'2017-03-04', N'1 0 1 0 0 1 0 0 3 0 0 0', N'', NULL, N'22,848', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:08.593', '20170307 09:29:08.593')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (667, 12, N'17029', N'2017-03-02', N'1 0 3 3 1 0 1 1 1 0 1 1', N'', NULL, N'55,878', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:08.757', '20170307 09:29:08.757')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (668, 12, N'17028', N'2017-03-01', N'3 3 1 0 0 0 1 0 3 3 * *', N'', NULL, N'48,754', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:08.920', '20170307 09:29:08.920')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (669, 12, N'17027', N'2017-02-27', N'3 3 1 0 1 1 1 3 0 0 0 0', N'', NULL, N'24,306', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:09.070', '20170307 09:29:09.070')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (670, 12, N'17026', N'2017-02-26', N'1 3 3 3 3 3 1 1 3 3 3 1', N'', NULL, N'105,248', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:09.210', '20170307 09:29:09.210')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (671, 12, N'17025', N'2017-02-25', N'1 1 1 3 0 0 0 1 0 0 3 0', N'', NULL, N'21,358', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:09.343', '20170307 09:29:09.343')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (672, 12, N'17024', N'2017-02-24', N'0 0 0 3 1 0 3 3 0 0 1 1', N'', NULL, N'44,850', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:09.490', '20170307 09:29:09.490')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (673, 12, N'17023', N'2017-02-20', N'0 0 3 3 1 1 3 0 3 3 3 3', N'', NULL, N'258,352', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:09.647', '20170307 09:29:09.647')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (674, 12, N'17022', N'2017-02-19', N'3 3 0 0 0 0 3 1 1 3 1 1', N'', NULL, N'123,978', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:09.797', '20170307 09:29:09.797')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (675, 12, N'17021', N'2017-02-18', N'3 3 3 3 0 3 1 0 1 1 0 1', N'', NULL, N'26,988', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:09.930', '20170307 09:29:09.930')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (676, 12, N'17020', N'2017-02-17', N'3 3 1 3 1 3 1 3 0 0 0 0', N'', NULL, N'34,276', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:10.093', '20170307 09:29:10.093')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (677, 12, N'17019', N'2017-02-13', N'3 3 3 3 0 0 1 0 0 3 0 0', N'', NULL, N'131,426', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:10.293', '20170307 09:29:10.293')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (678, 12, N'17018', N'2017-02-12', N'3 3 1 1 1 3 0 0 0 1 3 3', N'', NULL, N'36,304', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:10.420', '20170307 09:29:10.420')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (679, 12, N'17017', N'2017-02-11', N'3 3 3 3 1 3 1 3 3 1 1 3', N'', NULL, N'15,664', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:10.587', '20170307 09:29:10.587')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (680, 14, N'17030678', N'2017-03-06', N'10 09 03 08 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:13.817', '20170307 09:29:13.817')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (681, 14, N'17030677', N'2017-03-06', N'10 04 08 11 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:13.943', '20170307 09:29:13.943')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (682, 14, N'17030676', N'2017-03-06', N'10 06 04 08 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:14.160', '20170307 09:29:14.160')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (683, 14, N'17030675', N'2017-03-06', N'08 04 05 09 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:14.290', '20170307 09:29:14.290')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (684, 14, N'17030674', N'2017-03-06', N'02 10 03 08 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:14.430', '20170307 09:29:14.430')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (685, 14, N'17030673', N'2017-03-06', N'08 11 03 05 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:14.610', '20170307 09:29:14.610')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (686, 14, N'17030672', N'2017-03-06', N'08 06 03 10 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:14.827', '20170307 09:29:14.827')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (687, 14, N'17030671', N'2017-03-06', N'08 07 11 02 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:14.973', '20170307 09:29:14.973')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (688, 14, N'17030670', N'2017-03-06', N'05 01 07 08 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:15.130', '20170307 09:29:15.130')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (689, 14, N'17030669', N'2017-03-06', N'11 10 09 02 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:15.297', '20170307 09:29:15.297')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (690, 14, N'17030668', N'2017-03-06', N'09 02 10 03 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:15.483', '20170307 09:29:15.483')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (691, 14, N'17030667', N'2017-03-06', N'05 06 11 08 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:15.710', '20170307 09:29:15.710')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (692, 14, N'17030666', N'2017-03-06', N'10 03 07 08 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:15.833', '20170307 09:29:15.833')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (693, 14, N'17030665', N'2017-03-06', N'10 04 09 01 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:15.987', '20170307 09:29:15.987')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (694, 14, N'17030664', N'2017-03-06', N'04 07 06 09 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:16.150', '20170307 09:29:16.150')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (695, 14, N'17030663', N'2017-03-06', N'01 10 11 03 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:16.310', '20170307 09:29:16.310')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (696, 14, N'17030662', N'2017-03-06', N'11 04 01 03 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:16.450', '20170307 09:29:16.450')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (697, 14, N'17030661', N'2017-03-06', N'02 07 01 04 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:16.633', '20170307 09:29:16.633')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (698, 14, N'17030660', N'2017-03-06', N'07 05 08 01 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:16.790', '20170307 09:29:16.790')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (699, 14, N'17030659', N'2017-03-06', N'03 01 04 08 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:16.933', '20170307 09:29:16.933')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (700, 14, N'17030658', N'2017-03-06', N'07 09 03 05 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:17.093', '20170307 09:29:17.093')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (701, 14, N'17030657', N'2017-03-06', N'07 01 09 08 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:17.283', '20170307 09:29:17.283')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (702, 14, N'17030656', N'2017-03-06', N'06 11 08 01 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:17.473', '20170307 09:29:17.473')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (703, 14, N'17030655', N'2017-03-06', N'10 02 07 08 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:18.430', '20170307 09:29:18.430')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (704, 14, N'17030654', N'2017-03-06', N'11 04 06 03 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:18.787', '20170307 09:29:18.787')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (705, 14, N'17030653', N'2017-03-06', N'11 01 02 08 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:18.960', '20170307 09:29:18.960')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (706, 14, N'17030652', N'2017-03-06', N'01 07 08 06 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:19.363', '20170307 09:29:19.363')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (707, 14, N'17030651', N'2017-03-06', N'06 01 11 08 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:19.610', '20170307 09:29:19.610')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (708, 14, N'17030650', N'2017-03-06', N'04 07 09 11 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:19.887', '20170307 09:29:19.887')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (709, 14, N'17030649', N'2017-03-06', N'04 07 01 06 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:20.127', '20170307 09:29:20.127')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (710, 14, N'17030648', N'2017-03-06', N'10 08 11 06 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:20.280', '20170307 09:29:20.280')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (711, 14, N'17030647', N'2017-03-06', N'09 02 03 07 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:20.470', '20170307 09:29:20.470')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (712, 14, N'17030646', N'2017-03-06', N'11 04 08 02 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:20.603', '20170307 09:29:20.603')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (713, 14, N'17030645', N'2017-03-06', N'06 02 09 05 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:20.733', '20170307 09:29:20.733')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (714, 14, N'17030644', N'2017-03-06', N'08 09 06 11 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:20.877', '20170307 09:29:20.877')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (715, 14, N'17030643', N'2017-03-06', N'04 11 06 10 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:21.047', '20170307 09:29:21.047')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (716, 14, N'17030642', N'2017-03-06', N'01 08 09 10 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:21.210', '20170307 09:29:21.210')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (717, 14, N'17030641', N'2017-03-06', N'10 01 02 05 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:21.377', '20170307 09:29:21.377')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (718, 14, N'17030640', N'2017-03-06', N'01 09 02 03 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:21.557', '20170307 09:29:21.557')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (719, 14, N'17030639', N'2017-03-06', N'06 04 07 08 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:21.690', '20170307 09:29:21.690')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (720, 14, N'17030638', N'2017-03-06', N'07 09 05 06 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:21.850', '20170307 09:29:21.850')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (721, 14, N'17030637', N'2017-03-06', N'02 11 10 09 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:22.007', '20170307 09:29:22.007')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (722, 14, N'17030636', N'2017-03-06', N'02 06 08 04 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:22.157', '20170307 09:29:22.157')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (723, 14, N'17030635', N'2017-03-06', N'01 11 03 09 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:22.300', '20170307 09:29:22.300')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (724, 14, N'17030634', N'2017-03-06', N'02 05 01 04 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:22.460', '20170307 09:29:22.460')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (725, 14, N'17030633', N'2017-03-06', N'06 09 11 07 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:22.610', '20170307 09:29:22.610')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (726, 14, N'17030632', N'2017-03-06', N'09 04 07 03 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:22.873', '20170307 09:29:22.873')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (727, 14, N'17030631', N'2017-03-06', N'06 10 11 03 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:23.047', '20170307 09:29:23.047')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (728, 14, N'17030630', N'2017-03-06', N'02 06 08 04 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:23.223', '20170307 09:29:23.223')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (729, 14, N'17030629', N'2017-03-06', N'01 02 07 04 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:23.373', '20170307 09:29:23.373')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (730, 14, N'17030628', N'2017-03-06', N'03 01 05 10 07', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:24.163', '20170307 09:29:24.163')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (731, 14, N'17030627', N'2017-03-06', N'07 09 04 08 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:24.323', '20170307 09:29:24.323')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (732, 14, N'17030626', N'2017-03-06', N'03 06 07 11 10', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:24.460', '20170307 09:29:24.460')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (733, 14, N'17030625', N'2017-03-06', N'07 02 06 04 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:24.613', '20170307 09:29:24.613')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (734, 14, N'17030624', N'2017-03-06', N'07 02 01 05 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:24.810', '20170307 09:29:24.810')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (735, 14, N'17030623', N'2017-03-06', N'02 10 07 06 11', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:24.970', '20170307 09:29:24.970')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (736, 14, N'17030622', N'2017-03-06', N'09 02 10 05 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:25.100', '20170307 09:29:25.100')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (737, 14, N'17030621', N'2017-03-06', N'04 06 05 01 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:25.240', '20170307 09:29:25.240')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (738, 14, N'17030620', N'2017-03-06', N'08 06 09 04 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:25.407', '20170307 09:29:25.407')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (739, 14, N'17030619', N'2017-03-06', N'03 05 09 04 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:25.560', '20170307 09:29:25.560')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (740, 14, N'17030618', N'2017-03-06', N'09 10 11 08 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:25.747', '20170307 09:29:25.747')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (741, 14, N'17030617', N'2017-03-06', N'07 04 09 05 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:25.920', '20170307 09:29:25.920')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (742, 14, N'17030616', N'2017-03-06', N'07 08 05 10 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:26.093', '20170307 09:29:26.093')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (743, 14, N'17030615', N'2017-03-06', N'03 07 05 09 08', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:26.237', '20170307 09:29:26.237')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (744, 14, N'17030614', N'2017-03-06', N'05 08 06 01 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:26.420', '20170307 09:29:26.420')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (745, 14, N'17030613', N'2017-03-06', N'08 01 11 04 09', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:26.633', '20170307 09:29:26.633')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (746, 14, N'17030612', N'2017-03-06', N'03 11 07 06 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:26.870', '20170307 09:29:26.870')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (747, 14, N'17030611', N'2017-03-06', N'08 02 06 11 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:27.070', '20170307 09:29:27.070')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (748, 14, N'17030610', N'2017-03-06', N'08 05 07 03 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:27.303', '20170307 09:29:27.303')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (749, 14, N'17030609', N'2017-03-06', N'03 09 05 07 02', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:27.457', '20170307 09:29:27.457')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (750, 14, N'17030608', N'2017-03-06', N'05 11 02 07 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:27.620', '20170307 09:29:27.620')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (751, 14, N'17030607', N'2017-03-06', N'07 01 08 09 04', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:27.750', '20170307 09:29:27.750')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (752, 14, N'17030606', N'2017-03-06', N'11 05 01 10 06', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:27.883', '20170307 09:29:27.883')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (753, 14, N'17030605', N'2017-03-06', N'04 05 06 09 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:28.020', '20170307 09:29:28.020')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (754, 14, N'17030604', N'2017-03-06', N'09 04 06 05 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:28.183', '20170307 09:29:28.183')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (755, 14, N'17030603', N'2017-03-06', N'03 02 06 09 01', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:28.370', '20170307 09:29:28.370')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (756, 14, N'17030602', N'2017-03-06', N'09 01 10 03 05', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:28.513', '20170307 09:29:28.513')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (757, 14, N'17030601', N'2017-03-06', N'02 05 08 04 03', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:28.660', '20170307 09:29:28.660')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (758, 15, N'20170306120', N'2017-03-07', N'0 7 0 4 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:29.330', '20170307 09:29:29.330')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (759, 15, N'20170306119', N'2017-03-06', N'1 3 0 5 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:29.467', '20170307 09:29:29.467')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (760, 15, N'20170306118', N'2017-03-06', N'9 4 8 9 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:29.593', '20170307 09:29:29.593')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (761, 15, N'20170306117', N'2017-03-06', N'8 9 3 2 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:29.827', '20170307 09:29:29.827')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (762, 15, N'20170306116', N'2017-03-06', N'2 8 1 3 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:29.963', '20170307 09:29:29.963')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (763, 15, N'20170306115', N'2017-03-06', N'7 6 9 5 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:30.087', '20170307 09:29:30.087')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (764, 15, N'20170306114', N'2017-03-06', N'3 1 6 8 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:30.220', '20170307 09:29:30.220')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (765, 15, N'20170306113', N'2017-03-06', N'5 6 4 0 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:30.343', '20170307 09:29:30.343')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (766, 15, N'20170306112', N'2017-03-06', N'8 4 5 5 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:30.460', '20170307 09:29:30.460')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (767, 15, N'20170306111', N'2017-03-06', N'3 6 7 4 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:30.587', '20170307 09:29:30.587')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (768, 15, N'20170306110', N'2017-03-06', N'7 1 5 8 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:30.740', '20170307 09:29:30.740')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (769, 15, N'20170306109', N'2017-03-06', N'4 6 3 4 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:30.860', '20170307 09:29:30.860')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (770, 15, N'20170306108', N'2017-03-06', N'9 2 3 6 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:31.053', '20170307 09:29:31.053')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (771, 15, N'20170306107', N'2017-03-06', N'9 1 4 7 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:31.177', '20170307 09:29:31.177')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (772, 15, N'20170306106', N'2017-03-06', N'0 8 1 9 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:31.303', '20170307 09:29:31.303')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (773, 15, N'20170306105', N'2017-03-06', N'6 7 8 6 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:31.430', '20170307 09:29:31.430')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (774, 15, N'20170306104', N'2017-03-06', N'4 0 3 7 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:31.560', '20170307 09:29:31.560')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (775, 15, N'20170306103', N'2017-03-06', N'9 0 0 5 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:31.720', '20170307 09:29:31.720')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (776, 15, N'20170306102', N'2017-03-06', N'0 2 8 0 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:31.900', '20170307 09:29:31.900')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (777, 15, N'20170306101', N'2017-03-06', N'7 7 6 9 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:32.037', '20170307 09:29:32.037')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (778, 15, N'20170306100', N'2017-03-06', N'8 6 2 6 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:32.163', '20170307 09:29:32.163')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (779, 15, N'20170306099', N'2017-03-06', N'6 8 1 5 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:32.303', '20170307 09:29:32.303')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (780, 15, N'20170306098', N'2017-03-06', N'7 0 7 9 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:32.493', '20170307 09:29:32.493')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (781, 15, N'20170306097', N'2017-03-06', N'2 4 2 2 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:32.687', '20170307 09:29:32.687')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (782, 15, N'20170306096', N'2017-03-06', N'7 5 0 6 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:32.903', '20170307 09:29:32.903')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (783, 15, N'20170306095', N'2017-03-06', N'7 6 6 0 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:33.277', '20170307 09:29:33.277')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (784, 15, N'20170306094', N'2017-03-06', N'8 0 0 7 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:33.403', '20170307 09:29:33.403')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (785, 15, N'20170306093', N'2017-03-06', N'9 5 8 3 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:33.567', '20170307 09:29:33.567')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (786, 15, N'20170306092', N'2017-03-06', N'5 7 4 1 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:33.703', '20170307 09:29:33.703')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (787, 15, N'20170306091', N'2017-03-06', N'7 2 2 8 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:33.883', '20170307 09:29:33.883')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (788, 15, N'20170306090', N'2017-03-06', N'8 1 8 0 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:34.017', '20170307 09:29:34.017')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (789, 15, N'20170306089', N'2017-03-06', N'8 2 1 1 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:34.147', '20170307 09:29:34.147')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (790, 15, N'20170306088', N'2017-03-06', N'2 2 7 4 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:34.287', '20170307 09:29:34.287')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (791, 15, N'20170306087', N'2017-03-06', N'0 8 2 1 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:34.420', '20170307 09:29:34.420')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (792, 15, N'20170306086', N'2017-03-06', N'1 7 4 6 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:34.580', '20170307 09:29:34.580')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (793, 15, N'20170306085', N'2017-03-06', N'2 4 1 8 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:34.740', '20170307 09:29:34.740')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (794, 15, N'20170306084', N'2017-03-06', N'5 2 1 3 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:34.877', '20170307 09:29:34.877')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (795, 15, N'20170306083', N'2017-03-06', N'8 5 4 3 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:35.047', '20170307 09:29:35.047')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (796, 15, N'20170306082', N'2017-03-06', N'0 1 5 8 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:35.190', '20170307 09:29:35.190')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (797, 15, N'20170306081', N'2017-03-06', N'2 4 9 3 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:35.367', '20170307 09:29:35.367')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (798, 15, N'20170306080', N'2017-03-06', N'1 7 3 6 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:35.513', '20170307 09:29:35.513')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (799, 15, N'20170306079', N'2017-03-06', N'5 4 5 2 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:35.660', '20170307 09:29:35.660')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (800, 15, N'20170306078', N'2017-03-06', N'2 3 1 2 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:35.790', '20170307 09:29:35.790')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (801, 15, N'20170306077', N'2017-03-06', N'7 3 7 7 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:35.933', '20170307 09:29:35.933')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (802, 15, N'20170306076', N'2017-03-06', N'1 9 8 7 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:36.083', '20170307 09:29:36.083')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (803, 15, N'20170306075', N'2017-03-06', N'8 9 5 4 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:36.240', '20170307 09:29:36.240')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (804, 15, N'20170306074', N'2017-03-06', N'6 3 2 1 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:36.430', '20170307 09:29:36.430')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (805, 15, N'20170306073', N'2017-03-06', N'2 2 0 5 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:36.703', '20170307 09:29:36.703')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (806, 15, N'20170306072', N'2017-03-06', N'0 9 1 6 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:36.893', '20170307 09:29:36.893')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (807, 15, N'20170306071', N'2017-03-06', N'2 1 9 0 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:37.120', '20170307 09:29:37.120')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (808, 15, N'20170306070', N'2017-03-06', N'2 8 3 8 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:37.310', '20170307 09:29:37.310')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (809, 15, N'20170306069', N'2017-03-06', N'5 9 0 9 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:37.667', '20170307 09:29:37.667')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (810, 15, N'20170306068', N'2017-03-06', N'8 1 8 2 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:37.993', '20170307 09:29:37.993')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (811, 15, N'20170306067', N'2017-03-06', N'4 5 8 3 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:38.243', '20170307 09:29:38.243')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (812, 15, N'20170306066', N'2017-03-06', N'6 8 5 0 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:38.403', '20170307 09:29:38.403')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (813, 15, N'20170306065', N'2017-03-06', N'1 3 4 9 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:38.557', '20170307 09:29:38.557')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (814, 15, N'20170306064', N'2017-03-06', N'0 3 5 8 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:38.703', '20170307 09:29:38.703')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (815, 15, N'20170306063', N'2017-03-06', N'5 3 9 3 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:38.827', '20170307 09:29:38.827')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (816, 15, N'20170306062', N'2017-03-06', N'3 0 0 8 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:38.947', '20170307 09:29:38.947')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (817, 15, N'20170306061', N'2017-03-06', N'4 4 3 4 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:39.090', '20170307 09:29:39.090')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (818, 15, N'20170306060', N'2017-03-06', N'8 4 9 2 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:39.230', '20170307 09:29:39.230')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (819, 15, N'20170306059', N'2017-03-06', N'7 6 7 7 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:39.370', '20170307 09:29:39.370')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (820, 15, N'20170306058', N'2017-03-06', N'4 6 6 8 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:39.520', '20170307 09:29:39.520')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (821, 15, N'20170306057', N'2017-03-06', N'4 8 9 1 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:39.693', '20170307 09:29:39.693')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (822, 15, N'20170306056', N'2017-03-06', N'7 6 3 6 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:39.837', '20170307 09:29:39.837')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (823, 15, N'20170306055', N'2017-03-06', N'9 3 6 3 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:39.967', '20170307 09:29:39.967')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (824, 15, N'20170306054', N'2017-03-06', N'9 5 1 7 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:40.113', '20170307 09:29:40.113')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (825, 15, N'20170306053', N'2017-03-06', N'0 1 8 1 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:40.250', '20170307 09:29:40.250')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (826, 15, N'20170306052', N'2017-03-06', N'7 8 8 5 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:40.383', '20170307 09:29:40.383')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (827, 15, N'20170306051', N'2017-03-06', N'4 2 6 9 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:40.510', '20170307 09:29:40.510')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (828, 15, N'20170306050', N'2017-03-06', N'1 6 5 8 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:40.650', '20170307 09:29:40.650')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (829, 15, N'20170306049', N'2017-03-06', N'4 3 6 4 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:40.793', '20170307 09:29:40.793')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (830, 15, N'20170306048', N'2017-03-06', N'1 8 6 0 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:40.943', '20170307 09:29:40.943')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (831, 15, N'20170306047', N'2017-03-06', N'3 2 0 5 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:41.073', '20170307 09:29:41.073')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (832, 15, N'20170306046', N'2017-03-06', N'6 4 5 2 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:41.197', '20170307 09:29:41.197')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (833, 15, N'20170306045', N'2017-03-06', N'8 3 7 2 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:41.327', '20170307 09:29:41.327')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (834, 15, N'20170306044', N'2017-03-06', N'8 6 2 9 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:41.497', '20170307 09:29:41.497')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (835, 15, N'20170306043', N'2017-03-06', N'0 1 0 3 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:41.903', '20170307 09:29:41.903')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (836, 15, N'20170306042', N'2017-03-06', N'7 1 4 5 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:42.343', '20170307 09:29:42.343')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (837, 15, N'20170306041', N'2017-03-06', N'0 6 3 9 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:42.483', '20170307 09:29:42.483')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (838, 15, N'20170306040', N'2017-03-06', N'8 5 6 5 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:42.623', '20170307 09:29:42.623')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (839, 15, N'20170306039', N'2017-03-06', N'5 1 2 5 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:42.797', '20170307 09:29:42.797')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (840, 15, N'20170306038', N'2017-03-06', N'1 4 6 7 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:42.947', '20170307 09:29:42.947')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (841, 15, N'20170306037', N'2017-03-06', N'1 4 4 1 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:43.070', '20170307 09:29:43.070')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (842, 15, N'20170306036', N'2017-03-06', N'6 9 1 0 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:43.197', '20170307 09:29:43.197')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (843, 15, N'20170306035', N'2017-03-06', N'1 6 4 3 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:43.337', '20170307 09:29:43.337')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (844, 15, N'20170306034', N'2017-03-06', N'6 0 9 6 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:43.553', '20170307 09:29:43.553')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (845, 15, N'20170306033', N'2017-03-06', N'6 1 8 4 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:43.857', '20170307 09:29:43.857')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (846, 15, N'20170306032', N'2017-03-06', N'7 6 4 8 0', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:44.020', '20170307 09:29:44.020')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (847, 15, N'20170306031', N'2017-03-06', N'8 3 5 4 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:44.247', '20170307 09:29:44.247')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (848, 15, N'20170306030', N'2017-03-06', N'6 4 4 9 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:44.393', '20170307 09:29:44.393')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (849, 15, N'20170306029', N'2017-03-06', N'3 0 8 7 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:44.543', '20170307 09:29:44.543')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (850, 15, N'20170306028', N'2017-03-06', N'9 1 1 6 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:44.700', '20170307 09:29:44.700')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (851, 15, N'20170306027', N'2017-03-06', N'7 9 6 6 2', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:44.880', '20170307 09:29:44.880')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (852, 15, N'20170306026', N'2017-03-06', N'0 2 4 2 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:45.080', '20170307 09:29:45.080')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (853, 15, N'20170306025', N'2017-03-06', N'9 7 1 7 1', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:45.323', '20170307 09:29:45.323')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (854, 15, N'20170306024', N'2017-03-06', N'1 3 6 5 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:45.490', '20170307 09:29:45.490')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (855, 15, N'20170306023', N'2017-03-06', N'2 4 2 1 7', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:45.633', '20170307 09:29:45.633')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (856, 15, N'20170306022', N'2017-03-06', N'0 4 0 9 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:45.760', '20170307 09:29:45.760')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (857, 15, N'20170306021', N'2017-03-06', N'7 1 4 7 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:45.900', '20170307 09:29:45.900')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (858, 15, N'20170306020', N'2017-03-06', N'2 5 9 9 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:46.027', '20170307 09:29:46.027')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (859, 15, N'20170306019', N'2017-03-06', N'1 8 6 9 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:46.147', '20170307 09:29:46.147')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (860, 15, N'20170306018', N'2017-03-06', N'9 5 0 9 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:46.290', '20170307 09:29:46.290')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (861, 15, N'20170306017', N'2017-03-06', N'4 9 5 0 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:46.420', '20170307 09:29:46.420')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (862, 15, N'20170306016', N'2017-03-06', N'0 3 5 2 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:46.550', '20170307 09:29:46.550')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (863, 15, N'20170306015', N'2017-03-06', N'7 7 0 3 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:46.700', '20170307 09:29:46.700')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (864, 15, N'20170306014', N'2017-03-06', N'0 8 8 6 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:46.883', '20170307 09:29:46.883')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (865, 15, N'20170306013', N'2017-03-06', N'5 4 3 6 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:47.033', '20170307 09:29:47.033')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (866, 15, N'20170306012', N'2017-03-06', N'3 0 0 8 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:47.170', '20170307 09:29:47.170')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (867, 15, N'20170306011', N'2017-03-06', N'6 5 7 2 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:47.303', '20170307 09:29:47.303')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (868, 15, N'20170306010', N'2017-03-06', N'7 4 2 7 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:47.437', '20170307 09:29:47.437')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (869, 15, N'20170306009', N'2017-03-06', N'2 9 3 4 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:47.583', '20170307 09:29:47.583')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (870, 15, N'20170306008', N'2017-03-06', N'7 1 2 8 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:47.723', '20170307 09:29:47.723')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (871, 15, N'20170306007', N'2017-03-06', N'8 7 7 2 6', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:47.870', '20170307 09:29:47.870')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (872, 15, N'20170306006', N'2017-03-06', N'0 7 9 7 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:48.010', '20170307 09:29:48.010')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (873, 15, N'20170306005', N'2017-03-06', N'5 5 9 3 9', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:48.140', '20170307 09:29:48.140')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (874, 15, N'20170306004', N'2017-03-06', N'6 5 7 2 8', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:48.283', '20170307 09:29:48.283')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (875, 15, N'20170306003', N'2017-03-06', N'2 9 6 4 4', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:48.550', '20170307 09:29:48.550')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (876, 15, N'20170306002', N'2017-03-06', N'1 7 7 7 5', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:48.980', '20170307 09:29:48.980')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (877, 15, N'20170306001', N'2017-03-06', N'1 5 1 0 3', N'', NULL, N'0', N'', N'', N'', N'', N'', N'', 1, '20170307 09:29:49.110', '20170307 09:29:49.110')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (878, 1, N'2017032', N'2017-03-21（二）', N'050815242731 11', N'', N'346,410,188元', N'609,910,623元', N'63', N'5000000', N'284', N'6000', N'', N'', 1, '20170327 14:25:29.227', '20170322 14:01:16.380')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (879, 1, N'2017031', N'2017-03-19（日）', N'061016262729 03', N'', N'377,406,752元', N'924,910,650元', N'30', N'5458217', N'344', N'49951', N'', N'', 1, '20170327 14:26:31.380', '20170322 14:01:16.550')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (880, 1, N'2017030', N'2017-03-16（四）', N'010709202330 02', N'', N'350,487,064元', N'1,037,107,695元', N'5', N'9250716', N'81', N'327987', N'', N'', 1, '20170327 14:26:32.847', '20170322 14:01:16.713')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (881, 1, N'2017029', N'2017-03-14（二）', N'021521232530 10', N'', N'343,011,048元', N'1,003,660,344元', N'4', N'9172154', N'53', N'393599', N'', N'', 1, '20170327 14:26:35.780', '20170322 14:01:16.870')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (882, 1, N'2017028', N'2017-03-12（日）', N'070812132230 09', N'', N'377,657,484元', N'977,766,651元', N'9', N'6700085', N'152', N'125828', N'', N'', 1, '20170327 14:26:37.240', '20170322 14:01:17.023')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (883, 1, N'2017027', N'2017-03-09（四）', N'020411142730 05', N'', N'344,767,540元', N'980,689,536元', N'3', N'9954368', N'76', N'244458', N'', N'', 1, '20170327 14:27:09.940', '20170322 14:01:17.160')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (884, 1, N'2017026', N'2017-03-07（二）', N'031012192730 08', N'', N'338,217,710元', N'954,816,000元', N'30', N'5346265', N'385', N'33727', N'', N'', 1, '20170327 14:27:11.727', '20170322 14:01:17.283')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (885, 1, N'2017034', N'2017-03-26（日）', N'040708193233 13', N'', N'373,962,682元', N'618,519,064元', N'8', N'7191847', N'146', N'150126', N'', N'', 1, '20170327 14:24:55.433', '20170327 14:17:25.320')
GO

INSERT INTO [dbo].[LotteryHistory] ([ItemId], [LotteryType], [LotterySeq], [LotteryDate], [LotteryString], [LotteryStringTry], [TotalMoney], [LotteryMoney], [Lottery1Num], [Lottery1NumString], [Lottery2Num], [Lottery2NumString], [Lottery3Num], [Lottery3NumString], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (886, 1, N'2017033', N'2017-03-23（四）', N'050715202330 15', N'', N'346,477,046元', N'610,298,424元', N'12', N'6829933', N'205', N'133897', N'', N'', 1, '20170327 14:24:57.963', '20170327 14:22:22.387')
GO

SET IDENTITY_INSERT [dbo].[LotteryHistory] OFF
GO

--
-- Data for table dbo.LotteryType  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[LotteryType] ON
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, 1, N'双色球', N'奖池百万元', 1, N'福利彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing1.png', N'2', 2, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, 5, N'福彩3D', N'轻松三个数', 1, N'福利彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing23.png', N'2', 1, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, 4, N'七乐彩', N'富翁生产线', 1, N'福利彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing4.png', N'2', 1, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, NULL, N'新3D', N'新玩法', 1, N'福利彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing2.png', N'2', 0, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (5, 2, N'大乐透', N'喜迎千万大奖', 2, N'体育彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing2.png', N'2', 1, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (6, 3, N'七星彩', N'奖池2000元', 2, N'体育彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing3.png', N'2', 1, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (7, 6, N'排列3', N'每天博头彩', 2, N'体育彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing31.png', N'2', 1, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (8, 7, N'排列5', N'每天开大奖', 2, N'体育彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing32.png', N'2', 1, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (9, NULL, N'14场胜负彩', N'14场胜负彩', 2, N'体育彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing34.png', N'2', 0, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (10, 8, N'任选9场', N'最高赢500万', 2, N'体育彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing33.png', N'2', 1, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (11, NULL, N'四场进球', N'四场进球', 2, N'体育彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing33.png', N'2', 0, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (12, NULL, N'六场半全场', N'六场半全场', 2, N'体育彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing33.png', N'2', 0, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (13, NULL, N'22选5', N'22选5', 2, N'体育彩票', N'http://www.ycmedia.cn/lottery/static/img/leixing33.png', N'2', 0, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (14, 9, N'新11选5', N'超高中奖率111', 3, N'高频彩种', N'http://www.ycmedia.cn/lottery/static/img/leixing33.png', N'2', 1, '20170316 19:02:14.273', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (15, NULL, N'时时彩', N'时时彩', 3, N'高频彩种', N'http://www.ycmedia.cn/lottery/static/img/leixing33.png', N'2', 0, '20170309', '20170309')
GO

INSERT INTO [dbo].[LotteryType] ([TypeId], [SeqNum], [TypeName], [Tips], [ParentId], [ParentName], [LogoUrl], [Price], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (16, 111111, N'ooooooooooo', N'ooooooooooo', 3, N'高频彩种', N'http://www.ycmedia.cn/lottery/static/img/leixing2.png', N'2', 0, '20170316 19:03:38.870', '20170316 19:03:38.870')
GO

SET IDENTITY_INSERT [dbo].[LotteryType] OFF
GO

--
-- Data for table dbo.Page  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[Page] ON
GO

INSERT INTO [dbo].[Page] ([PageId], [PageName], [PageGroupName], [PagePath], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, N'后台用户管理', N'系统管理', N'/userlist', 1, '20170309 14:45:39.783', '20170309 14:44:14.937')
GO

INSERT INTO [dbo].[Page] ([PageId], [PageName], [PageGroupName], [PagePath], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, N'角色管理', N'系统管理', N'/rolelist', 1, '20170310 16:02:29.700', '20170310 16:02:29.700')
GO

INSERT INTO [dbo].[Page] ([PageId], [PageName], [PageGroupName], [PagePath], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, N'页面管理', N'系统管理', N'/pagelist', 1, '20170310 16:02:51.603', '20170310 16:02:51.603')
GO

INSERT INTO [dbo].[Page] ([PageId], [PageName], [PageGroupName], [PagePath], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, N'权限管理', N'系统管理', N'/rolePagelist', 1, '20170310 16:03:50.480', '20170310 16:03:09.950')
GO

SET IDENTITY_INSERT [dbo].[Page] OFF
GO

--
-- Data for table dbo.Role  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[Role] ON
GO

INSERT INTO [dbo].[Role] ([RoleId], [RoleName], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, N'管理员', 1, '20170309 10:36:02.307', '20170309 10:36:02.307')
GO

INSERT INTO [dbo].[Role] ([RoleId], [RoleName], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, N'开发人员', 1, '20170309 15:49:45.437', '20170309 15:49:45.437')
GO

INSERT INTO [dbo].[Role] ([RoleId], [RoleName], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, N'运营人员', 1, '20170309 15:49:53.400', '20170309 15:49:53.400')
GO

INSERT INTO [dbo].[Role] ([RoleId], [RoleName], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, N'测试人员', 1, '20170310 15:46:57.647', '20170310 15:46:57.647')
GO

SET IDENTITY_INSERT [dbo].[Role] OFF
GO

--
-- Data for table dbo.RolePage  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[RolePage] ON
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, 1, 1, 1, '20170310 15:39:18.243', '20170310 15:39:18.243')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, 3, 1, 1, '20170310 15:55:56.940', '20170310 15:55:41.323')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, 1, 4, 1, '20170310 16:04:11.587', '20170310 16:03:26.193')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, 1, 2, 1, '20170310 16:22:45.210', '20170310 16:22:45.210')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (5, 1, 3, 1, '20170310 16:22:47.957', '20170310 16:22:47.957')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (6, 4, 2, 1, '20170310 19:55:07.640', '20170310 19:55:07.640')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (7, 4, 4, 1, '20170310 19:55:07.640', '20170310 19:55:07.640')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (8, 4, 2, 1, '20170310 19:58:37.673', '20170310 19:58:37.673')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (9, 4, 4, 1, '20170310 19:58:37.673', '20170310 19:58:37.673')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (10, 3, 3, 1, '20170313 14:52:08.533', '20170313 14:52:08.533')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (11, 3, 2, 1, '20170313 14:55:02.563', '20170313 14:55:02.563')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (12, 3, 3, 1, '20170313 14:56:25.653', '20170313 14:56:25.653')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (13, 3, 4, 1, '20170313 14:59:17.327', '20170313 14:59:17.327')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (14, 3, 3, 1, '20170313 15:00:42.783', '20170313 15:00:42.783')
GO

INSERT INTO [dbo].[RolePage] ([Id], [RoleId], [PageId], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (15, 1, 2, 1, '20170313 15:01:51.410', '20170313 15:01:51.410')
GO

SET IDENTITY_INSERT [dbo].[RolePage] OFF
GO

--
-- Data for table dbo.t_plan_keyword  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[t_plan_keyword] ON
GO

INSERT INTO [dbo].[t_plan_keyword] ([ItemId], [keyword])
VALUES 
  (1, N'test20170308.....')
GO

INSERT INTO [dbo].[t_plan_keyword] ([ItemId], [keyword])
VALUES 
  (2, N'test20170308.....')
GO

SET IDENTITY_INSERT [dbo].[t_plan_keyword] OFF
GO

--
-- Data for table sys.trace_xe_action_map  (LIMIT 0,500)
--

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (3, N'sqlserver', N'database_id')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (4, N'sqlserver', N'transaction_id')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (5, N'sqlserver', N'tsql_frame')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (6, N'sqlserver', N'nt_username')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (7, N'sqlserver', N'nt_username')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (8, N'sqlserver', N'client_hostname')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (9, N'sqlserver', N'client_pid')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (10, N'sqlserver', N'client_app_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (11, N'sqlserver', N'server_principal_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (12, N'sqlserver', N'session_id')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (26, N'sqlserver', N'server_instance_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (35, N'sqlserver', N'database_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (41, N'sqlserver', N'server_principal_sid')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (49, N'sqlserver', N'request_id')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (50, N'sqlserver', N'transaction_sequence')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (51, N'package0', N'event_sequence')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (60, N'sqlserver', N'is_system')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (61, N'sqlserver', N'tsql_frame')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (63, N'sqlserver', N'tsql_frame')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (64, N'sqlserver', N'session_server_principal_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (65, N'sqlserver', N'plan_handle')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (66, N'sqlserver', N'session_resource_group_id')
GO

--
-- Data for table sys.trace_xe_event_map  (LIMIT 0,500)
--

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (10, N'sqlserver', N'rpc_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (11, N'sqlserver', N'rpc_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (12, N'sqlserver', N'sql_batch_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (13, N'sqlserver', N'sql_batch_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (14, N'sqlserver', N'login')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (15, N'sqlserver', N'logout')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (16, N'sqlserver', N'attention')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (17, N'sqlserver', N'existing_connection')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (18, N'sqlserver', N'server_start_stop')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (19, N'sqlserver', N'dtc_transaction')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (21, N'sqlserver', N'error_reported')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (22, N'sqlserver', N'errorlog_written')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (23, N'sqlserver', N'lock_released')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (24, N'sqlserver', N'lock_acquired')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (25, N'sqlserver', N'lock_deadlock')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (26, N'sqlserver', N'lock_cancel')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (27, N'sqlserver', N'lock_timeout')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (28, N'sqlserver', N'degree_of_parallelism')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (33, N'sqlos', N'exception_ring_buffer_recorded')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (34, N'sqlserver', N'sp_cache_miss')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (35, N'sqlserver', N'sp_cache_insert')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (36, N'sqlserver', N'sp_cache_remove')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (37, N'sqlserver', N'sql_statement_recompile')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (38, N'sqlserver', N'sp_cache_hit')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (40, N'sqlserver', N'sql_statement_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (41, N'sqlserver', N'sql_statement_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (42, N'sqlserver', N'module_start')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (43, N'sqlserver', N'module_end')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (44, N'sqlserver', N'sp_statement_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (45, N'sqlserver', N'sp_statement_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (46, N'sqlserver', N'object_created')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (47, N'sqlserver', N'object_deleted')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (50, N'sqlserver', N'sql_transaction')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (51, N'sqlserver', N'scan_started')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (52, N'sqlserver', N'scan_stopped')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (53, N'sqlserver', N'cursor_open')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (54, N'sqlserver', N'transaction_log')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (55, N'sqlserver', N'hash_warning')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (58, N'sqlserver', N'auto_stats')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (59, N'sqlserver', N'lock_deadlock_chain')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (60, N'sqlserver', N'lock_escalation')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (61, N'sqlserver', N'oledb_error')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (67, N'sqlserver', N'execution_warning')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (68, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (69, N'sqlserver', N'sort_warning')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (70, N'sqlserver', N'cursor_prepare')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (71, N'sqlserver', N'prepare_sql')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (72, N'sqlserver', N'exec_prepared_sql')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (73, N'sqlserver', N'unprepare_sql')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (74, N'sqlserver', N'cursor_execute')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (75, N'sqlserver', N'cursor_recompile')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (76, N'sqlserver', N'cursor_implicit_conversion')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (77, N'sqlserver', N'cursor_unprepare')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (78, N'sqlserver', N'cursor_close')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (79, N'sqlserver', N'missing_column_statistics')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (80, N'sqlserver', N'missing_join_predicate')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (81, N'sqlserver', N'server_memory_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (82, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (83, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (84, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (85, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (86, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (87, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (88, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (89, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (90, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (91, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (92, N'sqlserver', N'database_file_size_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (93, N'sqlserver', N'database_file_size_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (94, N'sqlserver', N'database_file_size_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (95, N'sqlserver', N'database_file_size_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (96, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (97, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (98, N'sqlserver', N'query_post_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (100, N'sqlserver', N'rpc_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (119, N'sqlserver', N'oledb_call')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (120, N'sqlserver', N'oledb_query_interface')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (121, N'sqlserver', N'oledb_data_read')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (122, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (124, N'sqlserver', N'broker_conversation')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (125, N'sqlserver', N'deprecation_announcement')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (126, N'sqlserver', N'deprecation_final_support')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (127, N'sqlserver', N'exchange_spill')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (136, N'sqlserver', N'broker_conversation_group')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (137, N'sqlserver', N'blocked_process_report')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (138, N'ucs', N'ucs_connection_setup')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (139, N'sqlserver', N'broker_forwarded_message_sent')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (140, N'sqlserver', N'broker_forwarded_message_dropped')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (141, N'sqlserver', N'broker_message_classify')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (142, N'sqlserver', N'broker_transmission_exception')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (143, N'sqlserver', N'broker_queue_disabled')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (144, N'sqlserver', N'broker_mirrored_route_state_changed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (146, N'sqlserver', N'query_post_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (148, N'sqlserver', N'xml_deadlock_report')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (149, N'sqlserver', N'broker_remote_message_acknowledgement')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (151, N'ucs', N'ucs_connection_setup')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (155, N'sqlserver', N'full_text_crawl_started')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (156, N'sqlserver', N'full_text_crawl_stopped')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (157, N'sqlserver', N'error_reported')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (160, N'sqlserver', N'broker_message_undeliverable')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (161, N'sqlserver', N'broker_corrupted_message')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (162, N'sqlserver', N'error_reported')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (163, N'sqlserver', N'broker_activation')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (164, N'sqlserver', N'object_altered')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (165, N'sqlserver', N'query_cache_removal_statistics')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (165, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (165, N'sqlserver', N'uncached_sql_batch_statistics')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (166, N'sqlserver', N'sql_statement_recompile')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (167, N'sqlserver', N'database_mirroring_state_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (168, N'sqlserver', N'query_post_compilation_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (169, N'sqlserver', N'query_post_compilation_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (181, N'sqlserver', N'begin_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (182, N'sqlserver', N'begin_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (183, N'sqlserver', N'promote_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (184, N'sqlserver', N'promote_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (185, N'sqlserver', N'commit_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (186, N'sqlserver', N'commit_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (187, N'sqlserver', N'rollback_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (188, N'sqlserver', N'rollback_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (189, N'sqlserver', N'lock_timeout_greater_than_0')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (190, N'sqlserver', N'progress_report_online_index_operation')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (191, N'sqlserver', N'save_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (192, N'sqlserver', N'save_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (193, N'sqlserver', N'background_job_error')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (194, N'sqlserver', N'oledb_provider_information')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (196, N'sqlserver', N'assembly_load')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (198, N'sqlserver', N'xquery_static_type')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (199, N'sqlserver', N'qn_subscription')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (200, N'sqlserver', N'qn_parameter_table')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (201, N'sqlserver', N'qn_template')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (202, N'sqlserver', N'qn_dynamics')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (212, N'sqlserver', N'bitmap_disabled_warning')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (213, N'sqlserver', N'database_suspect_data_page')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (214, N'sqlserver', N'cpu_threshold_exceeded')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (215, N'sqlserver', N'preconnect_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (216, N'sqlserver', N'preconnect_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (217, N'sqlserver', N'plan_guide_successful')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (218, N'sqlserver', N'plan_guide_unsuccessful')
GO

--
-- Data for table dbo.UserAccount  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[UserAccount] ON
GO

INSERT INTO [dbo].[UserAccount] ([AccountId], [UserId], [UserBalance], [FreezeMoney], [IDCardNum], [IDCardUrlP], [IDCardUrlN], [IsRealNA], [IsBindBankCard], [PayPwd], [CurState], [UpdateTime], [CreateTime], [RealName])
VALUES 
  (1, 1, N'12546345', N'0', N'2014236489521354601', NULL, NULL, 1, 1, NULL, 1, '20170325 10:26:48.470', '20170303', N'张三')
GO

SET IDENTITY_INSERT [dbo].[UserAccount] OFF
GO

--
-- Data for table dbo.UserBankCard  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[UserBankCard] ON
GO

INSERT INTO [dbo].[UserBankCard] ([BankCardId], [BankName], [BankAddress], [CardNum], [MobilePhone], [CurState], [UpdateTime], [CreateTime], [AccountId])
VALUES 
  (2, N'中国农业银行', N'上海漕河泾农业银行支行', N'622848  025042999 0000', N'13000000000', 0, '20170324 14:13:29.257', '20170324 14:13:29.257', 1)
GO

INSERT INTO [dbo].[UserBankCard] ([BankCardId], [BankName], [BankAddress], [CardNum], [MobilePhone], [CurState], [UpdateTime], [CreateTime], [AccountId])
VALUES 
  (10, N'中国农业银行', N'上海漕河泾农业银行支行', N'622848  025042999 0000', N'13000000000', 0, '20170325 10:09:32.800', '20170325 10:09:32.800', 1)
GO

INSERT INTO [dbo].[UserBankCard] ([BankCardId], [BankName], [BankAddress], [CardNum], [MobilePhone], [CurState], [UpdateTime], [CreateTime], [AccountId])
VALUES 
  (11, N'中国农业银行', N'上海漕河泾农业银行支行', N'622848  025042999 0000', N'13000000000', 0, '20170325 10:10:03.793', '20170325 10:10:03.793', 1)
GO

INSERT INTO [dbo].[UserBankCard] ([BankCardId], [BankName], [BankAddress], [CardNum], [MobilePhone], [CurState], [UpdateTime], [CreateTime], [AccountId])
VALUES 
  (12, N'中国农业银行', N'上海漕河泾农业银行支行', N'622848  025042999 0000', N'13000000000', 0, '20170325 10:10:28.710', '20170325 10:10:28.710', 1)
GO

INSERT INTO [dbo].[UserBankCard] ([BankCardId], [BankName], [BankAddress], [CardNum], [MobilePhone], [CurState], [UpdateTime], [CreateTime], [AccountId])
VALUES 
  (13, N'中国农业银行', N'上海漕河泾农业银行支行', N'622848  025042999 0000', N'13000000000', 0, '20170325 10:26:29.287', '20170325 10:26:29.287', 1)
GO

INSERT INTO [dbo].[UserBankCard] ([BankCardId], [BankName], [BankAddress], [CardNum], [MobilePhone], [CurState], [UpdateTime], [CreateTime], [AccountId])
VALUES 
  (14, N'中国农业银行', N'上海漕河泾农业银行支行', N'622848  025042999 0000', N'13000000000', 0, '20170325 10:26:48.313', '20170325 10:26:48.313', 1)
GO

SET IDENTITY_INSERT [dbo].[UserBankCard] OFF
GO

--
-- Data for table dbo.UserInfo  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[UserInfo] ON
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, N'13000000000', N'路飞', NULL, N'TF2pGiEkPcLPn7P5IlV2JA==', N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488455489168&di=c61cc5e58e6646507074d05e9b2fc87f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D9e0247ce2a381f309e198da199004c67%2Ff3de1f30e924b899a92c0cce6c061d950b7bf61e.jpg', 1, '20170303', '20170303')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, N'12345678911', N'a', N'0', N'TF2pGiEkPcLPn7P5IlV2JA==', N'http://180.97.75.144:8035/hig/201703160548289731.png', 1, '20170316 17:50:36.030', '20170303')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, N'12345678963', N'b', N'100', N'TF2pGiEkPcLPn7P5IlV2JA==', N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488455489168&di=c61cc5e58e6646507074d05e9b2fc87f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D9e0247ce2a381f309e198da199004c67%2Ff3de1f30e924b899a92c0cce6c061d950b7bf61e.jpg', 1, '20170308 15:27:06.177', '20170308 15:27:06.177')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, N'12345678542', N'c', N'1000.00', N'TF2pGiEkPcLPn7P5IlV2JA==', N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488455489168&di=c61cc5e58e6646507074d05e9b2fc87f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D9e0247ce2a381f309e198da199004c67%2Ff3de1f30e924b899a92c0cce6c061d950b7bf61e.jpg', 1, '20170308 17:59:50.067', '20170308 15:31:18.177')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (5, N'14785232144', N'd', N'10', N'TF2pGiEkPcLPn7P5IlV2JA==', N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488455489168&di=c61cc5e58e6646507074d05e9b2fc87f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D9e0247ce2a381f309e198da199004c67%2Ff3de1f30e924b899a92c0cce6c061d950b7bf61e.jpg', 0, '20170308 17:27:34.853', '20170308 15:50:41.857')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (6, N'12345678912', N'NaN-NaN-NaN', N'1.00', N'TF2pGiEkPcLPn7P5IlV2JA==', N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488455489168&di=c61cc5e58e6646507074d05e9b2fc87f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D9e0247ce2a381f309e198da199004c67%2Ff3de1f30e924b899a92c0cce6c061d950b7bf61e.jpg', 0, '20170308 17:07:00.430', '20170308 15:52:47.533')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (7, N'12335434653', N'f', N'12.00', N'TF2pGiEkPcLPn7P5IlV2JA==', N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488455489168&di=c61cc5e58e6646507074d05e9b2fc87f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D9e0247ce2a381f309e198da199004c67%2Ff3de1f30e924b899a92c0cce6c061d950b7bf61e.jpg', 1, '20170315 16:23:25.940', '20170308 17:28:00.043')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (8, N'13000000001', N'sss', N'ssss', N'TF2pGiEkPcLPn7P5IlV2JA==', N'http://localhost:8080//abcd/201703150516268829.jpeg', 1, '20170315 17:15:50.433', '20170313 17:15:34.413')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (9, N'12345678911', N'd', N'ddd', NULL, N'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488455489168&di=c61cc5e58e6646507074d05e9b2fc87f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D9e0247ce2a381f309e198da199004c67%2Ff3de1f30e924b899a92c0cce6c061d950b7bf61e.jpg', 0, '20170314 12:04:14.660', '20170314 12:04:00.750')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (10, N'13870814611', N'皮皮虾11', N'', N'RazkEsYWrIg=', N'http://180.97.75.144:8035/hig/201703290152182578.jpg', 1, '20170329 14:09:59.650', '20170314 14:21:06.377')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (11, N'13870814611', NULL, NULL, N'3qKd5R0fT3Ycht5pTz0MUz2V7zn2Tj4enfxvfsBLPbMbqoUsjO4wRg==', NULL, 1, '20170314 16:07:01.123', '20170314 16:07:01.123')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (12, N'13870814666', NULL, NULL, N'3qKd5R0fT3Ycht5pTz0MUz2V7zn2Tj4enfxvfsBLPbMbqoUsjO4wRg==', NULL, 1, '20170317 09:54:44.547', '20170317 09:54:44.547')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (13, N'13600000000', NULL, NULL, N'NgKutvopz9E1ZCh2xpH+9l1SwPbUkMx2vG11jlcGuN0bqoUsjO4wRg==', NULL, 1, '20170317 15:22:08.163', '20170317 15:22:08.163')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (14, N'13000000007', NULL, NULL, N'7IKInkuQYu4=', NULL, 1, '20170317 16:02:02.017', '20170317 16:02:02.017')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (15, N'13870814622', NULL, NULL, N'3qKd5R0fT3Ycht5pTz0MUz2V7zn2Tj4enfxvfsBLPbMbqoUsjO4wRg==', N'http://180.97.75.144:8035/hig/201703170423459224.png', 1, '20170317 16:25:52.117', '20170317 16:07:16.320')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (16, N'13000000007', NULL, NULL, N'7IKInkuQYu4=', NULL, 1, '20170317 16:10:35.587', '20170317 16:10:35.587')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (17, N'13000000008', NULL, NULL, N'7IKInkuQYu4=', NULL, 1, '20170317 16:14:51.083', '20170317 16:14:51.083')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (18, N'13566666666', NULL, NULL, N'5itb0HR2SJZRMbMJBuj98ZMKuvndNSayfBpIqpbhrLcbqoUsjO4wRg==', NULL, 1, '20170320 17:46:19.653', '20170320 17:46:19.653')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (19, N'12301230123', NULL, NULL, N'5itb0HR2SJZRMbMJBuj98ZMKuvndNSayfBpIqpbhrLcbqoUsjO4wRg==', NULL, 1, '20170321 10:10:19.843', '20170321 10:10:19.843')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (20, N'12301230124', NULL, NULL, N'5itb0HR2SJZRMbMJBuj98ZMKuvndNSayfBpIqpbhrLcbqoUsjO4wRg==', NULL, 1, '20170321 10:45:50.990', '20170321 10:45:50.990')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (21, N'13000000022', NULL, NULL, N'5itb0HR2SJZRMbMJBuj98ZMKuvndNSayfBpIqpbhrLcbqoUsjO4wRg==', NULL, 1, '20170321 17:08:09.800', '20170321 17:08:09.800')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (22, N'13000000022', NULL, NULL, N'5itb0HR2SJZRMbMJBuj98ZMKuvndNSayfBpIqpbhrLcbqoUsjO4wRg==', NULL, 1, '20170321 17:08:31.283', '20170321 17:08:31.283')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (23, N'13870814612', NULL, NULL, N'3qKd5R0fT3Ycht5pTz0MUz2V7zn2Tj4enfxvfsBLPbMbqoUsjO4wRg==', NULL, 1, '20170323 09:22:18.100', '20170323 09:22:18.100')
GO

INSERT INTO [dbo].[UserInfo] ([UserId], [MobilePhone], [NickName], [LoginAccount], [LoginPwd], [LogoUrl], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (24, N'13000000030', N'FatPaul', NULL, N'5itb0HR2SJZRMbMJBuj98ZMKuvndNSayfBpIqpbhrLcbqoUsjO4wRg==', N'http://180.97.75.144:8035/hig/201703230144476527.jpg', 1, '20170323 13:47:05.620', '20170323 09:23:03.030')
GO

SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO

--
-- Data for table dbo.UserMoneyDetail  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[UserMoneyDetail] ON
GO

INSERT INTO [dbo].[UserMoneyDetail] ([DetailId], [Currentdate], [UserId], [TypeId], [TypeDetailId], [LotteryTypeId], [Money], [Remark], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, N'2017-03-03', 1, 2, 5, 1, N'-2', N'投注双色球', 1, '20170303', '20170303')
GO

INSERT INTO [dbo].[UserMoneyDetail] ([DetailId], [Currentdate], [UserId], [TypeId], [TypeDetailId], [LotteryTypeId], [Money], [Remark], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, N'2017-03-02', 1, 2, 5, 1, N'-2', N'投注双色球', 1, '20170302', '20170302')
GO

INSERT INTO [dbo].[UserMoneyDetail] ([DetailId], [Currentdate], [UserId], [TypeId], [TypeDetailId], [LotteryTypeId], [Money], [Remark], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, N'2017-03-24', 1, 1, 1, 0, N'50', N'2.24充值', 0, '20170324 14:48:09.183', '20170324 14:48:09.183')
GO

INSERT INTO [dbo].[UserMoneyDetail] ([DetailId], [Currentdate], [UserId], [TypeId], [TypeDetailId], [LotteryTypeId], [Money], [Remark], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, N'2017-03-24', 1, 1, 1, 0, N'50', N'2.24充值', 0, '20170324 14:49:03.910', '20170324 14:49:03.910')
GO

INSERT INTO [dbo].[UserMoneyDetail] ([DetailId], [Currentdate], [UserId], [TypeId], [TypeDetailId], [LotteryTypeId], [Money], [Remark], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (5, N'2017-03-24', 1, 1, 1, 0, N'-50', N'2.24提现', 0, '20170324 14:50:01.323', '20170324 14:50:01.323')
GO

INSERT INTO [dbo].[UserMoneyDetail] ([DetailId], [Currentdate], [UserId], [TypeId], [TypeDetailId], [LotteryTypeId], [Money], [Remark], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (6, N'2017-03-25', 1, 1, 1, 0, N'-50', N'2.24提现', 0, '20170325 09:45:53.723', '20170325 09:45:53.723')
GO

INSERT INTO [dbo].[UserMoneyDetail] ([DetailId], [Currentdate], [UserId], [TypeId], [TypeDetailId], [LotteryTypeId], [Money], [Remark], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (7, N'2017-03-25', 1, 1, 1, 0, N'-50', N'2.24提现', 0, '20170325 09:46:12.070', '20170325 09:46:12.070')
GO

INSERT INTO [dbo].[UserMoneyDetail] ([DetailId], [Currentdate], [UserId], [TypeId], [TypeDetailId], [LotteryTypeId], [Money], [Remark], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (8, N'2017-03-25', 1, 1, 1, 0, N'-50', N'2.24提现', 0, '20170325 09:54:54.557', '20170325 09:54:54.557')
GO

INSERT INTO [dbo].[UserMoneyDetail] ([DetailId], [Currentdate], [UserId], [TypeId], [TypeDetailId], [LotteryTypeId], [Money], [Remark], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (9, N'2017-03-25', 1, 1, 1, 0, N'-50', N'2.24提现', 0, '20170325 09:55:53.193', '20170325 09:55:53.193')
GO

SET IDENTITY_INSERT [dbo].[UserMoneyDetail] OFF
GO

--
-- Data for table dbo.UserOrder  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[UserOrder] ON
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, N'2014-03-03', 1, 1, N'10', N'2017024', 1, 0, 5, 1, 1, '20170303', '20170303')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 13:06:08.473', '20170309 13:06:08.473')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 14:28:58.257', '20170309 14:28:58.257')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 14:29:36.750', '20170309 14:29:36.750')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (5, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 14:30:55.953', '20170309 14:30:55.953')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (6, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 14:37:12.503', '20170309 14:37:12.503')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (7, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 14:37:25.613', '20170309 14:37:25.613')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (8, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 14:37:39.557', '20170309 14:37:39.557')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (9, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 14:38:22.747', '20170309 14:38:22.747')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (10, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 14:38:43.260', '20170309 14:38:43.260')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (11, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 14:39:26.600', '20170309 14:39:26.600')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (12, N'2017-03-09', 1, 1, N'96', N'', 3, 4, 4, 1, 1, '20170309 16:16:52.113', '20170309 16:16:52.113')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (13, N'2017-03-09', 1, 1, N'32', N'', 1, 1, 16, 1, 1, '20170309 16:27:06.040', '20170309 16:27:06.040')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (14, N'2017-03-09', 1, 1, N'120', N'', 4, 3, 5, 1, 1, '20170309 16:42:02.523', '20170309 16:42:02.523')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (15, N'2017-03-09', 1, 1, N'2', N'', 1, 1, 1, 1, 1, '20170309 17:10:44.610', '20170309 17:10:44.610')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (16, N'2017-03-23', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170323 17:03:25.143', '20170323 17:03:25.143')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (17, N'2017-03-24', 10, 1, N'2', N'', 1, 0, 1, 1, 1, '20170324 13:44:27.990', '20170324 13:44:27.990')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (18, N'2017-03-24', 10, 1, N'2', N'', 1, 0, 1, 1, 1, '20170324 13:47:15.423', '20170324 13:47:15.423')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (19, N'2017-03-24', 10, 1, N'2', N'', 1, 0, 1, 1, 1, '20170324 13:48:00.960', '20170324 13:48:00.960')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (20, N'2017-03-24', 24, 1, N'2', N'', 1, 0, 1, 1, 1, '20170324 13:55:08.010', '20170324 13:55:08.010')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (21, N'2017-03-24', 24, 1, N'4', N'', 1, 1, 1, 1, 1, '20170324 13:55:20.350', '20170324 13:55:20.350')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (22, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 09:38:38.313', '20170325 09:38:38.313')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (23, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 09:39:21.657', '20170325 09:39:21.657')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (24, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 09:40:04.163', '20170325 09:40:04.163')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (25, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 09:43:34.400', '20170325 09:43:34.400')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (26, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 09:43:59.833', '20170325 09:43:59.833')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (27, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:29:39.850', '20170325 10:29:39.850')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (28, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:30:05.657', '20170325 10:30:05.657')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (29, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:35:34.873', '20170325 10:35:34.873')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (30, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:36:12.190', '20170325 10:36:12.190')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (31, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:37:09.350', '20170325 10:37:09.350')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (32, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:37:48.543', '20170325 10:37:48.543')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (33, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:45:40.460', '20170325 10:45:40.460')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (34, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:46:59.287', '20170325 10:46:59.287')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (35, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:47:35.997', '20170325 10:47:35.997')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (36, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:49:54.030', '20170325 10:49:54.030')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (37, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:53:47.310', '20170325 10:53:47.310')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (38, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:55:56.680', '20170325 10:55:56.680')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (39, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 10:57:12.487', '20170325 10:57:12.487')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (40, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 11:00:11.187', '20170325 11:00:11.187')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (41, N'2017-03-25', 1, 1, N'14', N'', 1, 1, 3, 1, 1, '20170325 15:19:00.697', '20170325 15:19:00.697')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (42, N'2017-03-27', 24, 1, N'0', N'', 1, 0, 0, 1, 1, '20170327 14:38:37.240', '20170327 14:38:37.240')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (43, N'2017-03-27', 11, 1, N'2', N'', 1, 0, 1, 1, 1, '20170327 16:09:50.317', '20170327 16:09:50.317')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (44, N'2017-03-27', 11, 1, N'4', N'', 1, 0, 2, 1, 1, '20170327 16:12:06.567', '20170327 16:12:06.567')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (45, N'2017-03-27', 11, 1, N'2', N'', 1, 0, 1, 1, 1, '20170327 16:12:21.710', '20170327 16:12:21.710')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (46, N'2017-03-27', 10, 1, N'2', N'', 1, 0, 1, 1, 1, '20170327 16:13:23.023', '20170327 16:13:23.023')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (47, N'2017-03-27', 10, 1, N'6', N'', 1, 0, 3, 1, 1, '20170327 16:21:24.923', '20170327 16:21:24.923')
GO

INSERT INTO [dbo].[UserOrder] ([OrderId], [Currentdate], [UserId], [OrderType], [OrderMoney], [BeginLotteryDateNum], [DoubleNum], [MoreNum], [TatalNum], [OrderState], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (48, N'2017-03-27', 10, 1, N'2', N'', 1, 0, 1, 1, 1, '20170327 17:12:30.087', '20170327 17:12:30.087')
GO

SET IDENTITY_INSERT [dbo].[UserOrder] OFF
GO

--
-- Data for table dbo.UserOrderCart  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[UserOrderCart] ON
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, 1, 1, N'', 1, '20170309 13:14:25.310', '20170309 13:14:25.310')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, 1, 5, N'1,2,3,4,5,6,2', 1, '20170309 14:31:02.283', '20170309 14:31:02.283')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, 1, 9, N'1,2,3,4,5,6,2', 1, '20170309 14:38:26.137', '20170309 14:38:26.137')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, 1, 10, N'1,2,3,4,5,6,2', 1, '20170309 14:38:43.530', '20170309 14:38:43.530')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (5, 1, 11, N'1,2,3,4,5,6,2', 1, '20170309 14:39:26.770', '20170309 14:39:26.770')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (6, 1, 12, N'6,17,20,23,24,27,12', 1, '20170309 16:16:52.273', '20170309 16:16:52.273')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (7, 1, 12, N'7,10,11,12,22,33,1', 1, '20170309 16:16:52.547', '20170309 16:16:52.547')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (8, 1, 12, N'7,10,11,12,22,33,5', 1, '20170309 16:16:52.820', '20170309 16:16:52.820')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (9, 1, 12, N'2,11,14,15,17,23,12', 1, '20170309 16:16:53.097', '20170309 16:16:53.097')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (10, 1, 13, N'10,13,16,24,25,27,1', 1, '20170309 16:27:06.180', '20170309 16:27:06.180')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (11, 1, 13, N'2,4,7,11,18,23,3', 1, '20170309 16:27:06.457', '20170309 16:27:06.457')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (12, 1, 13, N'2,4,7,11,18,23,6', 1, '20170309 16:27:06.720', '20170309 16:27:06.720')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (13, 1, 13, N'2,4,7,11,18,30,3', 1, '20170309 16:27:07.063', '20170309 16:27:07.063')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (14, 1, 13, N'2,4,7,11,18,30,6', 1, '20170309 16:27:07.300', '20170309 16:27:07.300')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (15, 1, 13, N'2,4,7,11,23,30,3', 1, '20170309 16:27:07.573', '20170309 16:27:07.573')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (16, 1, 13, N'2,4,7,11,23,30,6', 1, '20170309 16:27:07.850', '20170309 16:27:07.850')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (17, 1, 13, N'2,4,7,18,23,30,3', 1, '20170309 16:27:08.127', '20170309 16:27:08.127')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (18, 1, 13, N'2,4,7,18,23,30,6', 1, '20170309 16:27:08.413', '20170309 16:27:08.413')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (19, 1, 13, N'2,4,11,18,23,30,3', 1, '20170309 16:27:08.697', '20170309 16:27:08.697')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (20, 1, 13, N'2,4,11,18,23,30,6', 1, '20170309 16:27:08.973', '20170309 16:27:08.973')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (21, 1, 13, N'2,7,11,18,23,30,3', 1, '20170309 16:27:12.260', '20170309 16:27:12.260')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (22, 1, 13, N'2,7,11,18,23,30,6', 1, '20170309 16:27:12.510', '20170309 16:27:12.510')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (23, 1, 13, N'4,7,11,18,23,30,3', 1, '20170309 16:27:12.777', '20170309 16:27:12.777')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (24, 1, 13, N'4,7,11,18,23,30,6', 1, '20170309 16:27:13.037', '20170309 16:27:13.037')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (25, 1, 13, N'4,5,7,10,12,16,13', 1, '20170309 16:27:13.313', '20170309 16:27:13.313')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (26, 1, 14, N'7,12,18,20,22,31,16', 1, '20170309 16:42:02.667', '20170309 16:42:02.667')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (27, 1, 14, N'5,9,10,18,23,32,6', 1, '20170309 16:42:02.937', '20170309 16:42:02.937')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (28, 1, 14, N'6,12,16,18,20,29,10', 1, '20170309 16:42:03.190', '20170309 16:42:03.190')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (29, 1, 14, N'4,6,18,21,25,30,5', 1, '20170309 16:42:03.493', '20170309 16:42:03.493')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (30, 1, 14, N'4,6,18,21,25,30,9', 1, '20170309 16:42:03.800', '20170309 16:42:03.800')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (31, 1, 15, N'8,9,10,27,29,31,13', 1, '20170309 17:10:44.737', '20170309 17:10:44.737')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (32, 1, 16, N'2,15,16,17,22,32,7', 1, '20170323 17:03:25.423', '20170323 17:03:25.423')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (33, 1, 16, N'02,15,16,17,22, 32,07', 1, '20170323 17:03:26.150', '20170323 17:03:26.150')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (34, 1, 16, N'02,15,16,17,21, 32,07', 1, '20170323 17:03:26.797', '20170323 17:03:26.797')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (35, 1, 16, N'02,15,16,17,21, 22,07', 1, '20170323 17:03:27.193', '20170323 17:03:27.193')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (36, 1, 16, N'02,15,16,17,22, 32,08', 1, '20170323 17:03:27.577', '20170323 17:03:27.577')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (37, 1, 16, N'02,15,16,17,21, 32,08', 1, '20170323 17:03:28.020', '20170323 17:03:28.020')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (38, 1, 16, N'02,15,16,17,21, 22,08', 1, '20170323 17:03:28.470', '20170323 17:03:28.470')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (39, 10, 17, N'4,9,10,21,27,28,16', 1, '20170324 13:44:28', '20170324 13:44:28')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (40, 10, 18, N'8,9,19,20,30,31,8', 1, '20170324 13:47:15.433', '20170324 13:47:15.433')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (41, 10, 19, N'8,20,22,25,26,32,1', 1, '20170324 13:48:00.973', '20170324 13:48:00.973')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (42, 24, 20, N'7,18,23,25,26,33,7', 1, '20170324 13:55:08.020', '20170324 13:55:08.020')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (43, 24, 21, N'8,17,20,29,31,32,7', 1, '20170324 13:55:20.370', '20170324 13:55:20.370')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (44, 1, 22, N'2,15,16,17,22,32,7', 1, '20170325 09:38:38.450', '20170325 09:38:38.450')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (45, 1, 22, N'02,15,16,17,22, 32,07', 1, '20170325 09:38:39.123', '20170325 09:38:39.123')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (46, 1, 22, N'02,15,16,17,21, 32,07', 1, '20170325 09:38:39.467', '20170325 09:38:39.467')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (47, 1, 22, N'02,15,16,17,21, 22,07', 1, '20170325 09:38:39.860', '20170325 09:38:39.860')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (48, 1, 22, N'02,15,16,17,22, 32,08', 1, '20170325 09:38:40.257', '20170325 09:38:40.257')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (49, 1, 22, N'02,15,16,17,21, 32,08', 1, '20170325 09:38:40.623', '20170325 09:38:40.623')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (50, 1, 22, N'02,15,16,17,21, 22,08', 1, '20170325 09:38:41.027', '20170325 09:38:41.027')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (51, 1, 23, N'2,15,16,17,22,32,7', 1, '20170325 09:39:21.907', '20170325 09:39:21.907')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (52, 1, 23, N'02,15,16,17,22, 32,07', 1, '20170325 09:39:22.420', '20170325 09:39:22.420')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (53, 1, 23, N'02,15,16,17,21, 32,07', 1, '20170325 09:39:22.783', '20170325 09:39:22.783')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (54, 1, 23, N'02,15,16,17,21, 22,07', 1, '20170325 09:39:23.160', '20170325 09:39:23.160')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (55, 1, 23, N'02,15,16,17,22, 32,08', 1, '20170325 09:39:23.560', '20170325 09:39:23.560')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (56, 1, 23, N'02,15,16,17,21, 32,08', 1, '20170325 09:39:23.927', '20170325 09:39:23.927')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (57, 1, 23, N'02,15,16,17,21, 22,08', 1, '20170325 09:39:24.297', '20170325 09:39:24.297')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (58, 1, 24, N'2,15,16,17,22,32,7', 1, '20170325 09:40:04.280', '20170325 09:40:04.280')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (59, 1, 24, N'02,15,16,17,22, 32,07', 1, '20170325 09:40:04.690', '20170325 09:40:04.690')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (60, 1, 24, N'02,15,16,17,21, 32,07', 1, '20170325 09:40:05.057', '20170325 09:40:05.057')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (61, 1, 24, N'02,15,16,17,21, 22,07', 1, '20170325 09:40:05.457', '20170325 09:40:05.457')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (62, 1, 24, N'02,15,16,17,22, 32,08', 1, '20170325 09:40:08.860', '20170325 09:40:08.860')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (63, 1, 24, N'02,15,16,17,21, 32,08', 1, '20170325 09:40:09.260', '20170325 09:40:09.260')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (64, 1, 24, N'02,15,16,17,21, 22,08', 1, '20170325 09:40:09.633', '20170325 09:40:09.633')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (65, 1, 25, N'2,15,16,17,22,32,7', 1, '20170325 09:43:34.597', '20170325 09:43:34.597')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (66, 1, 25, N'02,15,16,17,22, 32,07', 1, '20170325 09:43:35.300', '20170325 09:43:35.300')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (67, 1, 25, N'02,15,16,17,21, 32,07', 1, '20170325 09:43:35.643', '20170325 09:43:35.643')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (68, 1, 25, N'02,15,16,17,21, 22,07', 1, '20170325 09:43:36.030', '20170325 09:43:36.030')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (69, 1, 25, N'02,15,16,17,22, 32,08', 1, '20170325 09:43:36.410', '20170325 09:43:36.410')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (70, 1, 25, N'02,15,16,17,21, 32,08', 1, '20170325 09:43:36.750', '20170325 09:43:36.750')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (71, 1, 25, N'02,15,16,17,21, 22,08', 1, '20170325 09:43:37.140', '20170325 09:43:37.140')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (72, 1, 26, N'2,15,16,17,22,32,7', 1, '20170325 09:44:00.090', '20170325 09:44:00.090')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (73, 1, 26, N'02,15,16,17,22, 32,07', 1, '20170325 09:44:00.463', '20170325 09:44:00.463')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (74, 1, 26, N'02,15,16,17,21, 32,07', 1, '20170325 09:44:00.843', '20170325 09:44:00.843')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (75, 1, 26, N'02,15,16,17,21, 22,07', 1, '20170325 09:44:01.387', '20170325 09:44:01.387')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (76, 1, 26, N'02,15,16,17,22, 32,08', 1, '20170325 09:44:01.817', '20170325 09:44:01.817')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (77, 1, 26, N'02,15,16,17,21, 32,08', 1, '20170325 09:44:02.180', '20170325 09:44:02.180')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (78, 1, 26, N'02,15,16,17,21, 22,08', 1, '20170325 09:44:02.557', '20170325 09:44:02.557')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (79, 1, 27, N'2,15,16,17,22,32,7', 1, '20170325 10:29:39.990', '20170325 10:29:39.990')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (80, 1, 27, N'02,15,16,17,22, 32,07', 1, '20170325 10:29:40.650', '20170325 10:29:40.650')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (81, 1, 27, N'02,15,16,17,21, 32,07', 1, '20170325 10:29:41.080', '20170325 10:29:41.080')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (82, 1, 27, N'02,15,16,17,21, 22,07', 1, '20170325 10:29:41.480', '20170325 10:29:41.480')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (83, 1, 27, N'02,15,16,17,22, 32,08', 1, '20170325 10:29:41.897', '20170325 10:29:41.897')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (84, 1, 27, N'02,15,16,17,21, 32,08', 1, '20170325 10:29:42.287', '20170325 10:29:42.287')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (85, 1, 27, N'02,15,16,17,21, 22,08', 1, '20170325 10:29:42.680', '20170325 10:29:42.680')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (86, 1, 28, N'2,15,16,17,22,32,7', 1, '20170325 10:30:05.793', '20170325 10:30:05.793')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (87, 1, 28, N'02,15,16,17,22, 32,07', 1, '20170325 10:30:06.210', '20170325 10:30:06.210')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (88, 1, 28, N'02,15,16,17,21, 32,07', 1, '20170325 10:30:06.627', '20170325 10:30:06.627')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (89, 1, 28, N'02,15,16,17,21, 22,07', 1, '20170325 10:30:07.023', '20170325 10:30:07.023')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (90, 1, 28, N'02,15,16,17,22, 32,08', 1, '20170325 10:30:07.427', '20170325 10:30:07.427')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (91, 1, 28, N'02,15,16,17,21, 32,08', 1, '20170325 10:30:07.817', '20170325 10:30:07.817')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (92, 1, 28, N'02,15,16,17,21, 22,08', 1, '20170325 10:30:08.217', '20170325 10:30:08.217')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (93, 1, 29, N'2,15,16,17,22,32,7', 1, '20170325 10:35:35.077', '20170325 10:35:35.077')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (94, 1, 29, N'02,15,16,17,22, 32,07', 1, '20170325 10:35:35.847', '20170325 10:35:35.847')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (95, 1, 29, N'02,15,16,17,21, 32,07', 1, '20170325 10:35:36.223', '20170325 10:35:36.223')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (96, 1, 29, N'02,15,16,17,21, 22,07', 1, '20170325 10:35:36.573', '20170325 10:35:36.573')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (97, 1, 29, N'02,15,16,17,22, 32,08', 1, '20170325 10:35:36.947', '20170325 10:35:36.947')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (98, 1, 29, N'02,15,16,17,21, 32,08', 1, '20170325 10:35:37.330', '20170325 10:35:37.330')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (99, 1, 29, N'02,15,16,17,21, 22,08', 1, '20170325 10:35:37.690', '20170325 10:35:37.690')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (100, 1, 30, N'2,15,16,17,22,32,7', 1, '20170325 10:36:12.363', '20170325 10:36:12.363')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (101, 1, 30, N'02,15,16,17,22, 32,07', 1, '20170325 10:36:13.177', '20170325 10:36:13.177')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (102, 1, 30, N'02,15,16,17,21, 32,07', 1, '20170325 10:36:13.593', '20170325 10:36:13.593')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (103, 1, 30, N'02,15,16,17,21, 22,07', 1, '20170325 10:36:14.013', '20170325 10:36:14.013')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (104, 1, 30, N'02,15,16,17,22, 32,08', 1, '20170325 10:36:14.457', '20170325 10:36:14.457')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (105, 1, 30, N'02,15,16,17,21, 32,08', 1, '20170325 10:36:15.160', '20170325 10:36:15.160')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (106, 1, 30, N'02,15,16,17,21, 22,08', 1, '20170325 10:36:15.563', '20170325 10:36:15.563')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (107, 1, 31, N'2,15,16,17,22,32,7', 1, '20170325 10:37:09.610', '20170325 10:37:09.610')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (108, 1, 31, N'02,15,16,17,22, 32,07', 1, '20170325 10:37:10.510', '20170325 10:37:10.510')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (109, 1, 31, N'02,15,16,17,21, 32,07', 1, '20170325 10:37:10.933', '20170325 10:37:10.933')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (110, 1, 31, N'02,15,16,17,21, 22,07', 1, '20170325 10:37:11.383', '20170325 10:37:11.383')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (111, 1, 31, N'02,15,16,17,22, 32,08', 1, '20170325 10:37:11.783', '20170325 10:37:11.783')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (112, 1, 31, N'02,15,16,17,21, 32,08', 1, '20170325 10:37:12.517', '20170325 10:37:12.517')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (113, 1, 31, N'02,15,16,17,21, 22,08', 1, '20170325 10:37:12.973', '20170325 10:37:12.973')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (114, 1, 32, N'2,15,16,17,22,32,7', 1, '20170325 10:37:48.670', '20170325 10:37:48.670')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (115, 1, 32, N'02,15,16,17,22, 32,07', 1, '20170325 10:37:49.027', '20170325 10:37:49.027')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (116, 1, 32, N'02,15,16,17,21, 32,07', 1, '20170325 10:37:49.420', '20170325 10:37:49.420')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (117, 1, 32, N'02,15,16,17,21, 22,07', 1, '20170325 10:37:49.813', '20170325 10:37:49.813')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (118, 1, 32, N'02,15,16,17,22, 32,08', 1, '20170325 10:37:50.500', '20170325 10:37:50.500')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (119, 1, 32, N'02,15,16,17,21, 32,08', 1, '20170325 10:37:50.883', '20170325 10:37:50.883')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (120, 1, 32, N'02,15,16,17,21, 22,08', 1, '20170325 10:37:51.260', '20170325 10:37:51.260')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (121, 1, 33, N'2,15,16,17,22,32,7', 1, '20170325 10:45:40.730', '20170325 10:45:40.730')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (122, 1, 33, N'02,15,16,17,22, 32,07', 1, '20170325 10:45:42.330', '20170325 10:45:42.330')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (123, 1, 33, N'02,15,16,17,21, 32,07', 1, '20170325 10:45:42.930', '20170325 10:45:42.930')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (124, 1, 33, N'02,15,16,17,21, 22,07', 1, '20170325 10:45:43.400', '20170325 10:45:43.400')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (125, 1, 33, N'02,15,16,17,22, 32,08', 1, '20170325 10:45:43.803', '20170325 10:45:43.803')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (126, 1, 33, N'02,15,16,17,21, 32,08', 1, '20170325 10:45:44.170', '20170325 10:45:44.170')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (127, 1, 33, N'02,15,16,17,21, 22,08', 1, '20170325 10:45:44.557', '20170325 10:45:44.557')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (128, 1, 34, N'2,15,16,17,22,32,7', 1, '20170325 10:46:59.457', '20170325 10:46:59.457')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (129, 1, 34, N'02,15,16,17,22, 32,07', 1, '20170325 10:47:00.207', '20170325 10:47:00.207')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (130, 1, 34, N'02,15,16,17,21, 32,07', 1, '20170325 10:47:00.553', '20170325 10:47:00.553')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (131, 1, 34, N'02,15,16,17,21, 22,07', 1, '20170325 10:47:00.893', '20170325 10:47:00.893')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (132, 1, 34, N'02,15,16,17,22, 32,08', 1, '20170325 10:47:01.233', '20170325 10:47:01.233')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (133, 1, 34, N'02,15,16,17,21, 32,08', 1, '20170325 10:47:01.597', '20170325 10:47:01.597')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (134, 1, 34, N'02,15,16,17,21, 22,08', 1, '20170325 10:47:02.030', '20170325 10:47:02.030')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (135, 1, 35, N'2,15,16,17,22,32,7', 1, '20170325 10:47:36.413', '20170325 10:47:36.413')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (136, 1, 35, N'02,15,16,17,22, 32,07', 1, '20170325 10:47:37.423', '20170325 10:47:37.423')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (137, 1, 35, N'02,15,16,17,21, 32,07', 1, '20170325 10:47:37.807', '20170325 10:47:37.807')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (138, 1, 35, N'02,15,16,17,21, 22,07', 1, '20170325 10:47:38.510', '20170325 10:47:38.510')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (139, 1, 35, N'02,15,16,17,22, 32,08', 1, '20170325 10:47:38.890', '20170325 10:47:38.890')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (140, 1, 35, N'02,15,16,17,21, 32,08', 1, '20170325 10:47:39.297', '20170325 10:47:39.297')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (141, 1, 35, N'02,15,16,17,21, 22,08', 1, '20170325 10:47:39.997', '20170325 10:47:39.997')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (142, 1, 36, N'2,15,16,17,22,32,7', 1, '20170325 10:49:54.210', '20170325 10:49:54.210')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (143, 1, 36, N'02,15,16,17,22, 32,07', 1, '20170325 10:49:55.020', '20170325 10:49:55.020')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (144, 1, 36, N'02,15,16,17,21, 32,07', 1, '20170325 10:49:55.417', '20170325 10:49:55.417')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (145, 1, 36, N'02,15,16,17,21, 22,07', 1, '20170325 10:49:55.797', '20170325 10:49:55.797')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (146, 1, 36, N'02,15,16,17,22, 32,08', 1, '20170325 10:49:56.187', '20170325 10:49:56.187')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (147, 1, 36, N'02,15,16,17,21, 32,08', 1, '20170325 10:49:56.580', '20170325 10:49:56.580')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (148, 1, 36, N'02,15,16,17,21, 22,08', 1, '20170325 10:49:57.220', '20170325 10:49:57.220')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (149, 1, 37, N'2,15,16,17,22,32,7', 1, '20170325 10:53:47.550', '20170325 10:53:47.550')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (150, 1, 37, N'02,15,16,17,22, 32,07', 1, '20170325 10:53:48.457', '20170325 10:53:48.457')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (151, 1, 37, N'02,15,16,17,21, 32,07', 1, '20170325 10:53:48.830', '20170325 10:53:48.830')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (152, 1, 37, N'02,15,16,17,21, 22,07', 1, '20170325 10:53:49.260', '20170325 10:53:49.260')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (153, 1, 37, N'02,15,16,17,22, 32,08', 1, '20170325 10:53:49.650', '20170325 10:53:49.650')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (154, 1, 37, N'02,15,16,17,21, 32,08', 1, '20170325 10:53:50.050', '20170325 10:53:50.050')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (155, 1, 37, N'02,15,16,17,21, 22,08', 1, '20170325 10:53:50.443', '20170325 10:53:50.443')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (156, 1, 38, N'2,15,16,17,22,32,7', 1, '20170325 10:55:56.847', '20170325 10:55:56.847')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (157, 1, 38, N'02,15,16,17,22, 32,07', 1, '20170325 10:55:57.750', '20170325 10:55:57.750')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (158, 1, 38, N'02,15,16,17,21, 32,07', 1, '20170325 10:55:58.157', '20170325 10:55:58.157')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (159, 1, 38, N'02,15,16,17,21, 22,07', 1, '20170325 10:55:58.557', '20170325 10:55:58.557')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (160, 1, 38, N'02,15,16,17,22, 32,08', 1, '20170325 10:55:58.943', '20170325 10:55:58.943')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (161, 1, 38, N'02,15,16,17,21, 32,08', 1, '20170325 10:55:59.290', '20170325 10:55:59.290')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (162, 1, 38, N'02,15,16,17,21, 22,08', 1, '20170325 10:55:59.647', '20170325 10:55:59.647')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (163, 1, 39, N'2,15,16,17,22,32,7', 1, '20170325 10:57:12.763', '20170325 10:57:12.763')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (164, 1, 39, N'02,15,16,17,22, 32,07', 1, '20170325 10:57:13.670', '20170325 10:57:13.670')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (165, 1, 39, N'02,15,16,17,21, 32,07', 1, '20170325 10:57:14.060', '20170325 10:57:14.060')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (166, 1, 39, N'02,15,16,17,21, 22,07', 1, '20170325 10:57:14.477', '20170325 10:57:14.477')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (167, 1, 39, N'02,15,16,17,22, 32,08', 1, '20170325 10:57:15.073', '20170325 10:57:15.073')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (168, 1, 39, N'02,15,16,17,21, 32,08', 1, '20170325 10:57:15.420', '20170325 10:57:15.420')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (169, 1, 39, N'02,15,16,17,21, 22,08', 1, '20170325 10:57:15.820', '20170325 10:57:15.820')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (170, 1, 40, N'2,15,16,17,22,32,7', 1, '20170325 11:00:11.367', '20170325 11:00:11.367')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (171, 1, 40, N'02,15,16,17,22, 32,07', 1, '20170325 11:00:12.117', '20170325 11:00:12.117')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (172, 1, 40, N'02,15,16,17,21, 32,07', 1, '20170325 11:00:12.640', '20170325 11:00:12.640')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (173, 1, 40, N'02,15,16,17,21, 22,07', 1, '20170325 11:00:13.403', '20170325 11:00:13.403')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (174, 1, 40, N'02,15,16,17,22, 32,08', 1, '20170325 11:00:13.837', '20170325 11:00:13.837')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (175, 1, 40, N'02,15,16,17,21, 32,08', 1, '20170325 11:00:14.210', '20170325 11:00:14.210')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (176, 1, 40, N'02,15,16,17,21, 22,08', 1, '20170325 11:00:14.920', '20170325 11:00:14.920')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (177, 1, 41, N'2,15,16,17,22,32,7', 1, '20170325 15:19:00.820', '20170325 15:19:00.820')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (178, 1, 41, N'02,15,16,17,22, 32,07', 1, '20170325 15:19:01.513', '20170325 15:19:01.513')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (179, 1, 41, N'02,15,16,17,21, 32,07', 1, '20170325 15:19:01.917', '20170325 15:19:01.917')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (180, 1, 41, N'02,15,16,17,21, 22,07', 1, '20170325 15:19:02.287', '20170325 15:19:02.287')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (181, 1, 41, N'02,15,16,17,22, 32,08', 1, '20170325 15:19:02.650', '20170325 15:19:02.650')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (182, 1, 41, N'02,15,16,17,21, 32,08', 1, '20170325 15:19:03.030', '20170325 15:19:03.030')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (183, 1, 41, N'02,15,16,17,21, 22,08', 1, '20170325 15:19:03.447', '20170325 15:19:03.447')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (184, 11, 43, N'5,10,20,26,31,32,6', 1, '20170327 16:09:50.327', '20170327 16:09:50.327')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (185, 11, 44, N'9,12,16,22,24,29,5', 1, '20170327 16:12:06.580', '20170327 16:12:06.580')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (186, 11, 44, N'10,11,14,15,22,29,5', 1, '20170327 16:12:06.597', '20170327 16:12:06.597')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (187, 11, 45, N'5,6,7,16,19,26,4', 1, '20170327 16:12:21.727', '20170327 16:12:21.727')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (188, 10, 46, N'5,14,18,23,29,31,2', 1, '20170327 16:13:23.033', '20170327 16:13:23.033')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (189, 10, 47, N'16,19,20,22,23,31,14', 1, '20170327 16:21:24.937', '20170327 16:21:24.937')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (190, 10, 47, N'1,6,7,17,19,25,14', 1, '20170327 16:21:24.953', '20170327 16:21:24.953')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (191, 10, 47, N'3,4,7,21,29,32,13', 1, '20170327 16:21:24.973', '20170327 16:21:24.973')
GO

INSERT INTO [dbo].[UserOrderCart] ([CartId], [UserId], [OrderId], [CartNum], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (192, 10, 48, N'4,10,11,16,19,33,8', 1, '20170327 17:12:30.097', '20170327 17:12:30.097')
GO

SET IDENTITY_INSERT [dbo].[UserOrderCart] OFF
GO

--
-- Data for table dbo.UserOrderDetail  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[UserOrderDetail] ON
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (1, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017024', N'081128293133 06', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (2, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017024', N'101114151624 07', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (3, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017024', N'101112232629 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (4, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017024', N'101112232529 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (5, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017024', N'101112232429 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (6, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017023', N'081128293133 06', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (7, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017023', N'101114151624 07', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (8, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017023', N'101112232629 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (9, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017023', N'101112232529 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (10, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017023', N'101112232429 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (11, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017022', N'081128293133 06', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (12, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017022', N'101114151624 07', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (13, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017022', N'101112232629 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (14, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017022', N'101112232529 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (15, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017022', N'101112232429 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (16, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017021', N'081128293133 06', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (17, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017021', N'101114151624 07', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (18, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017021', N'101112232629 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (19, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017021', N'101112232529 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (20, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017021', N'101112232429 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (21, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017020', N'081128293133 06', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (22, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017020', N'101114151624 07', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (23, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017020', N'101112232629 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (24, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017020', N'101112232529 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (25, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017020', N'101112232429 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (26, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017019', N'081128293133 06', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (27, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017019', N'101114151624 07', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (28, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017019', N'101112232629 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (29, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017019', N'101112232529 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (30, N'2014-03-03', 1, NULL, 1, 1, 2, N'2017019', N'101112232429 16', N'2', 0, NULL, 1, '20170303', '20170303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (31, N'2017-03-09', 1, 1, 1, 1, 1, N'2017025', N'06,03,07,08,09,01,06', N'2', 0, NULL, 1, '20170309 13:59:43.640', '20170309 13:59:43.640', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (32, N'2017-03-09', 11, 5, 1, 1, 1, N'', N'1,2,3,4,5,6,2', N'2', 0, NULL, 1, '20170309 14:39:26.900', '20170309 14:39:26.900', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (33, N'2017-03-09', 12, 6, 1, 1, 2, N'', N'6,17,20,23,24,27,12', N'24', 0, NULL, 1, '20170309 16:16:52.417', '20170309 16:16:52.417', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (34, N'2017-03-09', 12, 7, 1, 1, 1, N'', N'7,10,11,12,22,33,1', N'24', 0, NULL, 1, '20170309 16:16:52.690', '20170309 16:16:52.690', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (35, N'2017-03-09', 12, 8, 1, 1, 1, N'', N'7,10,11,12,22,33,5', N'24', 0, NULL, 1, '20170309 16:16:52.943', '20170309 16:16:52.943', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (36, N'2017-03-09', 12, 9, 1, 1, 2, N'', N'2,11,14,15,17,23,12', N'24', 0, NULL, 1, '20170309 16:16:53.233', '20170309 16:16:53.233', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (37, N'2017-03-09', 13, 10, 1, 1, 2, N'', N'10,13,16,24,25,27,1', N'2', 0, NULL, 1, '20170309 16:27:06.317', '20170309 16:27:06.317', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (38, N'2017-03-09', 13, 11, 1, 1, 1, N'', N'2,4,7,11,18,23,3', N'2', 0, NULL, 1, '20170309 16:27:06.590', '20170309 16:27:06.590', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (39, N'2017-03-09', 13, 12, 1, 1, 1, N'', N'2,4,7,11,18,23,6', N'2', 0, NULL, 1, '20170309 16:27:06.850', '20170309 16:27:06.850', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (40, N'2017-03-09', 13, 13, 1, 1, 1, N'', N'2,4,7,11,18,30,3', N'2', 0, NULL, 1, '20170309 16:27:07.180', '20170309 16:27:07.180', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (41, N'2017-03-09', 13, 14, 1, 1, 1, N'', N'2,4,7,11,18,30,6', N'2', 0, NULL, 1, '20170309 16:27:07.443', '20170309 16:27:07.443', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (42, N'2017-03-09', 13, 15, 1, 1, 1, N'', N'2,4,7,11,23,30,3', N'2', 0, NULL, 1, '20170309 16:27:07.710', '20170309 16:27:07.710', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (43, N'2017-03-09', 13, 16, 1, 1, 1, N'', N'2,4,7,11,23,30,6', N'2', 0, NULL, 1, '20170309 16:27:07.997', '20170309 16:27:07.997', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (44, N'2017-03-09', 13, 17, 1, 1, 1, N'', N'2,4,7,18,23,30,3', N'2', 0, NULL, 1, '20170309 16:27:08.267', '20170309 16:27:08.267', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (45, N'2017-03-09', 13, 18, 1, 1, 1, N'', N'2,4,7,18,23,30,6', N'2', 0, NULL, 1, '20170309 16:27:08.560', '20170309 16:27:08.560', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (46, N'2017-03-09', 13, 19, 1, 1, 1, N'', N'2,4,11,18,23,30,3', N'2', 0, NULL, 1, '20170309 16:27:08.840', '20170309 16:27:08.840', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (47, N'2017-03-09', 13, 20, 1, 1, 1, N'', N'2,4,11,18,23,30,6', N'2', 0, NULL, 1, '20170309 16:27:12.120', '20170309 16:27:12.120', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (48, N'2017-03-09', 13, 21, 1, 1, 1, N'', N'2,7,11,18,23,30,3', N'2', 0, NULL, 1, '20170309 16:27:12.373', '20170309 16:27:12.373', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (49, N'2017-03-09', 13, 22, 1, 1, 1, N'', N'2,7,11,18,23,30,6', N'2', 0, NULL, 1, '20170309 16:27:12.643', '20170309 16:27:12.643', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (50, N'2017-03-09', 13, 23, 1, 1, 1, N'', N'4,7,11,18,23,30,3', N'2', 0, NULL, 1, '20170309 16:27:12.917', '20170309 16:27:12.917', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (51, N'2017-03-09', 13, 24, 1, 1, 1, N'', N'4,7,11,18,23,30,6', N'2', 0, NULL, 1, '20170309 16:27:13.173', '20170309 16:27:13.173', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (52, N'2017-03-09', 13, 25, 1, 1, 2, N'', N'4,5,7,10,12,16,13', N'2', 0, NULL, 1, '20170309 16:27:13.437', '20170309 16:27:13.437', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (58, N'2017-03-09', 15, 31, 1, 1, 2, N'', N'8,9,10,27,29,31,13', N'2', 0, NULL, 1, '20170309 17:10:44.880', '20170309 17:10:44.880', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (53, N'2017-03-09', 14, 26, 1, 1, 2, N'', N'7,12,18,20,22,31,16', N'24', 0, NULL, 1, '20170309 16:42:02.793', '20170309 16:42:02.793', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (54, N'2017-03-09', 14, 27, 1, 1, 2, N'', N'5,9,10,18,23,32,6', N'24', 0, NULL, 1, '20170309 16:42:03.070', '20170309 16:42:03.070', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (55, N'2017-03-09', 14, 28, 1, 1, 2, N'', N'6,12,16,18,20,29,10', N'24', 0, NULL, 1, '20170309 16:42:03.313', '20170309 16:42:03.313', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (56, N'2017-03-09', 14, 29, 1, 1, 1, N'', N'4,6,18,21,25,30,5', N'24', 0, NULL, 1, '20170309 16:42:03.627', '20170309 16:42:03.627', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (57, N'2017-03-09', 14, 30, 1, 1, 1, N'', N'4,6,18,21,25,30,9', N'24', 0, NULL, 1, '20170309 16:42:03.937', '20170309 16:42:03.937', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (59, N'2017-03-23', 16, 32, 1, 1, 1, N'', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170323 17:03:25.603', '20170323 17:03:25.603', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (60, N'2017-03-23', 16, 33, 1, 1, 1, N'', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170323 17:03:26.307', '20170323 17:03:26.307', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (61, N'2017-03-23', 16, 34, 1, 1, 1, N'', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170323 17:03:27.010', '20170323 17:03:27.010', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (62, N'2017-03-23', 16, 35, 1, 1, 1, N'', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170323 17:03:27.410', '20170323 17:03:27.410', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (63, N'2017-03-23', 16, 36, 1, 1, 1, N'', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170323 17:03:27.800', '20170323 17:03:27.800', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (64, N'2017-03-23', 16, 37, 1, 1, 1, N'', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170323 17:03:28.223', '20170323 17:03:28.223', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (65, N'2017-03-23', 16, 38, 1, 1, 1, N'', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170323 17:03:28.673', '20170323 17:03:28.673', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (66, N'2017-03-24', 17, 39, 10, 1, 2, N'', N'4,9,10,21,27,28,16', N'2', 0, NULL, 1, '20170324 13:44:28.013', '20170324 13:44:28.013', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (67, N'2017-03-24', 18, 40, 10, 1, 2, N'', N'8,9,19,20,30,31,8', N'2', 0, NULL, 1, '20170324 13:47:15.440', '20170324 13:47:15.440', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (68, N'2017-03-24', 19, 41, 10, 1, 2, N'', N'8,20,22,25,26,32,1', N'2', 0, NULL, 1, '20170324 13:48:00.987', '20170324 13:48:00.987', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (69, N'2017-03-24', 20, 42, 24, 1, 2, N'', N'7,18,23,25,26,33,7', N'2', 0, NULL, 1, '20170324 13:55:08.027', '20170324 13:55:08.027', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (70, N'2017-03-24', 21, 43, 24, 1, 2, N'', N'8,17,20,29,31,32,7', N'4', 0, NULL, 1, '20170324 13:55:20.383', '20170324 13:55:20.383', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (71, N'2017-03-25', 22, 44, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 09:38:39', '20170325 09:38:39', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (72, N'2017-03-25', 22, 45, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:38:39.363', '20170325 09:38:39.363', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (73, N'2017-03-25', 22, 46, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:38:39.713', '20170325 09:38:39.713', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (74, N'2017-03-25', 22, 47, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 09:38:40.120', '20170325 09:38:40.120', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (75, N'2017-03-25', 22, 48, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:38:40.500', '20170325 09:38:40.500', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (76, N'2017-03-25', 22, 49, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:38:40.890', '20170325 09:38:40.890', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (77, N'2017-03-25', 22, 50, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 09:38:41.300', '20170325 09:38:41.300', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (78, N'2017-03-25', 23, 51, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 09:39:22.303', '20170325 09:39:22.303', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (79, N'2017-03-25', 23, 52, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:39:22.667', '20170325 09:39:22.667', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (80, N'2017-03-25', 23, 53, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:39:23.020', '20170325 09:39:23.020', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (81, N'2017-03-25', 23, 54, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 09:39:23.420', '20170325 09:39:23.420', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (82, N'2017-03-25', 23, 55, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:39:23.807', '20170325 09:39:23.807', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (83, N'2017-03-25', 23, 56, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:39:24.170', '20170325 09:39:24.170', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (84, N'2017-03-25', 23, 57, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 09:39:24.603', '20170325 09:39:24.603', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (85, N'2017-03-25', 24, 58, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 09:40:04.553', '20170325 09:40:04.553', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (86, N'2017-03-25', 24, 59, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:40:04.947', '20170325 09:40:04.947', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (87, N'2017-03-25', 24, 60, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:40:05.330', '20170325 09:40:05.330', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (88, N'2017-03-25', 24, 61, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 09:40:05.710', '20170325 09:40:05.710', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (89, N'2017-03-25', 24, 62, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:40:09.140', '20170325 09:40:09.140', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (90, N'2017-03-25', 24, 63, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:40:09.503', '20170325 09:40:09.503', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (91, N'2017-03-25', 24, 64, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 09:40:09.887', '20170325 09:40:09.887', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (92, N'2017-03-25', 25, 65, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 09:43:35.183', '20170325 09:43:35.183', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (93, N'2017-03-25', 25, 66, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:43:35.520', '20170325 09:43:35.520', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (94, N'2017-03-25', 25, 67, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:43:35.897', '20170325 09:43:35.897', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (95, N'2017-03-25', 25, 68, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 09:43:36.287', '20170325 09:43:36.287', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (96, N'2017-03-25', 25, 69, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:43:36.633', '20170325 09:43:36.633', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (97, N'2017-03-25', 25, 70, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:43:37.007', '20170325 09:43:37.007', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (98, N'2017-03-25', 25, 71, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 09:43:37.407', '20170325 09:43:37.407', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (99, N'2017-03-25', 26, 72, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 09:44:00.340', '20170325 09:44:00.340', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (100, N'2017-03-25', 26, 73, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:44:00.697', '20170325 09:44:00.697', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (101, N'2017-03-25', 26, 74, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 09:44:01.250', '20170325 09:44:01.250', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (102, N'2017-03-25', 26, 75, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 09:44:01.683', '20170325 09:44:01.683', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (103, N'2017-03-25', 26, 76, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:44:02.053', '20170325 09:44:02.053', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (104, N'2017-03-25', 26, 77, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 09:44:02.440', '20170325 09:44:02.440', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (105, N'2017-03-25', 26, 78, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 09:44:02.787', '20170325 09:44:02.787', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (106, N'2017-03-25', 27, 79, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:29:40.500', '20170325 10:29:40.500', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (107, N'2017-03-25', 27, 80, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:29:40.947', '20170325 10:29:40.947', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (108, N'2017-03-25', 27, 81, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:29:41.350', '20170325 10:29:41.350', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (109, N'2017-03-25', 27, 82, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:29:41.760', '20170325 10:29:41.760', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (110, N'2017-03-25', 27, 83, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:29:42.170', '20170325 10:29:42.170', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (111, N'2017-03-25', 27, 84, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:29:42.530', '20170325 10:29:42.530', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (112, N'2017-03-25', 27, 85, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:29:42.943', '20170325 10:29:42.943', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (113, N'2017-03-25', 28, 86, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:30:06.067', '20170325 10:30:06.067', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (114, N'2017-03-25', 28, 87, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:30:06.497', '20170325 10:30:06.497', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (115, N'2017-03-25', 28, 88, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:30:06.880', '20170325 10:30:06.880', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (116, N'2017-03-25', 28, 89, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:30:07.300', '20170325 10:30:07.300', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (117, N'2017-03-25', 28, 90, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:30:07.683', '20170325 10:30:07.683', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (118, N'2017-03-25', 28, 91, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:30:08.093', '20170325 10:30:08.093', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (119, N'2017-03-25', 28, 92, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:30:08.450', '20170325 10:30:08.450', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (120, N'2017-03-25', 29, 93, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:35:35.690', '20170325 10:35:35.690', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (121, N'2017-03-25', 29, 94, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:35:36.103', '20170325 10:35:36.103', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (122, N'2017-03-25', 29, 95, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:35:36.450', '20170325 10:35:36.450', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (123, N'2017-03-25', 29, 96, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:35:36.813', '20170325 10:35:36.813', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (124, N'2017-03-25', 29, 97, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:35:37.193', '20170325 10:35:37.193', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (125, N'2017-03-25', 29, 98, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:35:37.560', '20170325 10:35:37.560', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (126, N'2017-03-25', 29, 99, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:35:37.933', '20170325 10:35:37.933', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (127, N'2017-03-25', 30, 100, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:36:13.053', '20170325 10:36:13.053', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (128, N'2017-03-25', 30, 101, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:36:13.447', '20170325 10:36:13.447', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (129, N'2017-03-25', 30, 102, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:36:13.877', '20170325 10:36:13.877', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (130, N'2017-03-25', 30, 103, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:36:14.320', '20170325 10:36:14.320', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (131, N'2017-03-25', 30, 104, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:36:15.020', '20170325 10:36:15.020', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (132, N'2017-03-25', 30, 105, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:36:15.440', '20170325 10:36:15.440', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (133, N'2017-03-25', 30, 106, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:36:15.793', '20170325 10:36:15.793', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (134, N'2017-03-25', 31, 107, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:37:10.323', '20170325 10:37:10.323', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (135, N'2017-03-25', 31, 108, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:37:10.773', '20170325 10:37:10.773', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (136, N'2017-03-25', 31, 109, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:37:11.233', '20170325 10:37:11.233', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (137, N'2017-03-25', 31, 110, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:37:11.650', '20170325 10:37:11.650', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (138, N'2017-03-25', 31, 111, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:37:12.373', '20170325 10:37:12.373', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (139, N'2017-03-25', 31, 112, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:37:12.830', '20170325 10:37:12.830', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (140, N'2017-03-25', 31, 113, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:37:13.270', '20170325 10:37:13.270', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (141, N'2017-03-25', 32, 114, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:37:48.917', '20170325 10:37:48.917', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (142, N'2017-03-25', 32, 115, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:37:49.277', '20170325 10:37:49.277', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (143, N'2017-03-25', 32, 116, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:37:49.683', '20170325 10:37:49.683', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (144, N'2017-03-25', 32, 117, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:37:50.380', '20170325 10:37:50.380', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (145, N'2017-03-25', 32, 118, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:37:50.760', '20170325 10:37:50.760', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (146, N'2017-03-25', 32, 119, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:37:51.143', '20170325 10:37:51.143', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (147, N'2017-03-25', 32, 120, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:37:51.503', '20170325 10:37:51.503', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (148, N'2017-03-25', 33, 121, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:45:41.877', '20170325 10:45:41.877', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (149, N'2017-03-25', 33, 122, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:45:42.660', '20170325 10:45:42.660', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (150, N'2017-03-25', 33, 123, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:45:43.273', '20170325 10:45:43.273', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (151, N'2017-03-25', 33, 124, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:45:43.693', '20170325 10:45:43.693', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (152, N'2017-03-25', 33, 125, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:45:44.040', '20170325 10:45:44.040', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (153, N'2017-03-25', 33, 126, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:45:44.430', '20170325 10:45:44.430', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (154, N'2017-03-25', 33, 127, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:45:44.820', '20170325 10:45:44.820', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (155, N'2017-03-25', 34, 128, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:47:00.073', '20170325 10:47:00.073', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (156, N'2017-03-25', 34, 129, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:47:00.440', '20170325 10:47:00.440', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (157, N'2017-03-25', 34, 130, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:47:00.780', '20170325 10:47:00.780', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (158, N'2017-03-25', 34, 131, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:47:01.117', '20170325 10:47:01.117', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (159, N'2017-03-25', 34, 132, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:47:01.480', '20170325 10:47:01.480', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (160, N'2017-03-25', 34, 133, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:47:01.893', '20170325 10:47:01.893', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (161, N'2017-03-25', 34, 134, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:47:02.280', '20170325 10:47:02.280', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (162, N'2017-03-25', 35, 135, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:47:37.293', '20170325 10:47:37.293', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (163, N'2017-03-25', 35, 136, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:47:37.690', '20170325 10:47:37.690', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (164, N'2017-03-25', 35, 137, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:47:38.077', '20170325 10:47:38.077', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (165, N'2017-03-25', 35, 138, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:47:38.760', '20170325 10:47:38.760', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (166, N'2017-03-25', 35, 139, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:47:39.180', '20170325 10:47:39.180', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (167, N'2017-03-25', 35, 140, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:47:39.873', '20170325 10:47:39.873', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (168, N'2017-03-25', 35, 141, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:47:40.260', '20170325 10:47:40.260', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (169, N'2017-03-25', 36, 142, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:49:54.880', '20170325 10:49:54.880', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (170, N'2017-03-25', 36, 143, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:49:55.297', '20170325 10:49:55.297', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (171, N'2017-03-25', 36, 144, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:49:55.663', '20170325 10:49:55.663', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (172, N'2017-03-25', 36, 145, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:49:56.057', '20170325 10:49:56.057', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (173, N'2017-03-25', 36, 146, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:49:56.460', '20170325 10:49:56.460', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (174, N'2017-03-25', 36, 147, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:49:57.100', '20170325 10:49:57.100', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (175, N'2017-03-25', 36, 148, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:49:57.447', '20170325 10:49:57.447', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (176, N'2017-03-25', 37, 149, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:53:48.340', '20170325 10:53:48.340', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (177, N'2017-03-25', 37, 150, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:53:48.693', '20170325 10:53:48.693', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (178, N'2017-03-25', 37, 151, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:53:49.097', '20170325 10:53:49.097', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (179, N'2017-03-25', 37, 152, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:53:49.517', '20170325 10:53:49.517', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (180, N'2017-03-25', 37, 153, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:53:49.913', '20170325 10:53:49.913', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (181, N'2017-03-25', 37, 154, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:53:50.307', '20170325 10:53:50.307', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (182, N'2017-03-25', 37, 155, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:53:50.690', '20170325 10:53:50.690', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (183, N'2017-03-25', 38, 156, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:55:57.613', '20170325 10:55:57.613', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (184, N'2017-03-25', 38, 157, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:55:58.027', '20170325 10:55:58.027', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (185, N'2017-03-25', 38, 158, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:55:58.423', '20170325 10:55:58.423', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (186, N'2017-03-25', 38, 159, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:55:58.830', '20170325 10:55:58.830', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (187, N'2017-03-25', 38, 160, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:55:59.170', '20170325 10:55:59.170', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (188, N'2017-03-25', 38, 161, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:55:59.527', '20170325 10:55:59.527', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (189, N'2017-03-25', 38, 162, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:55:59.877', '20170325 10:55:59.877', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (190, N'2017-03-25', 39, 163, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 10:57:13.543', '20170325 10:57:13.543', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (191, N'2017-03-25', 39, 164, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:57:13.933', '20170325 10:57:13.933', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (192, N'2017-03-25', 39, 165, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 10:57:14.317', '20170325 10:57:14.317', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (193, N'2017-03-25', 39, 166, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 10:57:14.737', '20170325 10:57:14.737', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (194, N'2017-03-25', 39, 167, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:57:15.290', '20170325 10:57:15.290', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (195, N'2017-03-25', 39, 168, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 10:57:15.687', '20170325 10:57:15.687', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (196, N'2017-03-25', 39, 169, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 10:57:16.070', '20170325 10:57:16.070', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (197, N'2017-03-25', 40, 170, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 11:00:11.983', '20170325 11:00:11.983', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (198, N'2017-03-25', 40, 171, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 11:00:12.507', '20170325 11:00:12.507', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (199, N'2017-03-25', 40, 172, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 11:00:13.263', '20170325 11:00:13.263', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (200, N'2017-03-25', 40, 173, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 11:00:13.710', '20170325 11:00:13.710', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (201, N'2017-03-25', 40, 174, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 11:00:14.090', '20170325 11:00:14.090', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (202, N'2017-03-25', 40, 175, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 11:00:14.770', '20170325 11:00:14.770', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (203, N'2017-03-25', 40, 176, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 11:00:15.167', '20170325 11:00:15.167', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (204, N'2017-03-25', 41, 177, 1, 1, 1, N'2017033', N'2,15,16,17,22,32,7', N'4.666667', 0, NULL, 1, '20170325 15:19:01.387', '20170325 15:19:01.387', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (205, N'2017-03-25', 41, 178, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,07', N'4.666667', 0, NULL, 1, '20170325 15:19:01.797', '20170325 15:19:01.797', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (206, N'2017-03-25', 41, 179, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,07', N'4.666667', 0, NULL, 1, '20170325 15:19:02.157', '20170325 15:19:02.157', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (207, N'2017-03-25', 41, 180, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,07', N'4.666667', 0, NULL, 1, '20170325 15:19:02.537', '20170325 15:19:02.537', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (208, N'2017-03-25', 41, 181, 1, 1, 1, N'2017033', N'02,15,16,17,22, 32,08', N'4.666667', 0, NULL, 1, '20170325 15:19:02.897', '20170325 15:19:02.897', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (209, N'2017-03-25', 41, 182, 1, 1, 1, N'2017033', N'02,15,16,17,21, 32,08', N'4.666667', 0, NULL, 1, '20170325 15:19:03.303', '20170325 15:19:03.303', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (210, N'2017-03-25', 41, 183, 1, 1, 1, N'2017033', N'02,15,16,17,21, 22,08', N'4.666667', 0, NULL, 1, '20170325 15:19:03.700', '20170325 15:19:03.700', 3)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (211, N'2017-03-27', 43, 184, 11, 1, 2, N'', N'5,10,20,26,31,32,6', N'2', 0, NULL, 1, '20170327 16:09:50.337', '20170327 16:09:50.337', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (212, N'2017-03-27', 44, 185, 11, 1, 2, N'', N'9,12,16,22,24,29,5', N'2', 0, NULL, 1, '20170327 16:12:06.587', '20170327 16:12:06.587', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (213, N'2017-03-27', 44, 186, 11, 1, 2, N'', N'10,11,14,15,22,29,5', N'2', 0, NULL, 1, '20170327 16:12:06.607', '20170327 16:12:06.607', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (214, N'2017-03-27', 45, 187, 11, 1, 2, N'', N'5,6,7,16,19,26,4', N'2', 0, NULL, 1, '20170327 16:12:21.747', '20170327 16:12:21.747', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (215, N'2017-03-27', 46, 188, 10, 1, 2, N'', N'5,14,18,23,29,31,2', N'2', 0, NULL, 1, '20170327 16:13:23.043', '20170327 16:13:23.043', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (216, N'2017-03-27', 47, 189, 10, 1, 2, N'', N'16,19,20,22,23,31,14', N'2', 0, NULL, 1, '20170327 16:21:24.943', '20170327 16:21:24.943', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (217, N'2017-03-27', 47, 190, 10, 1, 2, N'', N'1,6,7,17,19,25,14', N'2', 0, NULL, 1, '20170327 16:21:24.963', '20170327 16:21:24.963', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (218, N'2017-03-27', 47, 191, 10, 1, 2, N'', N'3,4,7,21,29,32,13', N'2', 0, NULL, 1, '20170327 16:21:24.980', '20170327 16:21:24.980', 1)
GO

INSERT INTO [dbo].[UserOrderDetail] ([OrderDetailId], [Currentdate], [OrderId], [CartId], [UserId], [LotteryTypeId], [DetailType], [LotteryDateNum], [LotteryString], [CostMoney], [OrderDetailState], [LotteryLevel], [CurState], [UpdateTime], [CreateTime], [SelectType])
VALUES 
  (219, N'2017-03-27', 48, 192, 10, 1, 2, N'', N'4,10,11,16,19,33,8', N'2', 0, NULL, 1, '20170327 17:12:30.103', '20170327 17:12:30.103', 1)
GO

SET IDENTITY_INSERT [dbo].[UserOrderDetail] OFF
GO

--
-- Data for table dbo.Users  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[Users] ON
GO

INSERT INTO [dbo].[Users] ([UserId], [RoleId], [UserName], [LoginName], [LoginPwd], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (1, 1, N'admin', N'admin', N'admin', 1, '20170310 11:25:12.853', '20170309 11:26:12')
GO

INSERT INTO [dbo].[Users] ([UserId], [RoleId], [UserName], [LoginName], [LoginPwd], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (2, 1, N'ee', N'ee', NULL, 1, '20170310 11:28:44.837', '20170310 11:08:11.813')
GO

INSERT INTO [dbo].[Users] ([UserId], [RoleId], [UserName], [LoginName], [LoginPwd], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (3, 2, N'ww', N'ww', NULL, 1, '20170310 13:39:21.997', '20170310 11:10:47.997')
GO

INSERT INTO [dbo].[Users] ([UserId], [RoleId], [UserName], [LoginName], [LoginPwd], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (4, 3, N'fff', N'ffff', NULL, 1, '20170315 14:03:36.857', '20170310 13:40:15.613')
GO

INSERT INTO [dbo].[Users] ([UserId], [RoleId], [UserName], [LoginName], [LoginPwd], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (5, 1, N'ffat', N'ffat', NULL, 1, '20170317 14:57:47.157', '20170315 18:26:31.303')
GO

INSERT INTO [dbo].[Users] ([UserId], [RoleId], [UserName], [LoginName], [LoginPwd], [CurState], [UpdateTime], [CreateTime])
VALUES 
  (6, 1, N'asd', N'asd', NULL, 1, '20170317 14:58:11.850', '20170317 14:58:11.850')
GO

SET IDENTITY_INSERT [dbo].[Users] OFF
GO

--
-- Definition for indices : 
--

ALTER TABLE [dbo].[LotteryHistory]
ADD CONSTRAINT [PK_LotteryHistory] 
PRIMARY KEY CLUSTERED ([ItemId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[LotteryType]
ADD CONSTRAINT [PK_LotteryType] 
PRIMARY KEY CLUSTERED ([TypeId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[OperationLog]
ADD CONSTRAINT [PK_OperationLog] 
PRIMARY KEY CLUSTERED ([Id])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[Page]
ADD CONSTRAINT [PK_Page] 
PRIMARY KEY CLUSTERED ([PageId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[Role]
ADD CONSTRAINT [PK_Role] 
PRIMARY KEY CLUSTERED ([RoleId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[RolePage]
ADD CONSTRAINT [PK_RolePage] 
PRIMARY KEY CLUSTERED ([Id])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[t_plan_keyword]
ADD CONSTRAINT [PK_t_plan_keyword] 
PRIMARY KEY CLUSTERED ([ItemId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[UserAccount]
ADD CONSTRAINT [PK_UserAccount] 
PRIMARY KEY CLUSTERED ([AccountId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[UserBankCard]
ADD CONSTRAINT [PK_UserBankCard] 
PRIMARY KEY CLUSTERED ([BankCardId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[UserInfo]
ADD CONSTRAINT [PK_UserInfo] 
PRIMARY KEY CLUSTERED ([UserId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[UserMoneyDetail]
ADD CONSTRAINT [PK_UserMoneyDetail] 
PRIMARY KEY CLUSTERED ([DetailId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[UserOrder]
ADD CONSTRAINT [PK_UserOrder] 
PRIMARY KEY CLUSTERED ([OrderId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[UserOrderCart]
ADD CONSTRAINT [PK_UserOrderCart] 
PRIMARY KEY CLUSTERED ([CartId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK__Users] 
PRIMARY KEY CLUSTERED ([UserId])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



