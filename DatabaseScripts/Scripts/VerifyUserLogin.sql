CREATE PROCEDURE VerifyUserLogin
	@Username NVARCHAR(100), 
	@PasswordHash NVARCHAR(255)

AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (
	SELECT 1 FROM Users
	WHERE Username = @Username
	AND PasswordHash = @PasswordHash
	)
	BEGIN 
		SELECT 'Login Successful' AS Message;
	END
	ELSE
	BEGIN
		SELECT 'Username or Password is invalid' AS Message;
	END
END;