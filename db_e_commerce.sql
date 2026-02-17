USE [commerce_db]
GO
/****** Object:  Table [dbo].[Order_Products]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Products](
	[id_prod] [int] NOT NULL,
	[id_order] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [pk_product_order] PRIMARY KEY CLUSTERED 
(
	[id_prod] ASC,
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[date_order] [datetime] NOT NULL,
	[id_status] [int] NOT NULL,
 CONSTRAINT [pk_order] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Methods]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Methods](
	[id_method] [int] IDENTITY(1,1) NOT NULL,
	[name_method] [varchar](20) NOT NULL,
 CONSTRAINT [pk_method] PRIMARY KEY CLUSTERED 
(
	[id_method] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[id_pay] [int] IDENTITY(1,1) NOT NULL,
	[id_order] [int] NOT NULL,
	[date_pay] [datetime] NOT NULL,
	[amount_pay] [decimal](10, 2) NOT NULL,
	[id_method] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[stripe_id] [varchar](100) NULL,
 CONSTRAINT [pk_payment] PRIMARY KEY CLUSTERED 
(
	[id_pay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Shoppings]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Shoppings](
	[id_prod] [int] NOT NULL,
	[id_cart] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [pk_product_shoppings] PRIMARY KEY CLUSTERED 
(
	[id_prod] ASC,
	[id_cart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id_prod] [int] IDENTITY(1,1) NOT NULL,
	[name_prod] [varchar](150) NOT NULL,
	[descr_prod] [varchar](max) NOT NULL,
	[price_prod] [decimal](10, 2) NOT NULL,
	[stock_prod] [int] NOT NULL,
	[active] [char](1) NOT NULL,
 CONSTRAINT [pk_product] PRIMARY KEY CLUSTERED 
(
	[id_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nameRol] [varchar](20) NOT NULL,
 CONSTRAINT [pk_roles] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopping_Carts]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_Carts](
	[id_cart] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
 CONSTRAINT [pk_cart] PRIMARY KEY CLUSTERED 
(
	[id_cart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_Orders]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_Orders](
	[id_st_order] [int] IDENTITY(1,1) NOT NULL,
	[name_st_order] [varchar](20) NOT NULL,
 CONSTRAINT [pk_st_order] PRIMARY KEY CLUSTERED 
(
	[id_st_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status_Payments]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status_Payments](
	[id_st_pay] [int] IDENTITY(1,1) NOT NULL,
	[name_st_pay] [varchar](20) NOT NULL,
 CONSTRAINT [pk_st_payment] PRIMARY KEY CLUSTERED 
(
	[id_st_pay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/2/2026 01:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[name_user] [varchar](20) NOT NULL,
	[pass_user] [varchar](255) NOT NULL,
	[idRol] [int] NOT NULL,
 CONSTRAINT [pk_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Order_Products] ([id_prod], [id_order], [quantity], [price]) VALUES (1, 1, 2, CAST(25.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Products] ([id_prod], [id_order], [quantity], [price]) VALUES (2, 1, 1, CAST(75.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Order_Products] ([id_prod], [id_order], [quantity], [price]) VALUES (3, 2, 1, CAST(220.99 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([id_order], [id_user], [date_order], [id_status]) VALUES (1, 1, CAST(N'2026-02-09T23:12:45.097' AS DateTime), 1)
GO
INSERT [dbo].[Orders] ([id_order], [id_user], [date_order], [id_status]) VALUES (2, 2, CAST(N'2026-02-09T23:12:45.097' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment_Methods] ON 
GO
INSERT [dbo].[Payment_Methods] ([id_method], [name_method]) VALUES (1, N'CASH')
GO
INSERT [dbo].[Payment_Methods] ([id_method], [name_method]) VALUES (2, N'CARD')
GO
INSERT [dbo].[Payment_Methods] ([id_method], [name_method]) VALUES (3, N'STRIPE')
GO
SET IDENTITY_INSERT [dbo].[Payment_Methods] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 
GO
INSERT [dbo].[Payments] ([id_pay], [id_order], [date_pay], [amount_pay], [id_method], [id_status], [stripe_id]) VALUES (1, 1, CAST(N'2026-02-09T23:12:45.097' AS DateTime), CAST(126.00 AS Decimal(10, 2)), 3, 2, N'pi_3NxxStripeExample123')
GO
INSERT [dbo].[Payments] ([id_pay], [id_order], [date_pay], [amount_pay], [id_method], [id_status], [stripe_id]) VALUES (2, 2, CAST(N'2026-02-09T23:12:45.097' AS DateTime), CAST(220.99 AS Decimal(10, 2)), 1, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
INSERT [dbo].[Product_Shoppings] ([id_prod], [id_cart], [quantity]) VALUES (1, 1, 20)
GO
INSERT [dbo].[Product_Shoppings] ([id_prod], [id_cart], [quantity]) VALUES (1, 2, 12)
GO
INSERT [dbo].[Product_Shoppings] ([id_prod], [id_cart], [quantity]) VALUES (2, 1, 1)
GO
INSERT [dbo].[Product_Shoppings] ([id_prod], [id_cart], [quantity]) VALUES (3, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([id_prod], [name_prod], [descr_prod], [price_prod], [stock_prod], [active]) VALUES (1, N'Dados', N'string', CAST(25.50 AS Decimal(10, 2)), 200, N'N')
GO
INSERT [dbo].[Products] ([id_prod], [name_prod], [descr_prod], [price_prod], [stock_prod], [active]) VALUES (2, N'Teclado Mecánico', N'Switch Red, RGB', CAST(75.00 AS Decimal(10, 2)), 50, N'Y')
GO
INSERT [dbo].[Products] ([id_prod], [name_prod], [descr_prod], [price_prod], [stock_prod], [active]) VALUES (3, N'Monitor 24"', N'144Hz Full HD', CAST(220.99 AS Decimal(10, 2)), 20, N'Y')
GO
INSERT [dbo].[Products] ([id_prod], [name_prod], [descr_prod], [price_prod], [stock_prod], [active]) VALUES (4, N'JBL Go Essential', N'JBL GO Essential es un altavoz con Bluetooth portátil y ultracompacto. Reproduzca música en streaming a través de Bluetooth con una autonomía de hasta 5 horas y calidad de sonido JBL Pro original. Olas de entretenimiento con su diseño resistente al agua conforme a la norma IPX7. Disponible en 3 llamativos colores, el GO Essential es el altavoz perfecto para llevar tu música a todas partes.', CAST(59.49 AS Decimal(10, 2)), 550, N'Y')
GO
INSERT [dbo].[Products] ([id_prod], [name_prod], [descr_prod], [price_prod], [stock_prod], [active]) VALUES (5, N'Coca cola 2.5L', N'Bebida gasificada azucarada de 2.5 L', CAST(2.00 AS Decimal(10, 2)), 250, N'Y')
GO
INSERT [dbo].[Products] ([id_prod], [name_prod], [descr_prod], [price_prod], [stock_prod], [active]) VALUES (6, N'Coca cola 2.5L', N'Bebida gasificada azucarada de 2.5 L', CAST(2.00 AS Decimal(10, 2)), 250, N'Y')
GO
INSERT [dbo].[Products] ([id_prod], [name_prod], [descr_prod], [price_prod], [stock_prod], [active]) VALUES (7, N'Coca cola 2.5L', N'Bebida gasificada azucarada de 2.5 L', CAST(2.00 AS Decimal(10, 2)), 250, N'Y')
GO
INSERT [dbo].[Products] ([id_prod], [name_prod], [descr_prod], [price_prod], [stock_prod], [active]) VALUES (8, N'string', N'string', CAST(1.00 AS Decimal(10, 2)), 1, N'Y')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([idRol], [nameRol]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([idRol], [nameRol]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Shopping_Carts] ON 
GO
INSERT [dbo].[Shopping_Carts] ([id_cart], [id_user]) VALUES (1, 1)
GO
INSERT [dbo].[Shopping_Carts] ([id_cart], [id_user]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[Shopping_Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Status_Orders] ON 
GO
INSERT [dbo].[Status_Orders] ([id_st_order], [name_st_order]) VALUES (1, N'CREATED')
GO
INSERT [dbo].[Status_Orders] ([id_st_order], [name_st_order]) VALUES (2, N'PAID')
GO
INSERT [dbo].[Status_Orders] ([id_st_order], [name_st_order]) VALUES (3, N'SHIPPED')
GO
INSERT [dbo].[Status_Orders] ([id_st_order], [name_st_order]) VALUES (4, N'CANCELLED')
GO
SET IDENTITY_INSERT [dbo].[Status_Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Status_Payments] ON 
GO
INSERT [dbo].[Status_Payments] ([id_st_pay], [name_st_pay]) VALUES (1, N'PENDING')
GO
INSERT [dbo].[Status_Payments] ([id_st_pay], [name_st_pay]) VALUES (2, N'APPROVED')
GO
INSERT [dbo].[Status_Payments] ([id_st_pay], [name_st_pay]) VALUES (3, N'REJECTED')
GO
INSERT [dbo].[Status_Payments] ([id_st_pay], [name_st_pay]) VALUES (4, N'REFUNDED')
GO
SET IDENTITY_INSERT [dbo].[Status_Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([id_user], [name_user], [pass_user], [idRol]) VALUES (1, N'galo', N'$2a$11$Gf1HLkDjZ9xcWCt9HqoZJuKImpgSazW4PICljQBT/JcJcbYNuqU4S', 2)
GO
INSERT [dbo].[Users] ([id_user], [name_user], [pass_user], [idRol]) VALUES (2, N'admin', N'$2a$11$eQhwPMKTzKsAnKIDmLjJR.0ozxqsCJ3dmtbAht9N9DrKjtMcpkCbu', 1)
GO
INSERT [dbo].[Users] ([id_user], [name_user], [pass_user], [idRol]) VALUES (3, N'juan', N'$2a$11$C31K2IxjinIuLJdrouv62uNWy3j20xvuwQAv6n7933sY8YHXHiIye', 2)
GO
INSERT [dbo].[Users] ([id_user], [name_user], [pass_user], [idRol]) VALUES (4, N'master', N'$2a$11$hW2ht1gxxKWW7zw0qGv7MexI68f7cxWeQAF0.yCxaXJuCokS69ROG', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [date_order]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [date_pay]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_active]  DEFAULT ('Y') FOR [active]
GO
ALTER TABLE [dbo].[Order_Products]  WITH CHECK ADD  CONSTRAINT [fk_order_product] FOREIGN KEY([id_order])
REFERENCES [dbo].[Orders] ([id_order])
GO
ALTER TABLE [dbo].[Order_Products] CHECK CONSTRAINT [fk_order_product]
GO
ALTER TABLE [dbo].[Order_Products]  WITH CHECK ADD  CONSTRAINT [fk_product] FOREIGN KEY([id_prod])
REFERENCES [dbo].[Products] ([id_prod])
GO
ALTER TABLE [dbo].[Order_Products] CHECK CONSTRAINT [fk_product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_order_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[Status_Orders] ([id_st_order])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_order_status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [fk_method] FOREIGN KEY([id_method])
REFERENCES [dbo].[Payment_Methods] ([id_method])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [fk_method]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([id_order])
REFERENCES [dbo].[Orders] ([id_order])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [fk_order]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [fk_payment_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[Status_Payments] ([id_st_pay])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [fk_payment_status]
GO
ALTER TABLE [dbo].[Product_Shoppings]  WITH CHECK ADD  CONSTRAINT [fk_cart] FOREIGN KEY([id_cart])
REFERENCES [dbo].[Shopping_Carts] ([id_cart])
GO
ALTER TABLE [dbo].[Product_Shoppings] CHECK CONSTRAINT [fk_cart]
GO
ALTER TABLE [dbo].[Product_Shoppings]  WITH CHECK ADD  CONSTRAINT [fk_product_cart] FOREIGN KEY([id_prod])
REFERENCES [dbo].[Products] ([id_prod])
GO
ALTER TABLE [dbo].[Product_Shoppings] CHECK CONSTRAINT [fk_product_cart]
GO
ALTER TABLE [dbo].[Shopping_Carts]  WITH CHECK ADD  CONSTRAINT [fk_user_cart] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Shopping_Carts] CHECK CONSTRAINT [fk_user_cart]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_roles_user] FOREIGN KEY([idRol])
REFERENCES [dbo].[Roles] ([idRol])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_roles_user]
GO
ALTER TABLE [dbo].[Order_Products]  WITH CHECK ADD CHECK  (([id_order]>(0)))
GO
ALTER TABLE [dbo].[Order_Products]  WITH CHECK ADD CHECK  (([id_prod]>(0)))
GO
ALTER TABLE [dbo].[Order_Products]  WITH CHECK ADD CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[Order_Products]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([id_status]>(0)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([id_user]>(0)))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([amount_pay]>(0)))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([id_method]>(0)))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([id_order]>(0)))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([id_status]>(0)))
GO
ALTER TABLE [dbo].[Product_Shoppings]  WITH CHECK ADD CHECK  (([id_cart]>(0)))
GO
ALTER TABLE [dbo].[Product_Shoppings]  WITH CHECK ADD CHECK  (([id_prod]>(0)))
GO
ALTER TABLE [dbo].[Product_Shoppings]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([active]='N' OR [active]='Y'))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([price_prod]>(0)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD CHECK  (([stock_prod]>=(0)))
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Products_active] CHECK  (([active]='N' OR [active]='Y'))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_active]
GO
ALTER TABLE [dbo].[Shopping_Carts]  WITH CHECK ADD CHECK  (([id_user]>(0)))
GO
