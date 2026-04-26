<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%@ include file="/WEB-INF/views/components/nav.jsp" %>
<!-- Sticky container for breadcrumb and category filter -->
<div class="sticky-below-nav">
    <div class="max-w-screen-xl mx-16 px-16 py-2">
        <!-- Breadcrumb -->
        <nav class="text-base font-medium flex my-1 py-1" aria-label="Breadcrumb">
            <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
                <li class="inline-flex items-center">
                    <a href="${pageContext.request.contextPath}/"
                       class="inline-flex items-center text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 hover:text-blue-600 dark:text-gray-400 dark:hover:text-gray-400">
                        <svg class="w-3 h-3 me-2.5" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                            <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
                        </svg>
                        Home
                    </a>
                </li>
                <li>
                    <div class="flex items-center">
                        <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
                        </svg>
                        <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.user.userid}"
                           class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">
                            My Quizzes
                        </a>
                    </div>
                </li>
            </ol>
        </nav>

        <!-- Category Filter -->
        <nav class="text-base font-medium flex my-1 py-1" aria-label="Breadcrumb">
            <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
                <li class="inline-flex items-center">
                    <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.user.userid}"
                       class="inline-flex items-center text-blue-800 hover:text-blue-600 dark:hover:text-gray-400 dark:text-gray-900 dark:text-blue-400
                       ${empty param.category ? 'text-lg underline font-extrabold dark:font-extrabold' : ''}">
                        All(${quizCount})
                    </a>
                </li>
                <c:forEach var="category" items="${categories}">
                    <li>
                        <div class="flex items-center">
                            <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.user.userid}?category=${category.categoryName}"
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
<div class="max-w-screen-xl mx-16 px-16 py-2">
    <!-- Quiz Cards -->
    <div class="my-2 py-2 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <c:forEach var="quiz" items="${quizzes}">
            <div class="w-full max-w-sm bg-white border border-gray-200 rounded-lg shadow-sm dark:bg-gray-800 dark:border-gray-700 px-2 py-1 flex flex-col">
                <!-- Dropdown -->
                <div class="flex justify-end px-4 pt-1">
                    <button id="dropdownButton-${quiz.quizId}" data-dropdown-toggle="dropdown-${quiz.quizId}"
                            class="inline-block text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700
                                   focus:ring-4 focus:outline-none focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-1.5"
                            type="button">
                        <span class="sr-only">Open dropdown</span>
                        <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 3">
                            <path d="M2 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Zm6.041 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM14 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3Z"/>
                        </svg>
                    </button>
                    <div id="dropdown-${quiz.quizId}" class="z-10 hidden text-base list-none bg-white divide-y divide-gray-100
                                                            rounded-lg shadow-sm w-44 dark:bg-gray-700">
                        <ul class="py-2" aria-labelledby="dropdownButton-${quiz.quizId}">
                            <li>
                                <a href="${pageContext.request.contextPath}/quizzes/${quiz.quizId}"
                                   class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">
                                    Edit
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/quizzes/${quiz.quizId}/create-question" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">
                                    Add Questions
                                </a>
                            </li>
                            <li>
                                <form action="${pageContext.request.contextPath}/quizzes/${quiz.quizId}" method="post"
                                      class="block px-4 py-2 text-sm text-red-600 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white"
                                      onsubmit="return confirm('Are you sure you want to delete ${quiz.quizName}?');">
                                    <input type="hidden" name="_method" value="delete" />
                                    <button> Delete </button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Card Content -->
                <div class="flex flex-col items-center py-2 flex-1">
                    <img class="w-48 h-48 my-2 rounded-full shadow-lg"
                         src="https://flowbite.com/docs/images/people/profile-picture-3.jpg"
                         alt="${quiz.quizName} image"/>

                    <!-- Text aligned left -->
                    <div class="w-full text-left px-2 py-2">
                        <h5 class="text-2xl font-medium text-gray-900 dark:text-white mb-2">${quiz.quizName}</h5>
                        <span class="bg-blue-100 text-blue-800 text-sm font-semibold px-2 py-1 rounded-sm dark:bg-blue-200 dark:text-blue-800">
                            ${quiz.category.categoryName}
                        </span>
                        <p class="mt-3 text-base font-medium text-gray-500 dark:text-gray-400 line-clamp-1" title="${quiz.quizDesc}">
                            ${quiz.quizDesc}
                        </p>
                        <p class="mt-2 text-base text-gray-600 dark:text-gray-300">
                            <span class="font-semibold">Questions in Game:</span> <strong>${quiz.noOfQuestionToPlay}</strong>
                        </p>
                    </div>

                    <!-- Buttons -->
                    <div class="flex mt-2 md:mt-2 justify-center">
                        <form action="${pageContext.request.contextPath}/quizzes/${quiz.quizId}" method="post"
                              class="inline-flex whitespace-nowrap items-center px-4 py-2 text-sm font-medium text-center text-white
                                     ${quiz.status ? 'bg-red-700 hover:bg-red-800' : 'bg-blue-700 hover:bg-blue-800'}
                                     rounded-lg focus:ring-4 focus:outline-none
                                     ${quiz.status ? 'focus:ring-red-300' : 'focus:ring-blue-300'}
                                     dark:${quiz.status ? 'bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800' : 'bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800'}">
                            <input type="hidden" name="_method" value="put" />
                            <button>${quiz.status ? 'Set Inactive' : 'Set Active'}</button>
                        </form>
                        <a href="${pageContext.request.contextPath}/quizzes/${quiz.quizId}/questions"
                           class="py-2 px-4 ms-2 text-sm font-medium text-gray-900 focus:outline-none bg-white
                                  rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700
                                  focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700
                                  dark:bg-gray-800 dark:text-gray-500 dark:border-gray-600 dark:hover:text-white
                                  dark:hover:bg-gray-700 whitespace-nowrap">
                            View Questions
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
