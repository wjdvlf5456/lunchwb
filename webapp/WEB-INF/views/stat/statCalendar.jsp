<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta name="og:type" content="article">

<!-- css -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/calendar.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/Powerful-Calendar.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/notification.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/yogiyo.css" rel="stylesheet"
	type="text/css">

<!-- fonts -->
<link href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css"
	rel="stylesheet" type="text/css">

<!-- js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/liveReload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/WOWSlider-about-us.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>



<title>부장님요기요-달력</title>
</head>
<body>
	<div id="wrapper">
		<!-- aside -->
		<c:import url="/WEB-INF/views/includes/aside/userAside.jsp"></c:import>
		<!-- /aside -->

		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">

				<!-- header -->
				<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
				<!-- /header -->

				<div id="main-content" class="container-fluid">
					<div class="calendar card mb-4 calendar-wrapper">
					
					</div>
				</div>
				<!-- content -->
			</div>

			<!-- footer -->
			<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
			<!-- /footer -->
		</div>
		<!-- content-wrapper -->
	</div>
	<!-- wrapper -->
</body>
<script type="text/javascript">

(function ($) {
	  var todayDate = new Date();
	  todayDate.setHours(0, 0, 0, 0);

	  // These are the defaults.
	  var defaults = {
	    date: null,
	    weekDayLength: 1,
	    prevButton: "&lt",
	    nextButton: "&gt",
	    monthYearSeparator: " ",
	    onClickDate: function (date) {},
	    onChangeMonth: function (date) {},
	    onClickToday: function	 (date) {},
	    onClickMonthNext: function (date) {},
	    onClickMonthPrev: function (date) {},
	    onClickYearNext: function (date) {},
	    onClickYearPrev: function (date) {},
	    onShowYearView: function (date) {},
	    onSelectYear: function (date) {},
	    showThreeMonthsInARow: true,
	    enableMonthChange: true,
	    enableYearView: true,
	    showTodayButton: true,
	    highlightSelectedWeekday: true,
	    highlightSelectedWeek: true,
	    todayButtonContent: "Today",
	    showYearDropdown: false,
	    min: null,
	    max: null,
	    disable: function (date) {},
	    startOnSunday: false,
	  };

	  var el,
	    selectedDate,
	    yearView = false;

	  var monthMap = {
	    1: "1월",
	    2: "2월",
	    3: "3월",
	    4: "4월",
	    5: "5월",
	    6: "6월",
	    7: "7월",
	    8: "8월",
	    9: "9월",
	    10: "10월",
	    11: "11월",
	    12: "12월",
	  };

	  var dayMap = {
	    0: "saturday",
	    1: "sunday",
	    2: "monday",
	    3: "tuesday",
	    4: "wednesday",
	    5: "thursday",
	    6: "friday",
	  };

	  var alternateDayMap = {
	    1: "일요일",
	    2: "월요일",
	    3: "화요일",
	    4: "수요일",
	    5: "목요일",
	    6: "금요일",
	    7: "토요일",
	  };
	  
	  function getFirstDayOfMonth(currentDate) {
		    var thisDate =
		      currentDate.getMonth() + 1 + "/1/" + currentDate.getFullYear();
		    console.log(thisDate);
		    return new Date(thisDate);
		  }

		  function getLastDayOfMonth(currentDate) {
		    return new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
		  }

		  function getLastMonthLastDay(currentDate) {
		    var month = currentDate.getMonth();
		    var year = currentDate.getFullYear();
		    if (month === 0) {
		      year -= 1;
		      month = 12;
		    }
		    return new Date(year, month, 0);
		  }

	  function generateWeekData(currentDate, weekNo) {
	    var firstDay = getFirstDayOfMonth(currentDate);
	    var firstDayDate = firstDay.getDate();
	    var lastDay = getLastDayOfMonth(currentDate);
	    var lastDayFromLastMonth = getLastMonthLastDay(currentDate).getDate();
	    var days = [];

	    var daysFromLastMonth = firstDay.getDay();
	    if (settings.startOnSunday) {
	      daysFromLastMonth = daysFromLastMonth - 1;
	    }
	    var daysFromNextMonth = 1;

	    if (weekNo === 1) {
	      for (
	        var dayFromLastMonth = daysFromLastMonth - 1;
	        dayFromLastMonth >= 0;
	        dayFromLastMonth--
	      ) {
	        var dateObj = new Date(
	          currentDate.getFullYear(),
	          currentDate.getMonth() - 1,
	          lastDayFromLastMonth - dayFromLastMonth
	        );
	        days.push(dateObj);
	      }

	      var daysLength = 7 - days.length;
	      for (var monthDate = 0; monthDate < daysLength; monthDate++) {
	        var dateObj = new Date(
	          firstDay.getFullYear(),
	          firstDay.getMonth(),
	          firstDayDate + monthDate
	        );
	        days.push(dateObj);
	      }
	    } else {
	      var startWeekFrom = (weekNo - 1) * 7 - daysFromLastMonth;
	      for (var i = 1; i <= 7; i++) {
	        if (startWeekFrom + i <= lastDay) {
	          var dateObj = new Date(
	            currentDate.getFullYear(),
	            currentDate.getMonth(),
	            startWeekFrom + i
	          );
	          days.push(dateObj);
	        } else {
	          var dateObj = new Date(
	            currentDate.getFullYear(),
	            currentDate.getMonth() + 1,
	            daysFromNextMonth++
	          );
	          days.push(dateObj);
	        }
	      }
	    }
	    return days;
	  }

	  function generateMonthData(currentDate) {
	    var lastMonthLast = getLastDayOfMonth(currentDate).getDate();
	    var lastDayFromMonth = getLastDayOfMonth(currentDate).getDate();
	    var weeks = parseInt(lastMonthLast / 7) + 1;

	    var monthData = [];
	    for (var weekNo = 1; weekNo <= weeks; weekNo++) {
	      monthData.push(generateWeekData(currentDate, weekNo));
	    }
	    var lastBlock = monthData[monthData.length - 1];
	    var lastDayInBlock = lastBlock[lastBlock.length - 1].getDate();

	    if (
	      lastDayInBlock < lastDayFromMonth &&
	      lastDayFromMonth - lastDayInBlock < 7
	    ) {
	      monthData.push(generateWeekData(currentDate, weekNo));
	    }
	    return monthData;
	  }

	  function generateTodayButton() {
	    return (
	      "" +
	      '<div class="special-buttons">' +
	      '<button class="today-button">' +
	      settings.todayButtonContent +
	      "</button>" +
	      "</div>"
	    );
	  }

	  function generateYearHeaderDOM(currentDate) {
	    var str =
	      "" +
	      '<div class="buttons-container">' +
	      (settings.enableMonthChange && settings.enableYearView
	        ? '<button class="prev-button">' + settings.prevButton + "</button>"
	        : "") +
	      '<span class="label-container year-label">';
	    if (settings.showYearDropdown) {
	      str += "" + '<select class="year-dropdown">';
	      for (var i = 2020; i < 2025; i++) {
	        if (i === currentDate.getFullYear()) {
	          str +=
	            '<option selected="selected" value="' + i + '">' + i + '년' + "</option>";
	        } else {
	          str += '<option value="' + i + '">' + i + '년' + "</option>";
	        }
	      }
	      str += "</select>";
	    } else {
	      str += currentDate.getFullYear() + '년';
	    }
	    str +=
	      "</span>" +
	      (settings.enableMonthChange && settings.enableYearView
	        ? '<button class="next-button">' + settings.nextButton + "</button>"
	        : "") +
	      "</div>";
	    return str;
	  }
	  function generateMonthDOM(currentDate) {
		    var str = "";
		    str += '<div class="months-wrapper">';

		    for (var month in monthMap) {
		      if (monthMap.hasOwnProperty(month)) {
		        var showThreeMonthsInARow = "";
		        showThreeMonthsInARow = settings.showThreeMonthsInARow
		          ? " one-third"
		          : "";
		        str +=
		          '<span class="month' +
		          showThreeMonthsInARow +
		          '" data-year="' +
		          currentDate.getFullYear() + 
		          '" data-month="' +
		          month + 
		          '"><span>' +
		          monthMap[month] +
		          "</span></span>";
		      }
		    }

		    str += "</div>";
		    return str;
		  }

		  function generateMonthHeaderDOM(currentDate) {
		    return (
		      "" +
		      '<div class="buttons-container d-flex align-items-center">' +
		      (settings.enableMonthChange
		        ? '<button class="prev-button">' + settings.prevButton + "</button>"
		        : "") +
		      '<span class="label-container month-container">' +
		      '<span class="year-label month fw-bold mb-0 text-uppercase">' +
		      currentDate.getFullYear() + '년' + 
		      "</span>" +
		      settings.monthYearSeparator +
		      '<span class="month-label">' +
		      monthMap[currentDate.getMonth() + 1] +
		      "</span>" +
		      "</span>" +
		      (settings.enableMonthChange
		        ? '<button class="next-button">' + settings.nextButton + "</button>"
		        : "") +
		      "</div>"
		    );
		  }

		  function generateWeekHeaderDOM(currentDate) {
		    var str = "";
	    	str += '<div class="weeks-wrapper header">';
		    str +=
		      '<ol class="day-names list-unstyled week' +
		      (settings.startOnSunday ? " start-on-sunday" : "") +
		      '" data-week-no="' +
		      0 +
		      '">';

		    for (var weekDay in dayMap) {
		      if (dayMap.hasOwnProperty(weekDay)) {
		        str +=
		          '<li class="day header fw-bold text-uppercase" data-day="' +
		          weekDay +
		          '">' +
		          dayMap[weekDay] +
		          "</li>";
		      }
		    }

		    str += "</ol>";
		    str += "</div>";
		    return str;
		  }

		  function generateWeekDOM(monthData, currentDate) {
		    var str = "";
		    str += '<div class="weeks-wrapper">';

		    monthData.forEach(function (week, weekNo) {
		      str +=
		        '<ol class="days week' +
		        (settings.startOnSunday ? " start-on-sunday" : "") +
		        '" data-week-no="' +
		        (weekNo + 1) +
		        '">';

		      week.forEach(function (day, dayNo) {
		        var disabled = false;
		        if (day.getMonth() !== currentDate.getMonth()) disabled = true;
		        disabled = disabled ? " disabled" : "";

		        var selected = false;
		        if (selectedDate) {
		          if (day == selectedDate.toString()) selected = true;
		          selected = selected ? " selected" : "";
		        } else {
		          selected = "";
		        }

		        var today = false;

		        if (day == todayDate.toString()) today = true;
		        today = today ? " today" : "";

		        var dateDisabled = "ola";
		        if (
		          (settings.min && settings.min > day) ||
		          (settings.max && settings.max < day) ||
		          (settings.disable &&
		            typeof settings.disable === "function" &&
		            settings.disable(day))
		        ) {
		          dateDisabled = 'disabled="disabled" ';
		        }

		        str +=
		          '<li class="day' +
		          disabled +
		          selected +
		          today +
		          '" data-date="' +
		          day +
		          '" ' +
		          dateDisabled +
		          " ><div class='date'><span class='d-flex flex-row-reverse'>" +
		          day.getDate() +
		          "</span></div></li>";
		      });

		      str += "</ol>";
		    });
		    str += "</div>";
		    return str;
		  }

		  function generateDomString(monthData, currentDate) {
		    var calendarDump = "";

		    calendarDump += '<div class="calendar-box">';

		    if (yearView) {
		      calendarDump += '<div class="months-container">';

		      calendarDump += generateYearHeaderDOM(currentDate);

		      calendarDump += generateMonthDOM(currentDate);

		      calendarDump += "</div>";
		    } else {
		      calendarDump += '<div class="weeks-container">';

		      calendarDump += generateMonthHeaderDOM(currentDate);

		      calendarDump += generateWeekHeaderDOM(currentDate);

		      calendarDump += generateWeekDOM(monthData, currentDate);

		      calendarDump += "</div>";
		    }

		    if (settings.showTodayButton) {
		      calendarDump += generateTodayButton();
		    }

		    calendarDump += "</div>";

		    return calendarDump;
		  }

		  function highlightDays() {
		    var selectedElement = el.find(".selected");

		    if (selectedElement.length > 0) {
		      var date = new Date(selectedElement.data("date"));
		      var weekDayNo = date.getDay();

		      el.find(".week").each(function (i, elm) {
		        $(elm)
		          .find(".day:eq(" + (weekDayNo - 0) + ")")
		          .addClass("highlight");
		      });
		    }
		  }

		  function highlightWeek() {
		    el.find(".selected").parents(".week").addClass("highlight");
		  }

		  function renderToDom(currentDate) {
		    var monthData = generateMonthData(currentDate);

		    el.html(generateDomString(monthData, currentDate));

		    if (settings.highlightSelectedWeekday) {
		      highlightDays();
		    }
		    if (settings.highlightSelectedWeek) {
		      highlightWeek();
		    }
		  }

		  $.fn.updateCalendarOptions = function (options) {
		    var updatedOptions = $.extend(settings, options);
		    var calendarInitFn = $.fn.calendar.bind(this);
		    calendarInitFn(updatedOptions);
		  };

		  $.fn.calendar = function (options) {
		    settings = $.extend(defaults, options);
		    if (settings.startOnSunday) {
		      dayMap = alternateDayMap;
		    }
		    if (settings.min) {
		      settings.min = new Date(settings.min);
		      settings.min.setHours(0);
		      settings.min.setMinutes(0);
		      settings.min.setSeconds(0);
		    }
		    if (settings.max) {
		      settings.max = new Date(settings.max);
		      settings.max.setHours(0);
		      settings.max.setMinutes(0);
		      settings.max.setSeconds(0);
		    }

		    el = $(this);
		    var currentDate;

		    if (settings.date) {
		      if (typeof settings.date === "string") {
		        selectedDate = new Date(settings.date);
		      } else {
		        selectedDate = settings.date;
		      }
		      selectedDate.setHours(0, 0, 0, 0);
		      currentDate = selectedDate;
		    } else {
		      currentDate = todayDate;
		    }

		    window.currentDate = currentDate;
		    renderToDom(currentDate);

		    if (settings.enableMonthChange) {
		      el.off("click", ".weeks-container .prev-button").on(
		        "click",
		        ".weeks-container .prev-button",
		        function (e) {
		          currentDate = new Date(
		            currentDate.getFullYear(),
		            currentDate.getMonth() - 1,
		            1
		          );
		          settings.onClickMonthPrev(currentDate);
		          renderToDom(currentDate);
		        }
		      );

		      el.off("click", ".weeks-container .next-button").on(
		        "click",
		        ".weeks-container .next-button",
		        function (e) {
		          currentDate = new Date(
		            currentDate.getFullYear(),
		            currentDate.getMonth() + 1,
		            1
		          );
		          settings.onClickMonthNext(currentDate);
		          renderToDom(currentDate);
		        }
		      );
		    }

		    el.off("click", ".day").on("click", ".day", function (e) {
		      var date = $(this).data("date");
		      var isDisabled = $(this).attr("disabled") === "disabled";
		      if (isDisabled) return;
		      settings.onClickDate(date);
		    });

		    if (settings.enableMonthChange && settings.enableYearView) {
		      el.off("click", ".month-container").on(
		        "click",
		        ".month-container",
		        function (e) {
		          yearView = true;
		          currentDate = new Date(currentDate.getFullYear(), 0, 1);
		          settings.onShowYearView(currentDate);
		          renderToDom(currentDate);
		        }
		      );

		      el.off("click", ".months-container .month").on(
		        "click",
		        ".months-container .month",
		        function (e) {
		          var monthEl = $(this);
		          var month = monthEl.data("month");
		          var year = monthEl.data("year");
		          var selectedMonth = new Date(year, month - 1, 1);
		          settings.onChangeMonth(selectedMonth);

		          currentDate = selectedMonth;
		          yearView = false;

		          renderToDom(currentDate);
		        }
		      );

		      el.off("click", ".months-container .prev-button").on(
		        "click",
		        ".months-container .prev-button",
		        function (e) {
		          currentDate = new Date(currentDate.getFullYear() - 1, 0, 1);
		          settings.onClickYearPrev(currentDate);
		          settings.onSelectYear(currentDate);
		          renderToDom(currentDate);
		        }
		      );

		      el.off("click", ".months-container .next-button").on(
		        "click",
		        ".months-container .next-button",
		        function (e) {
		          currentDate = new Date(currentDate.getFullYear() + 1, 0, 1);
		          settings.onClickMonthNext(currentDate);
		          settings.onSelectYear(currentDate);
		          renderToDom(currentDate);
		        }
		      );

		      el.off("change", ".months-container .year-dropdown").on(
		        "change",
		        ".months-container .year-dropdown",
		        function (e) {
		          var year = $(this).val();
		          currentDate = new Date(year, 0, 1);
		          settings.onSelectYear(currentDate);
		          renderToDom(currentDate);
		        }
		      );
		    }

	    if (settings.showTodayButton) {
    	  el.off("click", ".today-button").on(
        	"click",
        	".today-button",
        	function (e) {
	          currentDate = todayDate;
	          selectedDate = todayDate;
	          settings.onClickToday(todayDate);
	          yearView = false;
	          renderToDom(currentDate);
    	    }
     	 );
   	 }
    return this;
  };
})(jQuery);
var config =
    `function selectDate(date) {
      $('.calendar-wrapper').updateCalendarOptions({
        date: date
      });
    }

    var defaultConfig = {
      weekDayLength: 1,
      date: new Date(),
      onClickDate: selectDate,
      showYearDropdown: true,
      startOnSunday: true,
    };

    $('.calendar-wrapper').calendar(defaultConfig);`;

  eval(config);

</script>

</html>