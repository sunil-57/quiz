<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://unpkg.com/flowbite@2.5.1/dist/flowbite.min.js"></script>
<script>
  tailwind.config = {
    plugins: [tailwindcssLineClamp],
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/line-clamp@0.4.4"></script>
<nav class="px-16 py-2 sticky top-0 z-50 shadow-md bg-white border-gray-200 dark:bg-gray-900 dark:border-gray-700">
  <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-16 p-4">
    <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-3 rtl:space-x-reverse">
        <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="Quiz Logo" />
        <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Quiz</span>
    </a>
    <button data-collapse-toggle="navbar-dropdown" type="button" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-dropdown" aria-expanded="false">
        <span class="sr-only">Open main menu</span>
        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15"/>
        </svg>
    </button>
    <div class="hidden w-full md:block md:w-auto" id="navbar-dropdown">
      <ul class="flex flex-col font-medium text-base p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
        <li>
          <a href="${pageContext.request.contextPath}/" class="items-center flex py-2 px-3 ${activePage == 'home' ? 'text-gray-700 font-bold dark:font-bold hover:text-blue-100 dark:text-blue-700 dark:hover:text-blue-100' : 'text-gray-700 hover:text-blue-100 dark:text-white dark:hover:text-blue-100'} rounded-sm" aria-current="page">Home</a>
        </li>
        <c:if test="${not empty sessionScope.user and sessionScope.user.admin}">
            <li>
                 <a href="${pageContext.request.contextPath}/add-category" class="items-center flex py-2 px-3 ${activePage == 'create-category' ? 'text-gray-700 font-extrabold dark:font-extrabold hover:text-blue-100 dark:text-blue-700 dark:hover:text-blue-100' : 'text-gray-700 font-medium dark:font-medium hover:text-blue-100 dark:text-white dark:hover:text-blue-100'} rounded-sm">Create Category</a>
            </li>
        </c:if>
        <li>
          <a href="${pageContext.request.contextPath}/categories" class="items-center flex py-2 px-3 ${activePage == 'categories' ? 'text-gray-700 font-extrabold dark:font-extrabold hover:text-blue-100 dark:text-blue-700 dark:hover:text-blue-100' : 'text-gray-700 font-medium dark:font-medium hover:text-blue-100 dark:text-white dark:hover:text-blue-100'} rounded-sm">Categories</a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/create-quiz" class="items-center flex py-2 px-3 ${activePage == 'create-quiz' ? 'text-gray-700 font-extrabold dark:font-extrabold hover:text-blue-100 dark:text-blue-700 dark:hover:text-blue-100' : 'text-gray-700 font-medium dark:font-medium hover:text-blue-100 dark:text-white dark:hover:text-blue-100'} rounded-sm">Create Quiz</a>
        </li>
        <li>
          <a href="${pageContext.request.contextPath}/quizzes" class="items-center flex py-2 px-3 ${activePage == 'quizzes' ? 'text-gray-700 font-bold dark:font-bold hover:text-blue-100 dark:text-blue-700 dark:hover:text-blue-100' : 'text-gray-700 font-medium dark:font-medium hover:text-blue-100 dark:text-white dark:hover:text-blue-100'} rounded-sm">Quizzes</a>
        </li>
        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <li>
                    <a href="${pageContext.request.contextPath}/log-in"
                       class="items-center flex py-2 px-3 text-gray-700 hover:text-blue-100 dark:text-white dark:hover:text-blue-100 rounded-sm">
                        Log In
                    </a>
                </li>
                <li>
                    <div class="relative">
                        <a href="${pageContext.request.contextPath}/sign-up"
                           class="items-center flex py-2 px-3 text-gray-700 hover:text-blue-100 dark:text-white dark:hover:text-blue-100 rounded-sm">
                            Sign Up
                        </a>
                    </div>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <div class="relative">
                        <button id="dropdownNavbarLink" data-dropdown-toggle="dropdownNavbar"
                                class="items-center flex py-2 px-3 text-gray-700 font-extrabold dark:font-extrabold hover:text-blue-100 dark:text-white dark:hover:text-blue-100 rounded-sm">
                            <c:out value="${sessionScope.user.username}" />
                            <svg class="w-2.5 h-2.5 ml-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="m1 1 4 4 4-4" />
                            </svg>
                        </button>
                        <div id="dropdownNavbar"
                             class="z-10 hidden font-normal bg-white divide-y divide-gray-100 rounded-lg shadow w-44">
                            <ul class="py-2 text-sm text-gray-700">
                                <li>
                                    <a href="${pageContext.request.contextPath}/users/profile"
                                       class="block px-4 py-2 hover:bg-gray-100">Profile</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/users/settings"
                                       class="block px-4 py-2 hover:bg-gray-100">Settings</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.user.userid}"
                                       class="block px-4 py-2 hover:bg-gray-100">My Quizzes</a>
                                </li>
                            </ul>
                            <div class="py-1">
                                <a href="${pageContext.request.contextPath}/users/log-out"
                                   class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Sign out</a>
                            </div>
                        </div>
                    </div>
                </li>
            </c:otherwise>
        </c:choose>

      </ul>
    </div>
  </div>
</nav>
