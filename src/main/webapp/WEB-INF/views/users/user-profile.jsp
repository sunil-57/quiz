<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="max-w-6xl mx-auto px-6 py-8">
   <div class="border border-gray-400 rounded-md p-6 bg-white shadow text-lg text-gray-800 space-y-4">
        <p><strong>Full Name:</strong> ${sessionScope.user.fullname}</p>
        <p><strong>Username:</strong> ${sessionScope.user.username}</p>
        <p><strong>Joined Date:</strong> ${sessionScope.user.joinedDate}</p>
        <p>
            <strong>Role:</strong>
            <span class="font-semibold">
                <c:choose>
                    <c:when test="${sessionScope.user.admin}">
                        Admin
                    </c:when>
                    <c:otherwise>
                        User
                    </c:otherwise>
                </c:choose>
            </span>
        </p>
    </div>

    <div class="mt-8 text-center">
        <a href="${pageContext.request.contextPath}/users/settings"
           class="inline-block bg-blue-500 hover:bg-blue-600 text-white font-medium px-6 py-2 rounded">
            Edit Profile
        </a>
    </div>
</div>

</body>
</html>
