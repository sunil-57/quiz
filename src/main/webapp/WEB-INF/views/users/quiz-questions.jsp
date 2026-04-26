<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>view-quizzes</title>
    <script src="https://cdn.tailwindcss.com"></script>

     <style>
            body.overflow-hidden {
                 overflow: hidden;
             }
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
<script src="https://unpkg.com/flowbite@2.5.1/dist/flowbite.min.js"></script>
<%@ include file="/WEB-INF/views/components/nav.jsp" %>

<div class="sticky-below-nav">
<div class="max-w-screen-xl mx-16 px-16 py-2">
    <!-- Breadcrumb -->
    <nav class="text-base font-medium flex my- py-1 bg-white" aria-label="Breadcrumb">
    <ol class="inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse">
      <li class="inline-flex items-center">
        <a href="${pageContext.request.contextPath}/" class="inline-flex items-center text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400 hover:text-blue-600 dark:text-gray-400 dark:hover:text-gray-400">
          <svg class="w-3 h-3 me-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
            <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
          </svg>
          Home
        </a>
      </li>
      <li>
        <div class="flex items-center">
          <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
          </svg>
          <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.user.userid}" class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400  md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">My Quizzes</a>
        </div>
      </li>
      <li>
        <div class="flex items-center">
          <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
          </svg>
          <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.user.userid}" class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400  md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">${quiz.quizName}</a>
        </div>
      </li>
      <li>
          <div class="flex items-center">
            <svg class="rtl:rotate-180 w-3 h-3 text-gray-400 mx-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
            </svg>
            <a href="${pageContext.request.contextPath}/quizzes/${sessionScope.user.userid}" class="ms-1 text-sm font-medium text-blue-800 hover:text-blue-600 dark:text-gray-900 dark:text-blue-400  md:ms-2 dark:text-gray-400 dark:hover:text-gray-400">Questions</a>
          </div>
      </li>
    </ol>
  </nav>
</div>
<!-- Toast Container -->
<div id="toast-container" class="fixed top-5 right-5 z-50 flex flex-col gap-3"></div>
<div class="max-w-screen-xl mx-16 px-16 py-4">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <c:forEach var="question" items="${questions}" varStatus="status">
            <div class="bg-gray-100 rounded-xl border border-gray-200 px-5 py-4">

                <!-- Question Title -->
                <div class="flex items-center gap-2 mb-4">
                    <span class="text-gray-800 font-bold">Q. ${status.index + 1}</span>
                    <p class="text-gray-800 font-bold">${question.title}</p>
                </div>

                <!-- Options as tags -->
                <div class="flex flex-wrap gap-2 mb-4">
                    <c:forEach var="opt" items="${[question.option1, question.option2, question.option3, question.option4]}" varStatus="optStatus">
                        <c:choose>
                           <c:when test="${not empty opt}">
                               <span class="inline-flex items-center gap-1.5 bg-white border border-gray-300 text-gray-700 text-sm font-medium px-3 py-1.5 rounded-lg shadow-sm">
                                   ${opt}
                                   <form action="${pageContext.request.contextPath}/quizzes/${quiz.quizId}/questions/${question.questionId}"
                                         method="post"
                                         class="inline"
                                         onsubmit="return confirmRemove(this, '${opt}', '${question.correctAnswer}')">
                                       <input type="hidden" name="_method" value="put"/>
                                       <input type="hidden" name="title" value="${question.title}"/>
                                       <input type="hidden" name="correctAnswer" value="${question.correctAnswer}"/>

                                       <input type="hidden" name="option1" value="${optStatus.index == 0 ? '' : question.option1}"/>
                                       <input type="hidden" name="option2" value="${optStatus.index == 1 ? '' : question.option2}"/>
                                       <input type="hidden" name="option3" value="${optStatus.index == 2 ? '' : question.option3}"/>
                                       <input type="hidden" name="option4" value="${optStatus.index == 3 ? '' : question.option4}"/>

                                       <button type="button"
                                               onclick="handleRemove(this, '${opt}', '${question.correctAnswer}')"
                                               class="text-gray-400 hover:text-red-500 cursor-pointer leading-none">×</button>
                                   </form>
                               </span>
                           </c:when>
                            <c:otherwise>
                                <div>
                                    <!-- Add button -->
                                    <button onclick="showInput('opt-${status.index}-${optStatus.index}')"
                                            id="btn-${status.index}-${optStatus.index}"
                                            class="inline-flex items-center gap-1 bg-white border border-dashed border-gray-300 text-gray-400 hover:text-gray-600 hover:border-gray-400 text-sm px-3 py-1.5 rounded-lg transition">
                                        + Add
                                    </button>

                                    <!-- Input form  -->
                                    <form id="opt-${status.index}-${optStatus.index}"
                                          action="${pageContext.request.contextPath}/quizzes/${quiz.quizId}/questions/${question.questionId}"
                                          method="post"
                                          class="hidden inline-flex items-center gap-2">
                                        <input type="hidden" name="_method" value="put"/>
                                        <input type="hidden" name="title" value="${question.title}"/>
                                        <input type="hidden" name="correctAnswer" value="${question.correctAnswer}"/>

                                        <c:if test="${optStatus.index != 0}"><input type="hidden" name="option1" value="${question.option1}"/></c:if>
                                        <c:if test="${optStatus.index != 1}"><input type="hidden" name="option2" value="${question.option2}"/></c:if>
                                        <c:if test="${optStatus.index != 2}"><input type="hidden" name="option3" value="${question.option3}"/></c:if>
                                        <c:if test="${optStatus.index != 3}"><input type="hidden" name="option4" value="${question.option4}"/></c:if>

                                        <input type="text"
                                               name="option${optStatus.index + 1}"
                                               placeholder="Enter option..."
                                               class="border border-gray-300 rounded-lg px-3 py-1.5 text-sm text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"/>
                                        <button type="submit"
                                                class="bg-blue-600 hover:bg-blue-700 text-white text-sm px-3 py-1.5 rounded-lg transition">
                                            Save
                                        </button>
                                        <button type="button"
                                                onclick="hideInput('opt-${status.index}-${optStatus.index}', 'btn-${status.index}-${optStatus.index}')"
                                                class="text-gray-400 hover:text-gray-600 text-sm px-2 py-1.5">
                                            Cancel
                                        </button>
                                    </form>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>

                <!-- Correct Answer -->
                <div class="flex items-center gap-2 pt-3 border-t border-gray-200">
                    <span class="text-xs font-bold text-gray-700">CORRECT ANSWER:</span>
                    <span class="bg-green-50 text-green-600 border border-green-200 text-xs font-semibold px-3 py-1 rounded-lg">
                        ${question.correctAnswer}
                    </span>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
