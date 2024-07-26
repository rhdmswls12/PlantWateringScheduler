<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="ISO-8859-1">
    <title>Add ToDo Item</title>

    <link rel="stylesheet"
    	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
body {
	position: relative;
	width: 100vw;
	height: 100vh;
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
.img-area {
	position: relative;
	width: 50%;
	height: 200px;
	border: none;
	border-radius: 14px;
	background: lightGray;
	border-raidus: 14px;
	left: 50%;
	transform: translate(-50%);
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	cursor: pointer;
	color: white;
}
.img-area img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
	border-radius: 14px;
	z-index: 100;
}
span.material-symbols-outlined {
	font-size: 50px;
}
label {
	color: gray;
}
input {
	margin: 0 auto;
}
.btn-group {
	display: flex;
	width: 50%;
	margin: 0 auto;
	justify-content: space-around;
}
a {
	color: white;
}
a:hover {
	color: white;
	text-decoration: none;
}
.failure-message {
	font-size: 12px;
	color: #f7195c;
	margin: 5px;
}
.hide {
	display: none;
}
</style>
</head>
<body>
	<div class="container">

        <h3 class="p-3"> 나의 식물 등록 </h3>

        <form method="post" enctype="multipart/form-data">
 			<div class="img-area select-image"">
 				<input type="file" id="file" name="image" accept="image/*" hidden>
 				<span class="material-symbols-outlined">image</span>
 				<p>식물 사진</p>
 				<!-- <img src="../images/monstera.jpg"> -->
 			</div>
            <div class="row">
            	<div class="form-group col-md-12">
            		<label class="" for="name">이름</label>
            		<div class="">
            		    <input type="text" id="name" name="name"
            		        class="form-control input-sm" placeholder="이름" required/>
            		</div>
            	</div>
            </div>
            <script>
            	const selectImg = document.querySelector('.select-image');
            	const inputFile = document.querySelector('#file');
            	const imgArea = document.querySelector('.img-area');
            	
            	selectImg.addEventListener('click', function() {
            		inputFile.click();
            	})
            	
            	inputFile.addEventListener('change', function() {
            		const image = this.files[0];
            		console.log(image.name);
            		const reader = new FileReader();
            		reader.onload = () => {
            			const imgUrl = reader.result;
            			const img = document.createElement('img');
            			img.src = imgUrl;
            			imgArea.appendChild(img);
            		}
            		reader.readAsDataURL(image);
            	})
            	
            </script>

            <div class="row">
            	<div class="form-group col-md-12">
            		<label class="" for="period">주기</label>
            		<div class="">
            			<input type="text" id="date" name="period"
            				class="form-control input-sm" pattern="[0-9]+" placeholder="주기(숫자)" required/>
            		</div>
            		<div class="failure-message hide">숫자만 입력하세요.</div>
            	</div>
            </div>
            <script>
            	let inputDateEl = document.querySelector('#date');
            	let failureMessageEl = document.querySelector('.failure-message');
            	
            	function onlyNumber(str) {
            		const regex = /^[0-9]*$/;
            		return regex.test(str); // 숫자로만 이루어져 있는지 확인
            	}
            	inputDateEl.onkeyup = function() {
            		if (inputDateEl.value.length) {
            			if (onlyNumber(inputDateEl.value)) { // 숫자로만 이루어진 경우
            				failureMessageEl.classList.add("hide");
            			} else { 
            				failureMessageEl.classList.remove("hide");
            			}
            		}
            	}
            </script>
            
            <div class="row">
            	<div class="form-group col-md-12">
            		<label class="" for="date">마지막 물 준 날</label>
            		<div class="">
            			<input type="date" id="date" name="date"
            				class="form-control input-sm" required/>
            		</div>
            	</div>
            </div>

            <div class="btn-group">
            	<div class="">
            		<button type="submit" value="Register" class="btn btn-success">저장</button>
            	</div>
            	<div class="">
            		<button type="submit" value="Register" class="btn btn-success">
            			<a href="list">내 식물들</a>
            		</button>
            	</div>
            </div>	
        </form>
    </div>
    
</body>
</html>