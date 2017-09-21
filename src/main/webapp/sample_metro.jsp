<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sample頁</title>

<style>
	#formTable tr td:first-child {
		width: 15%;
		text-align: right;
	}
</style>
</head>
<body>
	<!-- 分頁功能 -->
	<!-- data-open-target: 預設開啟哪一頁(認id) -->
	<div class="tabcontrol" data-role="tabcontrol" data-open-target="#frame_4">
		<!-- 頁籤 -->
		<ul class="tabs">
			<!-- class=active:正在顯示的頁籤 -->
			<!-- a:連結到哪一個id的頁籤 -->
			<li class=""><a href="#frame_1">第一頁</a></li>
			<li class=""><a href="#frame_2">第二頁</a></li>
			<li class=""><a href="#frame_3">第三頁</a></li>
			<li class=""><a href="#frame_4">第四頁</a></li>
		</ul>
		<div class="frames">
			<div class="frame bg-white" id="frame_1">
				<h4>表格(table)</h4>
				<p class='fg-red'>注意：使用javascript切換頁籤時，所有資料必須先初始化好</p>
				<table class="table striped hovered border bordered">
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
			<div class="frame bg-white" id="frame_2" >
				<h4>網格(flex-grid)</h4>
				<p>多用於RWD排版，一行(row)滿版以12格計(cell)</p>
				<div class="flex-grid">
					<!-- 第一行 -->
					<!-- style是方便看效果，使用時拿掉 -->
					<div class="row" style="margin: 2px;">
						<div class="cell" style="border:1px solid red">cell(1格)</div>
						<div class="cell">cell(1格)</div>
						<div class="cell colspan2" style="border:1px solid red">colspan2(2格)</div>
						<div class="cell">cell(1格)</div>
						<div class="cell">cell(1格)</div>
						<div class="cell colspan6" style="border:1px solid red">colspan6(6格)</div>
					</div>
					<div class="row"  style="margin: 2px;">
						<div class="cell colspan4" style="border:1px solid red">colspan4(4格)</div>
						<div class="cell colspan8" style="border:1px solid red">colspan8(8格)</div>
					</div>
					<div class="row"  style="margin: 2px;">
						<div class="cell colspan12" style="border:1px solid red">colspan12(12格)</div>
					</div>
					
					<div class="row flex-just-center"  style="margin: 2px;">
						<div class="cell colspan8" style="border:1px solid red">colspan8(8格)+置中對齊(flex-just-center)</div>
					</div>
					
					<div class="row flex-just-start"  style="margin: 2px;">
						<div class="cell colspan8" style="border:1px solid red">colspan8(8格)+靠左對齊(flex-just-start)</div>
					</div>
					
					<div class="row flex-just-end"  style="margin: 2px;">
						<div class="cell colspan8" style="border:1px solid red">colspan8(8格)+靠右對齊(flex-just-end)</div>
					</div>
					
					<div class="row flex-just-sa"  style="margin: 2px;">
						<div class="cell colspan2" style="border:1px solid red">colspan2(2格)<br>分散對齊(flex-just-sa)<br>(頭尾空白)</div>
						<div class="cell colspan2" style="border:1px solid red">colspan2(2格)<br>分散對齊(flex-just-sa)</div>
						<div class="cell colspan2" style="border:1px solid red">colspan2(2格)<br>分散對齊(flex-just-sa)</div>
					</div>
					<div class="row flex-just-sb"  style="margin: 2px;">
						<div class="cell colspan2" style="border:1px solid red">colspan2(2格)<br>分散對齊(flex-just-sb)<br>(中間空白)</div>
						<div class="cell colspan2" style="border:1px solid red">colspan2(2格)<br>分散對齊(flex-just-sb)</div>
						<div class="cell colspan2" style="border:1px solid red">colspan2(2格)<br>分散對齊(flex-just-sb)</div>
					</div>
				</div>
			</div>
			<div class="frame bg-white" id="frame_3">
				<h5>表單元件(Form) 1</h5>
				<form>
