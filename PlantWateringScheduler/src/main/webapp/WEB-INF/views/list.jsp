<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 <style type="text/css">
 	body {
 		font-family: "Noto Sans KR", sans-serif;
 	}	
	.title {
		position: relative;
		align-items: center;
	}
	.header-icon {
		display: flex;
		gap: 10px;
		justify-content: right;
		margin-right: 50px;
	}
	.search {
		position: relative;
		width: 30px;
		height: 30px;
		background: #75b064;
		border-radius: 30px;
		transition: 0.5s;
		overflow: hidden;
		border: 1px solid #75b064;
	}
	.search:hover {
		background: #598c4a;
		cursor: pointer;
	}
	.search.active {
		width: 360px;
		background: #fff;
	}
	.search.active .clear {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.search.active .search-icon {
		position: absolute;
		background: #fff;
		color: #75b064;
	}
	.search-icon {
		position: absolute;
		top: 0;
		left: 0;
		width: 30px;
		height: 30px;
		display: flex;
		justify-content: center;
		align-items: center;
		color: #fff;
	}
	.search .input {
		position: relative;
		width: 360px;
		height: 30px;
		left: 32px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.search .input input {
		position: absolute;
		top: 0;
		width: 100%;
		height: 100%;
		border: none;
		outline: none;
	}
	.clear {
		position: absolute;
		top: 50%;
		transform: translateY(-50%);
		width: 15px;
		height: 15px;
		right: 15px;
		cursor: pointer;
		display: none;
		color: #75b064;
	}
	.add {
		width: 30px;
	   	height: 30px;
	   	display: flex;
	   	color: #75b064;
	   	}
	.add:hover {
	   	color: #598c4a;
	}
	.add a {
	   	cursor: pointer;
	}
	h2 {
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
	   	align-items: center;
	}
	.next-date-title {
	   	margin-top: 15px;
	}
	.next-date {
	   	color: green;
	   	margin-top: 5px;
	}
	.circle {
	   	width: 80px;
	   	height: 80px;
	   	border-radius: 50%;
	   	display: flex;
	   	background: #75b064;
	   	justify-content: center;
	   	align-items: center;
	   	position: relative;
	}
	.circle img {
	   	width: 100%;
	   	height: 100%;
	   	object-fit: cover;
	   	border-radius: 50%;
	}
	.watering {
	   	position: absolute;
	   	bottom: -10px;
	   	right: -10px;
	   	width: 40px;
	   	height: 40px;
	   	border-radius: 50%;
	   	background: #75b064;
	   	color: white;
	   	display: flex;
	   	justify-content: center;
	   	align-items: center;
	}
	.watering:hover {
	   	cursor: pointer;
	   	background: #598c4a;
	}
	.watering span {
	   	color: white;
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
	   	margin-top: 15px;
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
	.psychiatry {
		color: #fff;
	}
	.modal {
		width: 500px;
		border-radius: 14px;
	}
  </style>
</head>
<body>
<div class="container">
	<div class="title">
		<h2 class="p-3">내 식물</h2>
		<div class="header-icon">
			<div class="search">
				<span class="material-symbols-outlined search-icon">
					search
				</span>
				<div class="input">
					<input type="text" name="name" id="search-input" placeholder="식물 이름을 입력하세요."/>
				</div>
				<span class="material-symbols-outlined clear">
					close
				</span>
			</div>
			<div class="add">
				<a href="form">
		   			<span class="material-symbols-outlined add">add</span>
		   		</a>
			</div>
		</div>
	</div>
	<script>
		const icon = document.querySelector('.search-icon');
		const search = document.querySelector('.search');
		icon.onclick = function() {
			search.classList.toggle('active');
		}
		const clear = document.querySelector('.clear');
		clear.addEventListener('click', function() {
			document.getElementById('search-input').value='';
		})
	</script>

		<c:if test="${!empty list }">
			<c:forEach items="${list}" var="plant">
			<div class="plant-item">
				<div class="date">
					<div class="next-date-title">물 줄 날짜</div>
					<div class="next-date">${plant.date}</div>
				</div>
				<div class="circle">
					<c:if test="${not empty plant.file}">
						<img class="plant-profile" src="${plant.file}">
					</c:if>
					<c:if test="${empty plant.file}">
						<span class="material-symbols-outlined psychiatry">
							psychiatry
						</span>
					</c:if>
					<div class="watering" onclick="updateDate(this, { id: ${plant.id}, name: '${plant.name}', period: ${plant.period}, date: '${plant.date}' })">
						<a href="javascript:void(0)">
							<span class="material-symbols-outlined">Potted_Plant</span>
						</a>
					</div>
				</div>
				 
				<div class="information">
					<div class="plant-name">${plant.name}</div>
					<div class="button-group">
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
	    	<div class="prev-button" onClick="prevPage()">
	    		<span class="material-symbols-outlined">chevron_left</span>
	    	</div>
	    	<div class="number-button-wrapper">
	    	
	    	</div>
	    	<div class="next-button" onClick="nextPage()">
	    		<span class="material-symbols-outlined">chevron_right</span>
	    	</div>
	    </div>

    </div>
    <script>
    	function updateDate(target, plant) {
    		fetch("/plant/date?id="+plant.id)
    			.then(res => res.text())
    			.then(data => {
    				data = data.slice(1, data.length-1);
    				target.parentElement.previousElementSibling.querySelector(".next-date").textContent = data;
    				alert("물을 주셨군요! "+plant.name+"의 주기는 "+plant.period+"일이고\r다음 물 줄 날짜는 "+data+"입니다!");
    			});
    	}
    	
    	// 검색 필터링
    	const searchInput = document.getElementById('search-input');
    	
    	// 검색어가 비어있을 때 원래 리스트 보여주기
    	searchInput.addEventListener('input', function() {
    	    const searchTerm = this.value;
    	    plantItemEls.forEach((item) => {
    	        const plantName = item.querySelector('.plant-name').textContent;
    	        if (plantName.includes(searchTerm) || searchTerm === '') {
    	            item.style.display = 'flex';
    	        } else {
    	            item.style.display = 'none';
    	        }
    	    });
    	    setPageButtons();
    	    setPage(1);
    	});
    	
    	// 검색어 입력 후 엔터 키 입력 시 필터링 된 리스트 보여주기
    	searchInput.addEventListener('keypress', function(){
    		if (event.key == 'Enter') {
    			const searchItem = this.value;
        		plantItemEls.forEach((item) => {
        			const plantName = item.querySelector('.plant-name').textContent;
        			if (plantName.includes(searchItem)) {
        				item.style.display = 'flex';
        			} else {
        				item.style.display = 'none';
        			}
        		});
    		}
    	})
    	const COUNT_PER_PAGE = 4; // 한 페이지 당 최대 4개 요소
    	let plantItemEls = document.querySelectorAll('.plant-item');
		
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
    	
    	let currentPage;
    	function setPage(pageNumber) {
    		
    		currentPage = Number(pageNumber);
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
    	setPage(1); // 페이지 1로 세팅
    </script>
    
</body>
</html>