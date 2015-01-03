<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>

<script>

$(document).ready(function() {
	$( "#start_date_input" ).datepicker({
		dateFormat: 'dd/mm/yy'
	   });
	
	$( "#end_date_input" ).datepicker({
		dateFormat: 'dd/mm/yy'
	   });
	
	$( "#start_date_profit_by_date" ).datepicker({
		dateFormat: 'dd/mm/yy'
	   });
	
	$( "#end_date_profit_by_date" ).datepicker({
		dateFormat: 'dd/mm/yy'
	   });
	
	$('.export_sell_quantity').live('click', function(e) {
		document.getElementById("form_date_input").reset();
		$("#dateInput").reveal();
	});
	
	$('.export_report_button').live('click', function(e) {
		$("#dateInput").trigger('reveal:close');
		var start_date = document.getElementById("start_date_input").value;
		var end_date = document.getElementById("end_date_input").value;
		var url = "http://localhost:8080/pentaho/api/repos/%3Aonlinestore%3ASoLuongSanPhamBanRa.prpt/viewer?"
			+ "start_date=" + start_date 
			+ "&end_date=" + end_date
			+ "&output-type=html";
		window.open(url, '_blank');
		window.focus();
	});
	
	$('.export_stock_report').live('click', function(e) {
		if (confirm("Xuất báo cáo kho hàng?") == true) {
			var url = "http://localhost:8080/pentaho/api/repos/%3Aonlinestore%3AThongKeKhoHang.prpt/viewer";
			window.open(url, '_blank');
			window.focus();
		}
	});
	
	$('.export_profit_in_year').live('click', function(e) {
		document.getElementById("form_in_year_input").reset();
		$("#inYearInput").reveal();
	});
	
	$('.export_profit_in_year_button').live('click', function(e) {
		$("#inYearInput").trigger('reveal:close');
		var year = document.getElementById("in_year_input").value;
		var url = "http://localhost:8080/pentaho/api/repos/%3Aonlinestore%3AThongKeDoanhThuTrongNam.prpt/viewer?"
			+ "year=" + year +"&output-type=html";
		window.open(url, '_blank');
		window.focus();
	});
	
	$('.export_profit_by_date').live('click', function(e) {
		document.getElementById("form_profit_by_date_input").reset();
		$("#profitByDateInput").reveal();
	});
	
	$('.export_profit_by_date_button').live('click', function(e) {
		$("#profitByDateInput").trigger('reveal:close');
		var start_date = document.getElementById("start_date_profit_by_date").value;
		var end_date = document.getElementById("end_date_profit_by_date").value;
		var url = "http://localhost:8080/pentaho/api/repos/%3Aonlinestore%3AThongKeDoanhThuTheoNgay.prpt/viewer?"
			+ "start_date=" + start_date 
			+ "&end_date=" + end_date
			+ "&output-type=html";
		window.open(url, '_blank');
		window.focus();
	});
	
});

function exportStockReportOnclick() {
	
}
</script>

<span class="ctgh_p">Báo cáo</span>

<div class="report_dashboard">
	<table>
		<tr>
			<th align="left">Số lượng sản phẩm đã bán</th>
			<td><a class="export_sell_quantity" href="#">Xuất</a></td>
		</tr>
		<tr>
			<th align="left">Thống kê tình trạng kho hàng</th>
			<td><a class="export_stock_report" href="#">Xuất</a></td>
		</tr>
		<tr>
			<th align="left">Thống kê doanh thu trong năm</th>
			<td><a class="export_profit_in_year" href="#">Xuất</a></td>
		</tr>
		<tr>
			<th align="left">Thống kê doanh thu theo ngày</th>
			<td><a class="export_profit_by_date" href="#">Xuất</a></td>
		</tr>
	</table>
</div>

<div id="dateInput" class="reveal-editrecordmodalwindow">
	<h4>Chọn khoảng thời gian</h4>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form id="form_date_input" class="form_date_input"
			method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class="date_input_item">
					<span>Từ ngày</span>
					<input id="start_date_input" class="start_date_input" 
					type="text" name="start_date_input" readonly>
				</div>
				<div class="date_input_item">
					<span>Đến ngày</span>
					<input id="end_date_input" class="end_date_input" 
					type="text" name="end_date_input" readonly>
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton export_report_button"
					type="button" value="Xuất" /> <input
					class="formButton cancel  close-reveal-all" type="button"
					value="Thoát" />
			</div>
		</form>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>

<div id="inYearInput" class="reveal-editrecordmodalwindow">
	<div class="in-progress"></div>
		<form id="form_in_year_input" class="form_in_year_input"
			method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class="date_input_item">
					<span>Năm</span>
					<input id="in_year_input" class="in_year_input" 
					type="text" name="in_year_input">
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton export_profit_in_year_button"
					type="button" value="Xuất" /> <input
					class="formButton cancel  close-reveal-all" type="button"
					value="Thoát" />
			</div>
		</form>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>

<div id="profitByDateInput" class="reveal-editrecordmodalwindow">
	<h4>Chọn khoảng thời gian</h4>
	<div class="in-progress"></div>
	<div class="modalAddCategoryCentreContent">
		<div class="modalMess"></div>
		<form id="form_profit_by_date_input" class="form_profit_by_date_input"
			method="post">
			<div class="in-progress"></div>
			<div class="modalContent">
				<div class="date_input_item">
					<span>Từ ngày</span>
					<input id="start_date_profit_by_date" class="start_date_profit_by_date" 
					type="text" name="start_date_profit_by_date" readonly>
				</div>
				<div class="date_input_item">
					<span>Đến ngày</span>
					<input id="end_date_profit_by_date" class="end_date_profit_by_date" 
					type="text" name="end_date_profit_by_date" readonly>
				</div>
			</div>
			<div class="groupFormButton">
				<input class="formButton export_profit_by_date_button"
					type="button" value="Xuất" /> <input
					class="formButton cancel  close-reveal-all" type="button"
					value="Thoát" />
			</div>
		</form>
	</div>
	<a class="close-reveal-modal close-reveal-all"></a>
</div>