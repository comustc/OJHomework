<%@ page language="java" contentType="text/html; charset=GB2312"
	pageEncoding="GB2312"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<html>
<head>
<title>ѧ������</title>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<base href="<%=basePath%>">
<link rel="SHORTCUT ICON" href="images/icon.ico">
<link rel="BOOKMARK" href="images/icon.ico">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/head.css">
<link rel="stylesheet" type="text/css" href="css/list_main.css">
<link rel="stylesheet" type="text/css" href="css/modal.css">
</head>
<body>
	<!--ͷ��-->
	<jsp:include page="share/head.jsp"></jsp:include>

	<!--�м����岿��-->
	<div class="main">
		<!--ѧ��-->
		<div class="list" id="student_list">
			<!--������-->
			<div class="search form-inline">
				<form action="admin/student/list" method="post" onsubmit="return searchStudent(this);">
					<input type="text" class="form-control" name="search" style="width: 300px;">
					&nbsp;&nbsp;
					<button class="btn btn-default" type="submit">����</button>
				</form>
			</div>
			<!--������ť-->
			<div class="operation_btn">
				<button class="btn btn-success btn-xs" onclick="toggleStudentAdd(true);">���ѧ��</button>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="15%">ѧ��</th>
						<th width="30">ѧ������</th>
						<th width="40%">�༶</th>
						<th width="15%">����</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageBean.records}" var="student">
						<tr>
							<td>${student.id}</td>
							<td>${student.name}</td>
							<td>${student.clazz.grade.grade}��${student.clazz.major.name}${student.clazz.cno}��</td>
							<td>
								<button class="btn btn-default btn-xs" onclick="toggleStudentEdit(true, this);">�༭</button>
								<button class="btn btn-danger btn-xs" onclick="deleteStudent(this);">ɾ��</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--��ҳ-->
		<div class="page">
			<!-- ����javascript�ύ���������� -->
			<input type="hidden" id="search_content" value="${search}">
			<script type="text/javascript">
				function page(pageCode) {
					var search = document.getElementById("search_content").value;
					window.location.href = "${pageContext.request.contextPath}/admin/student/list?pn=" + pageCode + "&search=" + search;
				}
			</script>
			<jsp:include page="../share/page.jsp"></jsp:include>
		</div>
	</div>
	
	<!--ѧ�����-->
	<div class="modal_window student_window form-control" id="student_add">
		<!--����-->
		<div class="modal_window_title">
			���ѧ��: <img src="images/error.png" onclick="toggleStudentAdd(false);">
		</div>
		<form action="admin/student/add" method="post" onsubmit="return addStudent(this);">
			<table>
				<tr>
					<td>ѧ��:</td>
					<td>
						<input type="text" name="id">
					</td>
				</tr>
				<tr>
					<td>
						�꼶:
					</td>
					<td>
						<select name="grade" id="grade_select_add" onchange="changeMajor(this, true);">
							<option value="0">�꼶...</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						רҵ:
					</td>
					<td>
						<select id="major_select_add" name="major" onchange="changeClazz(this, true);">
							<option value="0">רҵ...</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						�༶:
					</td>
					<td>
						<select id="clazz_select_add" name="clazz">
							<option value="0">�༶...</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>ѧ������:</td>
					<td><input type="text" name="student"></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><span class="error" id="student_add_error">&nbsp;</span>
					</td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><input type="submit" value="�ύ"></td>
				</tr>
			</table>
		</form>
	</div>
	<!--ѧ���޸�-->
	<div class="modal_window student_window form-control" id="student_edit">
		<!--����-->
		<div class="modal_window_title">
			�༭ѧ��: <img src="images/error.png" onclick="toggleStudentEdit(false);">
		</div>
		<form action="" id="student_edit_form" method="post" onsubmit="return editStudent(this);">
			<!--�ύ��¼id-->
			<input type="hidden" name="id" id="student_edit_id">
			<table>
				<tr>
					<td>
						�꼶:
					</td>
					<td>
						<select name="grade" id="grade_select_edit" onchange="changeMajor(this, false);">
							<option value="0">�꼶...</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						רҵ:
					</td>
					<td>
						<select id="major_select_edit" name="major" onchange="changeClazz(this, false);">
							<option value="0">רҵ...</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						�༶:
					</td>
					<td>
						<select id="clazz_select_edit" name="clazz">
							<option value="0">�༶...</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>ѧ������:</td>
					<td><input type="text" name="student" id="student_edit_name"></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><span class="error" id="student_edit_error">&nbsp;</span>
					</td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2"><input type="submit" value="�ύ"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript" src="script/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script src="script/admin/student.js">
<script src="script/time.js"></script>
<script src="script/tips.js"></script>
</html>