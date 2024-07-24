<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c" %>
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
			width: 50px;
	    	height: 50px;
	    	position: absolute;
	    	top: 20px;
	    	right: 30px;
	    	border-radius: 50%;
	    	display: flex;
	    	justify-content: center;
	    	align-items: center;
	    	}
		.add:hover {
	    	cursor: pointer;
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
	    	font-weight: bold;
	    }
	    .next-date {
	    	color: green;
	    }
	    .circle {
	    	width: 50px;
	    	height: 50px;
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
	    	gap: 20px;
	    }
	    .plant-profile {
	    	width: 100%;
	    	height: 100%;
	    	object-fit: cover;
	    	
	    }
	    .plant-name {
	    	font-weight: bold;
	    }
	    .no-data {
	    	text-align: center;
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
	    a:hover {
	    	text-decoration: none;
	    }
    </style>
</head>
<body>
<div class="container">
	<div class="add">
		<a href="form">
   			<span class="material-symbols-outlined add">add</span>
   		</a>
	</div>
	<div class="title">
		<h3 class="p-3">내 식물</h3>
	</div>

		<c:if test="${!empty list }">
			<c:forEach items="${list}" var="plant">
			<div class="plant-item">
				<div class="date">
					<div class="next-date-title">다음 물 줄 날짜</div>
					<div class="next-date">${plant.date}</div>
				</div>
				<!-- 
				<div class="circle">
					<img class="plant-profile" src="../images/monstera.jpg">
				</div>
				 -->
				<div class="circle">
					<span class="material-symbols-outlined">Potted_Plant</span>
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

    </div>
</body>
</html>