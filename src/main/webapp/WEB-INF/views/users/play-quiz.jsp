<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${quiz.quizName}</title>
      <script src="https://cdn.tailwindcss.com"></script>
      <script src="https://unpkg.com/flowbite@2.5.1/dist/flowbite.min.js"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
<div class="bg-white p-6 rounded-lg shadow-md w-full max-w-lg">
    <h2 class="text-xl font-bold mb-4">Question ${questionIndex} of ${totalQuestions}</h2>
    <p class="text-lg font-medium mb-6">${question.title}</p>
    <p class="text-lg font-medium mb-6">Score: ${sessionScope.score}</p>
    <form action="${pageContext.request.contextPath}/games/check/${quizId}/${questionIndex}" method="post" class="space-y-4">
        <input type="hidden" name="questionId" value="${question.questionId}"/>
        <c:if test="${empty sessionScope.score}">
            <c:set var="score" value="0" scope="session" />
        </c:if>

        <label class="flex items-center gap-2">
            <input type="radio" name="selectedOption" value="${question.option1}" required>
            ${question.option1}
        </label>
        <label class="flex items-center gap-2">
            <input type="radio" name="selectedOption" value="${question.option2}">
            ${question.option2}
        </label>
        <label class="flex items-center gap-2">
            <input type="radio" name="selectedOption" value="${question.option3}">
            ${question.option3}
        </label>
        <label class="flex items-center gap-2">
            <input type="radio" name="selectedOption" value="${question.option4}">
            ${question.option4}
        </label>
        <input type="hidden" name="isLast" value="${questionIndex == totalQuestions ? "1" : "0"}"/>
        <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded">
            ${questionIndex == totalQuestions ? "Finish Quiz" : "Next Question"}
        </button>
    </form>
</div>
</body>
</html>
