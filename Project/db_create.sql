hegUSE [WYGL]
GO
/****** 对象:  Table [WYGL].[gyy_lb]    脚本日期: 05/06/2011 12:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[gyy_lb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[序号] [int] NULL,
	[工业园名称] [nvarchar](50) NULL,
	[工业园面积] [nvarchar](50) NULL,
 CONSTRAINT [PK_gyy_lb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[gyy_fc_lb]    脚本日期: 05/06/2011 12:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[gyy_fc_lb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[工业园名称] [nvarchar](50) NULL,
	[房产类型] [nvarchar](50) NULL,
	[房号] [nvarchar](50) NULL,
	[描述] [nvarchar](50) NULL,
	[房型] [nvarchar](50) NULL,
	[朝向] [nvarchar](50) NULL,
	[房屋结构] [nvarchar](50) NULL,
	[业主] [nvarchar](50) NULL,
	[状态] [nvarchar](50) NULL,
 CONSTRAINT [PK_gyy_fc_lb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[admin_admin_lb]    脚本日期: 05/06/2011 12:42:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[admin_admin_lb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[admin_id] [nvarchar](50) NULL,
	[工业园名称] [nvarchar](50) NULL,
 CONSTRAINT [PK_admin_admin_lb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[admin_admin]    脚本日期: 05/06/2011 12:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[admin_admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[admin_id] [nvarchar](50) NULL,
	[admin_pwd] [nvarchar](50) NULL,
	[admin_name] [nvarchar](50) NULL,
	[admin_limit] [nvarchar](50) NULL,
	[tel] [nvarchar](50) NULL,
	[qq] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_admin_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[zpgl_lx_lb]    脚本日期: 05/06/2011 12:45:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[zpgl_lx_lb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[合同编号] [nvarchar](50) NULL,
	[客户编码] [nvarchar](50) NULL,
	[所属工业园] [nvarchar](50) NULL,
	[房产类型] [nvarchar](50) NULL,
	[所属房产] [nvarchar](50) NULL,
	[客户名称] [nvarchar](50) NULL,
	[消费项目] [nvarchar](50) NULL,
	[消费类型] [nvarchar](50) NULL,
	[值] [float] NULL,
	[倍率] [float] NULL,
	[损耗] [float] NULL,
	[滞纳金] [float] NULL,
	[说明] [nvarchar](50) NULL,
 CONSTRAINT [PK_zpgl_lx_lb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[zpgl]    脚本日期: 05/06/2011 12:45:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[zpgl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[编码] [nvarchar](50) NULL,
	[客户编码] [nvarchar](50) NULL,
	[客户名称] [nvarchar](50) NULL,
	[所属工业园] [nvarchar](50) NULL,
	[房产类型] [nvarchar](50) NULL,
	[所属房产] [nvarchar](50) NULL,
	[合同开始时间_年] [nvarchar](50) NULL,
	[合同开始时间_月] [nvarchar](50) NULL,
	[合同开始时间_日] [nvarchar](50) NULL,
	[合同开始时间] [datetime] NULL,
	[合同结束时间_年] [nvarchar](50) NULL,
	[合同结束时间_月] [nvarchar](50) NULL,
	[合同结束时间_日] [nvarchar](50) NULL,
	[合同结束时间] [datetime] NULL,
	[操作时间] [datetime] NULL,
	[操作人] [nvarchar](50) NULL,
	[备注] [ntext] NULL,
 CONSTRAINT [PK_zpgl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[user_zrr]    脚本日期: 05/06/2011 12:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[user_zrr](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[编码] [nvarchar](50) NULL,
	[名称] [nvarchar](50) NULL,
	[照片] [nvarchar](50) NULL,
	[助记码] [nvarchar](50) NULL,
	[描述] [nvarchar](50) NULL,
	[性别] [nvarchar](50) NULL,
	[出生日期_年] [nvarchar](50) NULL,
	[出生日期_月] [nvarchar](50) NULL,
	[出生日期_日] [nvarchar](50) NULL,
	[证件名称] [nvarchar](50) NULL,
	[证件号码] [nvarchar](50) NULL,
	[籍贯] [nvarchar](50) NULL,
	[联系电话] [nvarchar](50) NULL,
	[联系地址] [nvarchar](50) NULL,
	[联系人] [nvarchar](50) NULL,
	[备注] [ntext] NULL,
 CONSTRAINT [PK_user_zrr] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[user_sf_zb]    脚本日期: 05/06/2011 12:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[user_sf_zb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[合同编号] [nvarchar](50) NULL,
	[单据编号] [nvarchar](50) NULL,
	[客户编号] [nvarchar](50) NULL,
	[日期年] [nvarchar](50) NULL,
	[日期月] [nvarchar](50) NULL,
	[日期日] [nvarchar](50) NULL,
	[日期] [datetime] NULL,
	[总费用] [money] NULL,
	[缴费金额] [money] NULL,
	[余额] [money] NULL,
	[录入状态] [nvarchar](50) NULL,
	[缴费状态] [nvarchar](50) NULL,
 CONSTRAINT [PK_user_sf_zb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[user_sf_lb]    脚本日期: 05/06/2011 12:44:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[user_sf_lb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[合同编号] [nvarchar](50) NULL,
	[单据编号] [nvarchar](50) NULL,
	[客户编号] [nvarchar](50) NULL,
	[收费项目] [nvarchar](50) NULL,
	[收费类型] [nvarchar](50) NULL,
	[日期年] [nvarchar](50) NULL,
	[日期月] [nvarchar](50) NULL,
	[日期日] [nvarchar](50) NULL,
	[日期] [datetime] NULL,
	[值] [float] NULL,
	[读数] [float] NULL,
	[倍率] [float] NULL,
	[损耗] [float] NULL,
	[滞纳金] [float] NULL,
	[费用] [money] NULL,
	[录入状态] [nvarchar](50) NULL,
 CONSTRAINT [PK_user_sf_lb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[user_gs]    脚本日期: 05/06/2011 12:43:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[user_gs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[编码] [nvarchar](50) NULL,
	[名称] [nvarchar](50) NULL,
	[助记码] [nvarchar](50) NULL,
	[描述] [nvarchar](50) NULL,
	[注册号] [nvarchar](50) NULL,
	[成立日期_年] [nvarchar](50) NULL,
	[成立日期_月] [nvarchar](50) NULL,
	[成立日期_日] [nvarchar](50) NULL,
	[法人代表] [nvarchar](50) NULL,
	[办公地址] [nvarchar](50) NULL,
	[联系电话] [nvarchar](50) NULL,
	[联系方法] [nvarchar](50) NULL,
	[联系人] [nvarchar](50) NULL,
	[备注] [ntext] NULL,
 CONSTRAINT [PK_user_gs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[role_lb]    脚本日期: 05/06/2011 12:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [WYGL].[role_lb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
	[数据录入] [int] NULL,
	[缴费管理] [int] NULL,
	[工业园管理] [int] NULL,
	[房产管理] [int] NULL,
	[客户管理] [int] NULL,
	[预定管理] [int] NULL,
	[租凭合同管理] [int] NULL,
	[合同到期提示] [int] NULL,
	[收款分类统计] [int] NULL,
	[收款详细统计] [char](10) NULL,
	[角色权限] [int] NULL,
	[管理员管理] [int] NULL,
	[修改本身密码] [int] NULL,
	[退出系统] [int] NULL,
 CONSTRAINT [PK_role_lb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [WYGL].[role]    脚本日期: 05/06/2011 12:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[reg]    脚本日期: 05/06/2011 12:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[reg](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gsmc] [nvarchar](50) NULL,
	[gswz] [nvarchar](50) NULL,
	[zcr] [nvarchar](50) NULL,
	[xh] [nvarchar](50) NULL,
	[zch] [nvarchar](50) NULL,
	[zcm] [ntext] NULL,
 CONSTRAINT [PK_reg] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[gyy_lb_fclx_lb_xflx]    脚本日期: 05/06/2011 12:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[gyy_lb_fclx_lb_xflx](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[序号] [int] NULL,
	[工业园名称] [nvarchar](50) NULL,
	[房产类型] [nvarchar](50) NULL,
	[消费项目] [nvarchar](50) NULL,
	[消费类型] [nvarchar](50) NULL,
	[值] [float] NULL,
	[倍率] [float] NULL,
	[损耗] [float] NULL,
	[滞纳金] [nvarchar](50) NULL,
	[说明] [nvarchar](50) NULL,
 CONSTRAINT [PK_gyy_lb_fclx_lb_xflx] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [WYGL].[gyy_lb_fclx_lb]    脚本日期: 05/06/2011 12:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [WYGL].[gyy_lb_fclx_lb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[序号] [int] NULL,
	[工业园名称] [nvarchar](50) NULL,
	[房产类型] [nvarchar](50) NULL,
 CONSTRAINT [PK_gyy_lb_fclx_lb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