<!-- Delete Confirm Modal -->
        <div id="deleteModal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-modal md:h-full">
            <div class="relative p-4 w-full max-w-md h-full md:h-auto">
                <div class="relative p-4 text-center bg-white rounded-lg shadow dark:bg-gray-800 sm:p-5">
                    <button type="button" onclick="activeModal.hide()"
                        class="text-gray-400 absolute top-2.5 right-2.5 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white">
                        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                        <span class="sr-only">Close modal</span>
                    </button>
                    <svg class="text-gray-400 dark:text-gray-500 w-11 h-11 mb-3.5 mx-auto" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path></svg>
                    <p class="mb-4 text-gray-500 dark:text-gray-300">Are you sure you want to remove this option?</p>
                    <div class="flex justify-center items-center space-x-4">
                        <button type="button" onclick="activeModal.hide()"
                            class="py-2 px-3 text-sm font-medium text-gray-500 bg-white rounded-lg border border-gray-200 hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-primary-300 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">
                            No, cancel
                        </button>
                        <button id="confirm-delete-btn" type="button"
                            class="py-2 px-3 text-sm font-medium text-center text-white bg-red-600 rounded-lg hover:bg-red-700 focus:ring-4 focus:outline-none focus:ring-red-300 dark:bg-red-500 dark:hover:bg-red-600 dark:focus:ring-red-900">
                            Yes, I'm sure
                        </button>
                    </div>
                </div>
            </div>
        </div>
<script>
    let pendingDeleteForm = null;
    let activeModal = null;

    function showToast(type, message) {
        const config = {
            success: {
                icon: `<svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 11.917 9.724 16.5 19 7.5"/></svg>`,
                iconClass: 'text-green-500 bg-green-100',
            },
            danger: {
                icon: `<svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18 17.94 6M18 18 6.06 6"/></svg>`,
                iconClass: 'text-red-500 bg-red-100',
            },
            warning: {
                icon: `<svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 13V8m0 8h.01M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"/></svg>`,
                iconClass: 'text-yellow-500 bg-yellow-100',
            },
        };

        const { icon, iconClass } = config[type];

        const toast = document.createElement('div');
        toast.className = 'flex items-center w-full max-w-sm p-4 text-gray-700 bg-white rounded-lg shadow border border-gray-200';
        toast.setAttribute('role', 'alert');
        toast.innerHTML = `
            <div class="inline-flex items-center justify-center shrink-0 w-8 h-8 ${iconClass} rounded-lg">
                ${icon}
            </div>
            <div class="ms-3 text-sm font-normal">${message}</div>
            <button type="button" onclick="this.parentElement.remove()"
                    class="ms-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8">
                <svg class="w-3 h-3" fill="none" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg"><path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/></svg>
            </button>
        `;

        document.getElementById('toast-container').appendChild(toast);
        setTimeout(() => toast.remove(), 4000);
    }

    function handleRemove(btn, optValue, correctAnswer) {
        if (optValue === correctAnswer) {
                showToast('warning', 'This option is the correct answer. Please change the correct answer before removing it.');
                return;
            }
            pendingDeleteForm = btn.closest('form');
            activeModal = new Modal(document.getElementById('deleteModal'), {
                backdrop: 'dynamic',
                backdropClasses: 'bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-40'
            });
            activeModal.show();
    }


    function showInput(formId) {
        const form = document.getElementById(formId);
        const btn = form.previousElementSibling;
        form.classList.remove('hidden');
        btn.classList.add('hidden');
    }

    function hideInput(formId, btnId) {
        document.getElementById(formId).classList.add('hidden');
        document.getElementById(btnId).classList.remove('hidden');
    }

    document.addEventListener('DOMContentLoaded', () => {
        // Backend toast trigger
        const params = new URLSearchParams(window.location.search);
        const toast = params.get('toast');
        if (toast === 'added') showToast('success', 'Option added successfully.');
        else if (toast === 'deleted') showToast('danger', 'Option removed successfully.');

        if (toast) {
            const url = new URL(window.location);
            url.searchParams.delete('toast');
            window.history.replaceState({}, '', url);
        }

        // Confirm delete
        document.getElementById('confirm-delete-btn').addEventListener('click', () => {
            if (pendingDeleteForm) {
                activeModal.hide();
                pendingDeleteForm.submit();
                pendingDeleteForm = null;
                activeModal = null;
            }
        });
    });
</script>
</body>
</html>
