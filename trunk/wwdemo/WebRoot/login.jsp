<%@taglib uri="/webwork" prefix="ww"%>

<html>
	<head>
		<title>Login</title>
	</head>
	<body>

		<ww:form method="POST" action="login">
			<ww:textfield name="user.name" label="User Name" />
			<ww:password name="user.password" label="Password" />
			<ww:submit label="Submit" />
		</ww:form>

	</body>
</html>

