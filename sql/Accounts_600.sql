DECLARE @counter int
SET @counter = 1
WHILE @counter < 600

BEGIN
	INSERT [dbo].[Accounts] ([AccountID], [Password], [ExpireDate], [AccountEnabled], [LastLogin]) 
	VALUES (N'Guest'+CAST(@counter as nvarchar), N'test', CAST(0x00011D7800000000 AS DateTime), N'Y',  CAST(0xFFFFFFFE00000000 AS DateTime))
    SET @counter = @counter + 1
END