<!-- 				<div class="grid"> -->
<!-- 						<div class="row">						 -->
<!-- 							<label class="cell colsapn2" for="input1">文字輸入:</label> -->
<!-- 							<div class="input-control text cell colspan4"> -->
<!--     							<input type="text" id="input1" name="input1" placeholder="請輸入"/> -->
<!-- 							</div> -->
<!-- 						</div>		 -->
<!-- 						<div class="row">						 -->
<!-- 							<label class="input-control checkbox"> -->
<!--     							<input type="checkbox" checked> -->
<!--     						<span class="check"></span> -->
<!--     						<span class="caption">Checkbox</span> -->
<!-- 							</label> -->
<!-- 						</div> -->
<!-- 				</div> -->
				<table class="table border bordered" id="formTable">
					<tbody>
						<tr>
							<td><label for="input1">單行文字輸入:</label></td>
							<td>
								<div class="input-control text">
    								<input id="input1" type="text" name="input1"/>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="input1">複選:</label></td>
							<td>
								<label class="input-control checkbox">
    								<input type="checkbox" name="input2" value="checkBox1"/>
    								<span class="check"></span>
    								<span class="cation">CheckBox1</span>
								</label>
								<label class="input-control checkbox">
    								<input type="checkbox" name="input2" value="checkBox2"/>
    								<span class="check"></span>
    								<span class="cation">CheckBox2</span>
								</label>
								<label class="input-control checkbox">
    								<input type="checkbox" name="input2" value="checkBox3"/>
    								<span class="check"></span>
    								<span class="cation">CheckBox3</span>
								</label>
							</td>
						</tr>
						<tr>
							<td><label for="input1">單選:</label></td>
							<td>
								<label class="input-control radio">
    								<input type="radio" name="input3" value="radio1">
    								<span class="check"></span>
    								<span class="caption">Radio1</span>
								</label>
								<label class="input-control radio">
    								<input type="radio" name="input3" value="radio2">
    								<span class="check"></span>
    								<span class="caption">Radio2</span>
								</label>
								<label class="input-control radio">
    								<input type="radio" name="input3" value="radio3">
    								<span class="check"></span>
    								<span class="caption">Radio3</span>
								</label>
							</td>
						</tr>
						<tr>
							<td><label for="input1">開關:</label></td>
							<td>
								<!-- Modern switch -->
								<label class="switch">
								    <input type="checkbox" name="input4">
								    <span class="check"></span>
								    <span class="caption">開關1號</span>
								</label>
								<!-- Original switch -->
								<label class="switch-original">
								    <input type="checkbox" name="input5">
								    <span class="check"></span>
								    <span class="caption">開關2號</span>
								</label>
							</td>
						</tr>
						<tr>
							<td><label for="input1">多行文字輸入:</label></td>
							<td>
								<div class="input-control textarea">
								    <textarea>預設輸入</textarea>
								</div>
								<div class="input-control textarea" data-role="input" data-text-auto-resize="true">
								    <textarea>自動調整高度</textarea>
								</div>
								<div class="input-control textarea" data-role="input" data-text-auto-resize="true" data-text-max-height="200">
								    <textarea>自動調整高度，最大高度200</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="input1">下拉選單:</label></td>
							<td>
								<div class="input-control select">
								    <select>
								        <option>1</option>
								        <option>2</option>
								        <option>3</option>
								    </select>
								</div>
								<div class="input-control select">
								    <select multiple>
								        <option>1</option>
								        <option>2</option>
								        <option>3</option>
								    </select>
								</div>
							</td>
						</tr>
						
						<tr>
							<td><label for="input1">按鈕:</label></td>
							<td>
								<button class="button">普通button</button>
								<span class="button">span tag</span>
								<a class="button">a tag</a>
								<button class="button rounded">圓角button</button>
								<button class="button cycle-button">圓形</button>
								<button class="button square-button">方形</button>
								<button class="button"><span class="mif-checkmark"></span>有icon</button>
							</td>
						</tr>
					</tbody>
				</table>
				</form>	
			</div>
			<div class="frame bg-white" id="frame_4">
				<h5>表單元件(Form) 2</h5>
				<form>
				<table class="table border bordered" id="formTable">
					<tbody>
						<tr>
							<td><label for="input1">檔案上傳</label></td>
							<td>
								<div class="input-control file" data-role="input">
								    <input type="file">
								    <button class="button"><span class="mif-folder"></span></button>
								</div>
							</td>
						</tr>
						<tr>
							<td><label for="input1">日期元件(datepicker)</label></td>
							<td>
							    <div class="input-control text" data-role="datepicker" data-format="yyyy-mm-dd">
<!-- 							    <div class="input-control text" id="datepicker" data-format="yyyy-mm-dd"> -->
        							<input type="text">
        							<button class="button"><span class="mif-calendar"></span></button>
    							</div>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
	<script>
 	  $( function() {
 		    $( "#datepicker" ).datepicker();
 	  } );
	</script>
</body>
</html>