<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 因為用了sitemesh的關係，header會跟base.jsp一樣 -->
<!-- 其他頁面只需要指定title和引入該頁面才使用的css和js -->
<title>檔案上傳</title>
<link href="theme/bootstrap/css/bootstrap-switch.min.css" rel="stylesheet">
<link href="theme/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script	src="theme/bootstrap/js/bootstrap-switch.min.js"></script>
<script	src="theme/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script	src="theme/bootstrap/js/bootstrap-datetimepicker.zh-TW.js"></script>
<style>
	form {
		border-bottom : 1px solid gray;
	}
</style>
</head>
<body>
	<div class="contain">
		<form action='uploadFileExample' method='post' id='singleFile' enctype='multipart/form-data'>
			<div class='row'>
				<div class='col-xs-1'>
					<label for="uploadFile">檔案上傳</label>
				</div>
				<div class='col-xs-5 col-md-3'>
					<input type="file" id="uploadFile" name='uploadFile' />
					<p class="help-block">最大100MB</p>
				</div>
			</div>
			<div class='row'>
				<div class='col-xs-1'>
					<label for="uploadFileName">檔案名稱</label>
				</div>
				<div class='col-xs-5 col-md-3'>
					<input type="text" id="uploadFileName" name='uploadFileName' />
					<p class="help-block">檔案名稱</p>
				</div>
				<div class='col-xs-1'>
					<input class="btn btn-default" id='singleUpload' value='上傳' />
				</div>
			</div>
		</form>
		<form action='uploadMultipleFileExample' method='post'
			enctype='multipart/form-data'>
			<div class='row'>
				<div class='col-xs-1'>
					<label for="uploadFile1">檔案上傳</label>
				</div>
				<div class='col-xs-10 col-md-3'>
					<input type="file" id="uploadFile1" name='uploadFile'>
					<p class="help-block">檔案1</p>
				</div>
			</div>
			<div class='row'>
				<div class='col-xs-1'>
					<label for="uploadFileName1">檔案1名稱</label>
				</div>
				<div class='col-xs-5 col-md-3'>
					<input type="text" id="uploadFileName1" name='uploadFileName'>
					<p class="help-block">檔案1名稱</p>
				</div>
			</div>
			<div class='row'>
				<div class='col-xs-1'>
					<label for="uploadFile2">檔案上傳</label>
				</div>
				<div class='col-xs-10 col-md-6'>
					<input type="file" id="uploadFile2" name='uploadFile'>
					<p class="help-block">檔案2</p>
				</div>
			</div>
			<div class='row'>
				<div class='col-xs-1'>
					<label for="uploadFileName2">檔案2名稱</label>
				</div>
				<div class='col-xs-5 col-md-6'>
					<input type="text" id="uploadFileName2" name='uploadFileName'>
					<p class="help-block">檔案2名稱</p>
				</div>
				<div class='col-xs-1'>
					<input class="btn btn-default" type='submit' value='上傳' />
				</div>
			</div>
		</form>

		<div class='row'>
			<div class='col-xs-1'>
				<label for ='downloadPDF'>下載PDF</label>
			</div>
			<div>
  				<a href="downloadPDF">下載PDF</a>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$('#singleUpload').click(function(){
				var uploadForm = new FormData(document.querySelector('#singleFile'));		
				$.ajax({
					url:'uploadFileExample',
					type:'post',
					data: uploadForm,
					processData: false,
				    contentType: false
				}).done(function(data){
					alert(data.message);
					console.log(data);
				}).fail(function(jqXHR, textStatus){
					console.log(jqXHR);
					alert(textStatus);
				});
			});
		});
	</script>
</body>
</html>