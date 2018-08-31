<table border="1">
	<g:each in="${listCustomers}" var="customer">
		<tr>
			<td>${customer.firstName}</td>
                        <td>${customer.lastName}</td>
                        <td>${customer.email}</td>
                        <td>${customer.message}</td>
                        <td>${customer.notify}</td>
                        <td>${customer.password}</td>
		</tr>
	</g:each>
</table>