<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 因為用了sitemesh的關係，header會跟base.jsp一樣 -->
<!-- 其他頁面只需要指定title和引入該頁面才使用的css和js -->
<title>Sample頁</title>
<link href="${pageContext.request.contextPath}/theme/bootstrap/css/bootstrap-switch.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/theme/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script	src="${pageContext.request.contextPath}/theme/bootstrap/js/bootstrap-switch.min.js"></script>
<script	src="${pageContext.request.contextPath}/theme/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script	src="${pageContext.request.contextPath}/theme/bootstrap/js/bootstrap-datetimepicker.zh-TW.js"></script>
<style>
	#formTable tr td:first-child {
		width: 10%;
		text-align: right;
	}
	#frame_4 .row div:first-child{
		text-align:right;
		/*border: 1px solid red;*/
	}
</style>
</head>
<body>
	<h3><button type='button' id='testButton'>測試功能</button></h3>
	<!-- 分頁功能 -->
	<!-- 頁籤 -->
	<ul class="nav nav-tabs">
		<!-- class=active:正在顯示的頁籤 -->
		<!-- a:連結到哪一個id的頁籤 -->
		<li class=""><a data-toggle='tab' href="#frame_1">第一頁</a></li>
		<li class=""><a data-toggle='tab' href="#frame_2">第二頁</a></li>
		<li class=""><a data-toggle='tab' href="#frame_3">第三頁</a></li>
		<li class="active"><a data-toggle='tab' href="#frame_4">第四頁</a></li>
	</ul>
	<div class="tab-content">
		<!-- 預設顯示的頁籤class要加上 in active，點選後bootstrap會自動切換 -->
		<div class="tab-pane fade in active" id="frame_1">
			<h4>表格(table)</h4>
			<p class='fg-red'>注意：使用javascript切換頁籤時，所有資料必須先初始化好</p>
<!-- 			<table class="table table-striped table-hover table-bordered"> -->
			<table class="table table-hover">
				<!-- 表頭 -->
				<thead>
					<tr>
						<th>Header 1</th>
						<th>Header 2</th>
						<th>Header 3</th>
						<th>Header 4</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>cell 1-1</td>
						<td>cell 2-1</td>
						<td>cell 3-1</td>
						<td>cell 4-1</td>
					</tr>
					<tr>
						<td>cell 1-2</td>
						<td>cell 2-2</td>
						<td>cell 3-2</td>
						<td>cell 4-2</td>
					</tr>
					<tr>
						<td>cell 1-3</td>
						<td>cell 2-3</td>
						<td>cell 3-3</td>
						<td>cell 4-3</td>
					</tr>
					<tr>
						<td>cell 1-4</td>
						<td>cell 2-4</td>
						<td>cell 3-4</td>
						<td>cell 4-4</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="tab-pane fade" id="frame_2" >
			<h4>網格(grid)</h4>
			<p>多用於RWD排版，一行(row)滿版以12格計(col-md-12)</p>
			<!-- 指定小裝置上的格數用xs ex.col-xs-12:在小裝置上時用12格 -->
			<!-- 
   				Mobile – xs ( < 768px )
    			Tablet – sm ( 768~991px )
    			Desktop – md ( 992~1200px )
    			Large Desktop - lg ( >= 1200px )
			 -->
			<!-- contain:固定寬度, contain-fluid:滿版 -->
			<div class="contain">
				<!-- 第一行 -->
				<!-- style是方便看效果，使用時拿掉 -->
				<div class="row" style="margin: 2px;">
					<div class="col-md-2 col-xs-6" style="border:1px solid red">col-md-2(2格)</div>
					<div class="col-md-2 col-xs-6">col-md-2(2格)</div>
					<div class="col-md-4 col-xs-12" style="border:1px solid red">col-md-4(4格) col-xs-12(在小裝置上12格)</div>
					<div class="col-md-1 col-xs-6">col-md-1</div>
					<div class="col-md-1 col-xs-6" style="border:1px solid red">md-1(1格)</div>
				</div>
				<br>
				<div class="row"  style="margin: 2px;">
					<div class="col-md-4" style="border:1px solid red">col-md-4(4格)</div>
					<div class="col-md-8" style="border:1px solid red">col-md-8(8格)</div>
				</div>
				<br>
				<div class="row"  style="margin: 2px;">
					<div class="col-md-12" style="border:1px solid red">col-md-12(12格)</div>
				</div>
				<br>
				<div class="row"  style="margin: 2px;">
					<div class="col-md-8 col-md-offset-4" style="border:1px solid red">col-md-8(8格)+右移4格(col-md-offset-4)</div>
				</div>
				<br>
				<div class="row"  style="margin: 2px;">
					<div class="col-md-4" style="border:1px solid red">col-md-4(4格)</div>
					<div class="col-md-2 col-md-offset-4" style="border:1px solid red">col-md-4(4格)+offset4格</div>
				</div>
				<br>
				<div class="row" style="margin:2px;">
  					<div class="col-xs-12 col-sm-6 col-md-8" style="border:1px solid red">.col-xs-12 .col-sm-6 .col-md-8</div>
  					<div class="col-xs-6 col-md-4" style="border:1px solid red">.col-xs-6 .col-md-4</div>
				</div>
				<br>
				<!-- 清除排版，當版面亂掉的時候使用 -->
				<!-- <div class="clearfix visible-xs-block"></div> -->
				<div class="row" style="margin:2px;">
  					<div class="col-xs-12 col-sm-6 col-md-8" style="border:1px solid red">.col-xs-12 .col-sm-6 .col-md-8</div>
  					<div class="col-xs-6 col-md-4" style="border:1px solid red">.col-xs-6 .col-md-4</div>
				</div>
				<br>
				<div class="row">
  					<div class="col-xs-6">
						<p class="bg-primary">文字背景色</p>
						<p class="bg-success">文字背景色</p>
						<p class="bg-info">文字背景色</p>
						<p class="bg-warning">文字背景色</p>
						<p class="bg-danger">文字背景色</p>
  					</div>
  					<div class="col-xs-6">
  						<p class="text-muted">文字顏色</p>
						<p class="text-primary">文字顏色</p>
						<p class="text-success">文字顏色</p>
						<p class="text-info">文字顏色</p>
						<p class="text-warning">文字顏色</p>
						<p class="text-danger">文字顏色</p>
  					</div>
				</div>
				
			</div>
		</div>
		<div class="tab-pane fade" id="frame_3">
			<h4>表單元件(Form) 1</h4>
			<form>
			<table class="table" id="formTable">
				<tbody>
					<tr>
						<td><label for="input1">單行文字輸入:</label></td>
						<td>
							<div class='row'>
							<div class='col-xs-12 col-md-8'>
  								<input id="input1" class='form-control' type="text" name="input1"/>
  							</div>
  							</div>
						</td>
					</tr>
					<tr>
						<td><label>複選:</label></td>
						<td>
							<label class="checkbox-inline">
  								<input type="checkbox" id="inlineCheckbox1" value="A" name="formInput2"> 複選A
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" id="inlineCheckbox2" value="B" name="formInput2"> 複選B
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" id="inlineCheckbox3" value="C" name="formInput2"> 複選C
							</label>
