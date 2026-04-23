<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>view-quizzes</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/flowbite@2.5.1/dist/flowbite.min.js"></script>
    <style>
        .sticky-below-nav {
            position: sticky;
            top: 5.5rem;
            z-index: 45;
            background-color: white;
        }
        .dark .sticky-below-nav {
            background-color: #1f2937;
            border-bottom-color: #374151;
        }
    </style>
</head>
<body>
<c:set var="activePage" value="quizzes" scope="request" />
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<div class="sticky-below-nav">
<div class="max-w-screen-xl mx-16 px-16 py-2">
    <!-- Breadcrumb -->
    <nav class="text-base font-medium flex my-1 py-1" aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
          <li class="inline-flex items-center">
            <a href="${pageContext.request.contextPath}/quizzes"
               class="inline-flex items-center text-blue-800 hover:text-blue-600 dark:hover:text-gray-400 dark:text-gray-900 dark:text-blue-400
                      ${empty param.category ? 'text-lg underline font-extrabold dark:font-extrabold' : ''}">
              All(${quizCount})
            </a>
          </li>
          <c:forEach var="category" items="${categories}">
              <li>
                <div class="flex items-center">
                  <a href="${pageContext.request.contextPath}/quizzes?category=${category.categoryName}"
                     class="ms-1 text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 md:ms-2 dark:text-gray-400 dark:hover:text-gray-400
                            ${category.categoryName == param.category ? 'text-lg underline font-extrabold dark:font-extrabold' : ''}">
                    ${category.categoryName}(${categoryCounts[category.categoryName] != null ? categoryCounts[category.categoryName] : 0})
                  </a>
                </div>
              </li>
          </c:forEach>
        </ol>
    </nav>
</div>
</div>

<div class="max-w-screen-xl mx-16 px-16 py-4">
    <!-- Quiz Cards -->
    <div class="my-2 py-2 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <c:forEach var="quiz" items="${quizzes}">
            <div class="w-full max-w-sm bg-white border border-gray-200 rounded-2xl shadow-sm dark:bg-gray-800 dark:border-gray-700">
                <a href="#">
                    <img class="px-8 py-4 rounded-t-lg" src="https://flowbite.com/docs/images/products/apple-watch.png" alt="quiz image" />
                </a>
                <div class="px-4 py-4">
                    <a href="#">
                        <h5 class="text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">${quiz.quizName}</h5>
                    </a>
                    <div class="flex items-center py-2">
                        <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2 py-1 rounded-sm dark:bg-blue-200 dark:text-blue-800">${quiz.category.categoryName}</span>

                        <div class="flex items-center space-x-1 px-4 rtl:space-x-reverse">
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                        </div>
                    </div>
                    <span class="mt-2 text-base font-medium text-gray-500 dark:text-gray-400 line-clamp-1" title="${quiz.quizDesc}">
                        ${quiz.quizDesc}
                    </span>
                    <p class="mt-2 text-base text-gray-600 dark:text-gray-300">
                        <span class="font-semibold">Questions in Game:</span> <strong>${quiz.noOfQuestionToPlay}</strong>
                    </p>
                    <div class="flex items-center justify-between pt-4">
                        <span class="text-lg font-extrabold text-gray-900 dark:text-white truncate max-w-[12rem]" title="${quiz.user.username}">
                            Quiz by: ${quiz.user.username}
                        </span>
                        <c:set var="questionIndex" value="1"/>
                        <c:set var="quizUrl" value = "${pageContext.request.contextPath}/games/${quiz.quizId}/${questionIndex}"/>
                        <c:choose>
                            <c:when test="${quiz.status}">
                                <a href="${quizUrl}"
                                   class="text-white font-medium rounded-lg text-sm px-5 py-2.5 text-center whitespace-nowrap
                                          bg-blue-700 hover:bg-blue-500 focus:ring-blue-300
                                          dark:bg-blue-800 dark:hover:bg-blue-500 dark:focus:ring-blue-700">
                                    Start Quiz
                                </a>
                            </c:when>
                            <c:otherwise>
                                <span
                                   class="text-white font-medium rounded-lg text-sm px-5 py-2.5 text-center whitespace-nowrap
                                          bg-slate-500 hover:bg-slate-600 focus:ring-slate-300
                                          dark:bg-slate-600 dark:hover:bg-slate-700 dark:focus:ring-slate-800
                                          opacity-65 cursor-not-allowed">
                                    Available Soon
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
