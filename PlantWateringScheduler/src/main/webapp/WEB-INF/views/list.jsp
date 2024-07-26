<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <style type="text/css">
	    body {
			position: relative;
			width: 100vw;
			height: 100vh;
		}
		.title {
			position: relative;
			align-items: center;
		}
		.add {
			width: 60px;
	    	height: 60px;
	    	position: absolute;
	    	top: 0;
	    	right: 10px;
	    	display: flex;
	    	justify-content: center;
	    	align-items: center;
	    	color: #75b064;
	    	}
		.add:hover {
	    	cursor: pointer;
	    	color: #598c4a;
		}
		.add a {
			color: black;
		}
		h3 {
			text-align: center;
			color: gray;
		}
		.container {
			width: 500px;
			position: absolute;
			border: 1px solid lightGray;
			box-shadow: 10px 10px 10px rgba(0,0,0,.5);
			border-radius: 14px;
			padding: 20px;
			top: 50%;
			left: 50%;
			transform: translate(-50%,-50%);
		}
	    .plant-item {
	    	display: flex;
	    	justify-content: space-around;
	    	margin: 30px 0;
	    }
	    .date {
	    	flex-direction: column;
	    	justify-content: center;
	    	align-items: center;
	    }
	    .next-date-title {
	    	font-weight: 600;
	    }
	    .next-date {
	    	color: green;
	    	margin-top: 5px;
	    }
	    .circle {
	    	width: 70px;
	    	height: 70px;
	    	border-radius: 50%;
	    	background: #75b064;
	    	color: white;
	    	display: flex;
	    	justify-content: center;
	    	align-items: center;
	    }
	    .circle:hover {
	    	cursor: pointer;
	    	background: #598c4a;
	    }
	    .information {
	    	flex-derection: column;
	    }
	    .plant-profile {
	    	width: 100%;
	    	height: 100%;
	    	object-fit: cover;
	    	
	    }
	    .plant-name {
	    	font-weight: 600;
	    }
	    .no-data {
	    	text-align: center;
	    }
	    .button-group {
	    	display: flex;
	    	gap: 15px;
	    	margin-top: 5px;
	    }
	    .edit, .delete {
	    	width: 30px;
	    	height: 30px;
	    }
	    .edit {
	    	color: #70a5fa;
	    }
	    .edit:hover {
	    	cursor: pointer;
	    	color: #295294;
	    }
	    .delete {
	    	color: #fa848a;
	    }
	    .delete:hover {
	    	cursor: pointer;
	    	color: #f73942;
	    }
	    a{
	    	color: white;
	    }
	    a:hover {
	    	text-decoration: none;
	    }
	    .pagination-container {
	    	display: flex;
	    	justify-content: center;
	    	gap: 10px;
	    }
	    .number-button-wrapper span {
	    	margin-right: 10px;
	    }
	    .number-button-wrapper span:last-child {
	    	margin-right: 0px;
	    }
	    .prev-button, .next-button {
	    	color: #75b064;
	    }
	    .prev-button:hover, .next-button:hover {
	    	color: #598c4a;
	    	cursor: pointer;
	    }
	    .number-button {
	    	color: gray;
	    }
	    .number-button:hover {
	    	cursor: pointer;
	    }
    </style>
</head>
<body>
<div class="container">
	<div class="title">
		<h3 class="p-3">내 식물</h3>
	<div class="add">
		<a href="form">
   			<span class="material-symbols-outlined add">add</span>
   		</a>
	</div>
	</div>

		<c:if test="${!empty list }">
			<c:forEach items="${list}" var="plant">
			<div class="plant-item">
				<div class="date">
					<div class="next-date-title">물 줄 날짜</div>
					<div class="next-date">${plant.date}</div>
				</div>
				<!-- 
				<div class="circle">
					<img class="plant-profile" src="../images/monstera.jpg">
				</div>
				 -->
				<div class="circle" onclick="test(this, { id: ${plant.id}, name: '${plant.name}', period: ${plant.period}, date: '${plant.date}' })">
					<a href="javascript:void(0)">
						<span class="material-symbols-outlined">Potted_Plant</span>
					</a>
				</div>
				<div class="information">
					<div class="plant-name">${plant.name}</div>
					<div class="button-group">
						<!-- <button type="button">
	              		    <a href="upform?id=${plant.id}" style="color: black;">완료</a>
	              		</button>
	              		 -->
              		     <a href="upform?id=${plant.id}">
              		    	<span class="material-symbols-outlined edit">edit</span>
              		    </a>
              		
              			<a href="delete?id=${plant.id}">
              				<span class="material-symbols-outlined delete">delete</span>
              			</a>
					</div>
				</div>
			</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<div class="no-data">등록된 식물이 없습니다.</div>
		</c:if>
		
	    <div class="pagination-container">
	    	<div class="prev-button">
	    		<span class="material-symbols-outlined">chevron_left</span>
	    	</div>
	    	<div class="number-button-wrapper">
	    	
	    	</div>
	    	<div class="next-button">
	    		<span class="material-symbols-outlined">chevron_right</span>
	    	</div>
	    </div>

    </div>
    <script>
    	
    	function test(target, plant) {
    		fetch("/plant/date?id="+plant.id)
    			.then(res => res.text())
    			.then(data => {
    				data = data.slice(1, data.length-1);
    				target.previousElementSibling.querySelector(".next-date").textContent = data;
    				
    				alert("물을 주셨군요! 다음 물 줄 날짜는 "+data+" 입니다!");
    			});
    	}
    	
    	const COUNT_PER_PAGE = 4; // 한 페이지 당 최대 5개 요소
    	let plantItemEls = document.querySelectorAll('.plant-item');
    	//console.log(plantItemEls.length);
		
    	function getTotalPageCount() {
    		return Math.ceil(plantItemEls.length/COUNT_PER_PAGE)
    	}
    	
    	const numberButtonWrapper = document.querySelector('.number-button-wrapper');
    	
    	function setPageButtons() {
    		numberButtonWrapper.innerHTML = '';
    		
    		for (let i=1; i<=getTotalPageCount(); i++) {
    			numberButtonWrapper.innerHTML += '<span class="number-button">'+i+'</span>';
    		}
    	}
    	setPageButtons(1);
    	
    	function setPage(pageNumber) {
    		
    		let currentPage = pageNumber;
    		plantItemEls.forEach((item, idx) => {
    			item.style.display ='none';
    			if (idx >= COUNT_PER_PAGE  * (pageNumber-1) && idx < COUNT_PER_PAGE * pageNumber) {
    				item.style.display = 'flex';
    			}
    		})
    	}
		
    	function prevPage() {
    		if (currentPage > 1) {
    			setPage(currentPage-1);
    		}
    	}
    	
    	function nextPage() {
    		if (currentPage < getTotalPageCount()) {
    			setPage(currentPage+1);
    		}
    	}
    	const pageNumberButtons = document.querySelectorAll('.number-button');
    	pageNumberButtons.forEach((numberButton) => {
    		numberButton.addEventListener('click', (e) => {
    			setPage(e.target.innerHTML); // '<span class="number-button">'+i+'</span>'의 i를 넣어준다.
    		})
    	})
    	setPage(1);
    </script>
    
</body>
</html>