<!-- 							<div class='checkbox'> -->
<!-- 								<label> -->
<!-- 	      							<input type="checkbox" name='formInput2' value='A'/> 複選A -->
<!-- 	    						</label> -->
<!-- 	    						<label> -->
<!-- 	      							<input type="checkbox" name='formInput2' value='B'/> 複選B -->
<!-- 	    						</label> -->
<!-- 	    						<label> -->
<!-- 	      							<input type="checkbox" name='formInput2' value='C'/> 複選C -->
<!-- 	    						</label> -->
<!--     						</div> -->
						</td>
					</tr>
					<tr>
						<td><label>單選:</label></td>
						<td>
							<label class="radio-inline">
								<input type="radio" name="formInput3" id="inlineRadio1" value="A" > 單選A
							</label>
							<label class="radio-inline">
								<input type="radio" name="formInput3" id="inlineRadio2" value="B"> 單選A
							</label>
							<label class="radio-inline">
								<input type="radio" name="formInput3" id="inlineRadio3" value="C"> 單選A
							</label>
						</td>
					</tr>
					<tr>
						<!-- 開關需引入bootstrap-switch的css和js，並使用jquery初始化 -->
						<!-- 預設是true,需指定checked='false'才為false -->
						<td><label>開關:</label></td>
						<td>
						    <input id='switch' type="checkbox" name="formInput4" data-size='small' checked='false'>
						</td>
					</tr>
					<tr>
						<!-- row: 預設顯示幾行 -->
						<td><label for="input1">多行文字輸入:</label></td>
						<td>
							<div class='row'>
							<div class='col-xs-12 col-md-8'>
								<textarea class="form-control" rows="3"></textarea>
							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td><label for="input1">下拉選單:</label></td>
						<td>
							<div class='row'>
							<div class='col-xs-12 col-md-8'>
								<select class="form-control">
	  								<option>選項1</option>
	  								<option>選項2</option>
	  								<option>選項3</option>
	  								<option>選項4</option>
	  								<option>選項5</option>
								</select>
							</div>
							</div>
						</td>
					</tr>
					
					<tr>
						<td><label>按鈕:</label></td>
						<td>
							<p>
							<button class="btn btn-default">普通button</button>
							<span class="btn btn-default">span tag</span>
							<!-- 當a純粹當做button使用，最好加上role='button' -->
							<a class="btn btn-default" role='button'>a tag</a>
							<input class="btn btn-default" type='button' value='input button' />
							</p>
							<p>
							<button type="button" class="btn btn-primary">btn-primary</button>
							<button type="button" class="btn btn-success">success</button>
							<button type="button" class="btn btn-info">info</button>
							<button type="button" class="btn btn-warning">warning</button>
							<button type="button" class="btn btn-danger">danger</button>
							<button type="button" class="btn btn-link">Link</button>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
			</form>	
		</div>
		<div class="tab-pane fade in active" id="frame_4">
			<h4>表單元件(Form) 2</h4>
			<form>
				<div class="contain">
					<div class='row'>
						<div class='col-xs-1'>
							<label for="exampleInputFile">檔案上傳</label>
						</div>
						<div class='col-xs-10 col-md-6'>
   							<input type="file" id="exampleInputFile">
   							<p class="help-block">說明文字</p>
						</div>
					</div>
					
					<div class='row'>
						<!-- 日期選單需引入bootstrap-datetimepicker的css和js，並使用jquery初始化 -->
						<!-- 其他語系需額外引入bootstrap-datetimepicker.zh-TW.js -->
						<div class='col-xs-1'>
							<label for="input1">日期選單</label>
						</div>
						<div class='col-xs-10 col-md-6'>
							<div class="input-group">
  								<span class="input-group-addon" id="sizing-addon2"><i class="fa fa-calendar" aria-hidden="true"></i></span>
  								<input type="date" class="form-control" id="datetimepicker" aria-describedby="sizing-addon2" placeholder='yyyy-mm-dd' value=''>
							</div>
						</div>
					</div>
					<br>
					<div class='row'>
						<!-- 需根據input寫javascript -->
						<!-- 使用moment.js套件處理時間 -->
						<div class='col-xs-1'>
							<label for="input1">起迄日</label>
						</div>
						<div class='col-xs-5 col-md-3'>
							<div class="input-group">
  								<span class="input-group-addon" id="sizing-addon2"><i class="fa fa-calendar" aria-hidden="true"></i></span>
  								<input type="date" class="form-control" id="from" aria-describedby="sizing-addon2" placeholder='yyyy-mm-dd' value=''>
							</div>
						</div>
						<div class='col-xs-5 col-md-3'>
							<div class="input-group">
  								<span class="input-group-addon" id="sizing-addon2"><i class="fa fa-calendar" aria-hidden="true"></i></span>
  								<input type="date" class="form-control" id="to" aria-describedby="sizing-addon2" placeholder='yyyy-mm-dd' value=''>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
	$( function(){
		$('#testButton').click(function(){
			//alert(formatDate(new Date('2017-07-01')));
			//alert(getToday(new Date('2017-07-01')));
			alert(moment().format('YYYY-MM-DD'));
		});
		
		$("[name='formInput4']").bootstrapSwitch();
		
		var dateTimePickerOption = {
		    format: 'yyyy-mm-dd', //格式
		    autoclose: true, //選取後自動關閉
		    minView:'month', //最小顯示頁面
		    todayHighlight:true, //標示今天
		    todayBtn:true,//顯示today按鈕
		    language:'zh-TW' //中文化				
		};
		$('#datetimepicker').datetimepicker(dateTimePickerOption);
		$('#datetimepicker').val(moment().format('YYYY-MM-DD'));
		$('#from').val(moment().format('YYYY-MM-DD'));
		$('#to').val(moment().format('YYYY-MM-DD'));
		
		//限制日期區間
        //$("#from")、#to 為元件id，其餘照抄
        var from = $("#from").datetimepicker(dateTimePickerOption).on("changeDate", function(ev) {
			//to.datetimepicker('setStartDate', formatDate(ev.date));
        	to.datetimepicker('setStartDate', moment(ev.date).format('YYYY-MM-DD'));
        });
        var to = $("#to").datetimepicker(dateTimePickerOption).on("changeDate", function(ev) {
            from.datetimepicker('setEndDate', moment(ev.date).format('YYYY-MM-DD'));
        });

	});
	</script>
</body>
</html>