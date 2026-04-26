<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="min-h-screen bg-gray-900 py-10 px-6">
  <div class="mx-auto max-w-3xl">
    <h1 class="text-3xl font-bold text-white mb-8">Questions</h1>

    <c:choose>
      <c:when test="${empty questions}">
        <div class="flex flex-col items-center justify-center py-24 text-center">
          <p class="text-gray-400 text-lg">No questions available yet.</p>
        </div>
      </c:when>

      <c:otherwise>
        <div class="space-y-4">
          <c:forEach var="question" items="${questions}" varStatus="status">
            <div class="bg-gray-800 rounded-xl p-6 shadow-sm">

              <!-- Question Title -->
              <div class="flex items-start gap-3 mb-5">
                <span class="mt-0.5 flex-shrink-0 w-7 h-7 rounded-full bg-blue-600 text-white text-sm font-bold flex items-center justify-center">
                  <c:out value="${status.index + 1}"/>
                </span>
                <p class="text-white font-semibold text-lg leading-snug">
                  <c:out value="${question.title}"/>
                </p>
              </div>

              <!-- Options Grid -->
              <div class="grid grid-cols-1 sm:grid-cols-2 gap-2 mb-5">
                <c:forEach var="opt" items="${[question.option1, question.option2, question.option3, question.option4]}">
                  <div class="bg-gray-700 rounded-lg px-4 py-2 text-sm text-gray-300">
                    <c:out value="${opt}"/>
                  </div>
                </c:forEach>
              </div>

              <!-- Correct Answer -->
              <div class="flex items-center gap-2">
                <span class="text-xs font-medium text-gray-400 uppercase tracking-wide">Correct Answer</span>
                <span class="bg-green-500/10 text-green-400 text-sm font-semibold px-3 py-1 rounded-full">
                  <c:out value="${question.correctAnswer}"/>
                </span>
              </div>

            </div>
          </c:forEach>
        </div>
      </c:otherwise>
    </c:choose>

  </div>
</section>