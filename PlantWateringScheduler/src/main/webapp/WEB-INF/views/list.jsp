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
<link rel="stylesheet" href="../css/style.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

 <style type="text/css">
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
		border-radius: 30px;
		transition: 0.5s;
		overflow: hidden;
	}
	.search:hover {
		cursor: pointer;
	}
	.search.active {
		width: 360px;
		border: 1px solid #75b064;
		background: #fff;
	}
	.search.active .clear {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.search.active .search-icon {
		position: absolute;
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
		color: #75b064;
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
	   	justify-content: center;
		align-items: center;
	 }
	.add:hover {
	   	color: #598c4a;
	}
	.add a {
	   	cursor: pointer;
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
	   	color: #75b064;
	   	margin-top: 5px;
	}
	.circle {
	   	width: 100px;
	   	height: 100px;
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
	   	margin-bottom: 30px;
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
    	const icon = document.querySelector('.search-icon');
		const search = document.querySelector('.search');
		const clear = document.querySelector('.clear');
		
		
		// 영역 밖 클릭 시 active 제거
		document.addEventListener('click', function(event) {
            if (!search.contains(event.target) && event.target !== icon) {
                search.classList.remove('active');
            }
        });
    	// 검색어가 비어있을 때 원래 리스트 보여주기
    	function filterPlants() {
            const searchTerm = searchInput.value.toLowerCase();
            plantItemEls.forEach((item) => {
                const plantName = item.querySelector('.plant-name').textContent.toLowerCase();
                if (plantName.includes(searchTerm) || searchTerm === '') {
                    item.style.display = 'flex';
                } else {
                    item.style.display = 'none';
                }
            });
            setPage(1); // 검색 결과가 필터링된 후 페이지를 1로 설정
            setPageButtons();
        }
    	
    	icon.onclick = function() {
			event.stopPropagation();
			search.classList.add('active'); // search 아이콘 클릭 시 input창 보이도록 유지
			filterPlants();
    	}
		clear.addEventListener('click', function() {
			document.getElementById('search-input').value='';
			filterPlants();
		})
    	
    	// 검색어 입력 후 엔터 키 입력 시 필터링 된 리스트 보여주기
    	searchInput.addEventListener('keypress', function(){
    		if (event.key === 'Enter') {
                filterPlants();
            }
    	})
    	
    	const COUNT_PER_PAGE = 3; // 한 페이지 당 최대 3개 요소
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
    	
    	let currentPage;
    	function setPage(pageNumber) {
    		
    		currentPage = Number(pageNumber);
    		let visibleCount = 0;
            let start = COUNT_PER_PAGE * (pageNumber - 1);
            let end = start + COUNT_PER_PAGE;
            plantItemEls.forEach((item, idx) => {
                if (item.style.display !== 'none') {
                    if (visibleCount >= start && visibleCount < end) {
                        item.style.display = 'flex';
                    } else {
                        item.style.display = 'none';
                    }
                    visibleCount++;
                }
            });
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
    	setPageButtons();
    	setPage(1); // 페이지 1로 세팅
    </script>
    
</body>
</html>