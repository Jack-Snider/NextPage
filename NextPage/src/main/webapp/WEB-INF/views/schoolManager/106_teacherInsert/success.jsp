<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script>
//     alert('${msg}');
//     Swal.fire({
//     	  position: 'top',
//     	  icon: 'success',
//     	  title: '${msg}',
//     	  showConfirmButton: false,
//     	  timer: 1500
//     	})
        alert('${msg}');
    location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';

</script>