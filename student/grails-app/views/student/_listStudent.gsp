<table>
<thead>
<th>FirstName</th>
<th>LastName</th>
<th>Email</th>

</thead>
<g:each in="${listStudents}" var="student">
<tr>
<td>${student.firstName}</td>
<td>${student.lastName}</td>
<td>${student.email}</td>

<td><a href="javascript:updateStudent(${student.id})">update</a></td>
<td><a href="javascript:deleteStudent(${student.id})">delete</a></td>


</tr>



</g:each>



</table>