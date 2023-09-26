<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html class="h-100">

<head>
    <title>Profile</title>
</head>

<body class="h-100">
    <jsp:include page="GuestNavbar.jsp" />
    <div class="h-100 d-flex flex-column align-items-center justify-content-center m-auto" style="margin-top:80px">
        <h1>Profile</h1>
        <form action="<%= request.getContextPath()%>/user/profile" method="post">
            <div class="mb-3 d-flex align-items-center" style="width:580px">
                <div class="w-25">
                    <label for="username" class="form-label">Name</label>
                </div>
                <div class="w-75">
                    <input type="text" value="${user.userName}" class="form-control" name="username" id="username">
                    <div id="emailHelp" class="form-text">User can only update their username only.</div>
                </div>
            </div>
            <div class="mb-3 d-flex align-items-center" style="width:580px">
                <div class="w-25">
                    <label for="phonenumber" class="form-label">Password</label>
                </div>
                <div class="w-75">
                    <input type="tel" value="${user.phone}" name="phonenumber" class="form-control" id="phonenumber" readonly>
                </div>
            </div>
            <div class="mb-3 d-flex align-items-center" style="width:580px">
                <div class="w-25">
                    <label for="dob" class="form-label">Date of Birth</label>
                </div>
                <div class="w-75">
                    <input type="date" value="${user.dob}" name="dob" class="form-control" id="dob" readonly>
                </div>
            </div>
            <button type="submit" id="edit" class="btn btn-secondary" disabled>Update Profile</button>
            <button type="button" id="logout" class="btn btn-primary" onclick='window.location.href="<%= request.getContextPath() %>/user/logout"'>Logout</button>
        </form>
    </div>

    <script>
				document.getElementById('username').addEventListener('input',(e)=>{
					e.preventDefault();
					const logoutButton = document.getElementById('logout');
				    if (logoutButton) {
				        logoutButton.disabled = true;
				    }
				    const editButton = document.getElementById('edit');
				    if (editButton) {
				        editButton.disabled = false;
				    }
				});
    </script>
</body>

</html>
