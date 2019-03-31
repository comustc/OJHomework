function checkReturn(obj) {
	var objIds = obj.value;
	// 当没有选中某个子复选框时,checkboxall取消选中
	if (!$("#subcheck").checked) {
		$("#checkboxall").attr("checked", false);

	}
	// 获取subcheck的个数
	var chsub = $("input[type='checkbox'][id='subcheck']").length;
	// 获取选中的subcheck的个数
	var checkedsub = $("input[type='checkbox'][id='subcheck']:checked").length;
	if (checkedsub == chsub) {
		// 控制全选按钮的选中
		$("#checkboxall").prop("checked", true);
	}
}
function funcCheckAll() {
	// 判断全选按钮是否是已选中状态
	// $("#checkboxall").prop("checked")说明已选中
	// JQuery版本不同，if条件不同
	if ($("#checkboxall").prop("checked")) {
		// 将各个子单选按钮设为选中状态
		$('input[name=ids]').prop("checked", true);
	} else { // 此时全选按钮起到反选作用
		// 将选中状态改为非选中
		$('input[name=ids]').prop("checked", false);
	}
}
function delAllclass() {
	var checkDelete = document.getElementsByName("ids");
	for (var i = 0; i < checkDelete.length; i++) {
		// 判断全选按钮是否是已选中状态
		if (checkDelete[i].type == "checkbox" && checkDelete[i].checked) {
			sendDeleteRequest(checkDelete[i].value);
		}
	}
}
function delAllgrade() {
	var checkDelete = document.getElementsByName("ids");
	for (var i = 0; i < checkDelete.length; i++) {
		// 判断全选按钮是否是已选中状态
		if (checkDelete[i].type == "checkbox" && checkDelete[i].checked) {
			sendDeleteRequest(checkDelete[i].value);
		}
	}
}
function delAllmajor() {
	var checkDelete = document.getElementsByName("ids");
	for (var i = 0; i < checkDelete.length; i++) {
		// 判断全选按钮是否是已选中状态
		if (checkDelete[i].type == "checkbox" && checkDelete[i].checked) {
			sendDeleteRequest(checkDelete[i].value);
		}
	}
}
function delAllquestion() {
	var checkDelete = document.getElementsByName("ids");
	for (var i = 0; i < checkDelete.length; i++) {
		// 判断全选按钮是否是已选中状态
		if (checkDelete[i].type == "checkbox" && checkDelete[i].checked) {
			$.ajax({
				url : "teacher/question/delete/" + checkDelete[i].value,
				dataType : "json",
				method : "post",
				async : false,
				success : function(data) {
					if (data.result === "0") {
						Tips.showError(data.message);
					} else if (data.result === "1") {
						Tips.showSuccess(data.message);
						setTimeout(function() {
							window.location.reload();
						}, 3000);
					}
				}
			});
		}
	}
}
function delAllexam() {
	var checkDelete = document.getElementsByName("ids");
	for (var i = 0; i < checkDelete.length; i++) {
		// 判断全选按钮是否是已选中状态
		if (checkDelete[i].type == "checkbox" && checkDelete[i].checked) {
				$.post("teacher/exam/remove", "examId=" + checkDelete[i].value, function(data) {
					if (data.result === "0") {
						Tips.showError("参数错误!");
					} else if (data.result === "1") {
						Tips.showSuccess("删除成功");
						setTimeout(function() {
							window.location.reload();
						}, 3000);
					}
				}, "json");
		}
	}
}