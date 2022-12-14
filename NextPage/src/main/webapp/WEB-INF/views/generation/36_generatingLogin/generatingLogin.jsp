<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
#loginBtn{
    width: 409px;
}
#findIdBtn{
    width: 170px;
}
#findPwBtn{
    width: 165px;
}

#btnArea{
	padding-left: 47px;
}
.autoLogin{
margin-bottom:20px;
}
</style>


<%
	String sessionId=(String)session.getAttribute("id");
%>
<div class="site-section" style="margin: 80px;">
	<div class="container-fluid p-0 mb-5">


		<div class="row justify-content-center">
			<div class="col-md-5">
				<div class="row">
					<form method="post" action="${pageContext.request.contextPath}/generation/{id}/login">
						<div class="m-3">
							<div class="col-md-12 form-group m-3">
								<label for="username">ID</label>
								<input type="text" name="memId"	id="memId" class="form-control form-control-lg" />
							</div>
							<div class="col-md-12 form-group m-3">
								<label for="pword">Password</label>
								<input type="password" name="memPw" id="memPw" class="form-control form-control-lg" />
							</div>
								<div class="row" id="btnArea">
								
									<button type="button" onclick = "location.href ='<%=request.getContextPath()%>/generation/<%=sessionId %>/login/autoStudent'"
										class="btn btn-light btn-lg px-3 autoLogin">Student</button>
									<button type="button" onclick = "location.href ='<%=request.getContextPath()%>/generation/<%=sessionId %>/login/autoEdu'"
										class="btn btn-light btn-lg px-3 autoLogin">Edu</button>
									<button type="button" onclick = "location.href ='<%=request.getContextPath()%>/generation/<%=sessionId %>/login/autoParents'"
										class="btn btn-light btn-lg px-3 autoLogin">Parents</button>
									<button type="button" onclick = "location.href ='<%=request.getContextPath()%>/generation/<%=sessionId %>/login/autoAdmin'"
										class="btn btn-light btn-lg px-3 autoLogin" >School Admin</button>	
									
									<input type="submit" value="?????????" id="loginBtn" class="btn btn-primary btn-lg px-5">
									<button id="findIdBtn" type="button" onclick = "location.href ='<%=request.getContextPath()%>/generation/<%=sessionId %>/find/id'"
										class="btn btn-danger btn-lg px-3 m-3">???????????????</button>
									<button id="findPwBtn" type="button" onclick = "location.href ='<%=request.getContextPath()%>/generation/<%=sessionId %>/find/pw'"
										class="btn btn-success btn-lg px-3 m-3">??????????????????</button>
								</div>
							</div>
					</form>
					<br>
					<div></div>
					<br> <br>
					<div></div>
					<br>
					<div>
						<p>??? ??????????????? ???????????? ???????????????.</p>
						<p>??? ??????/???????????? ??????/????????? ?????? ????????????.</p>
						<p>??? ???????????? ????????? ???????????? ?????? ???????????????.</p>
					</div>
				</div>
			</div>
		</div>



	</div>
</div>

