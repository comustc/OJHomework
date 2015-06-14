/**
 * [全选]
 * @param  {[DOM]} checkbox [全选按钮]
 */
function chooseAll(checkbox) {
	var checkboxes = $("input:checkbox[name=cb]");
	var isCheck = checkbox.checked;
	if (isCheck) {
		checkboxes.prop("checked", true);
	} else {
		checkboxes.removeAttr('checked');
	}
}

/**
 * 批量删除元素
 */
function deleteMajors() {
	var checkboxes = $("input:checkbox[name=cb]:checked");
	if (checkboxes.length == 0) {
		alert("请选择您要删除的记录");
		return false;
	}
	if (confirm("这会导致相应的班级及学生被删除,您确定?")) {
		//拼接参数数组，结果如下1,2,3
		var ids = new Array();
		for (var i = 0; i < checkboxes.length; i++) {
			ids.push($(checkboxes[i]).parent().next().html());
		}
		sendDeleteRequest(ids.join());
	}
}

/**
 * [[删除单个元素]]
 * @param {[[DOM]]} btn [[触发此函数的按钮]]
 */
function deleteMajor(btn) {
	var id = $(btn).parent().prev().prev().html();
	if(confirm("这会导致相应的班级及学生被删除,您确定?")) {
		sendDeleteRequest("ids=" + id);
	}
}

/**
 * [[发送删除请求]]
 * @param {[[String]]} [[请求参数]]
 */
function sendDeleteRequest(params) {
	$.ajax({
		"url" : "major/delete",
		"data" : "ids=" + ids.join(),
		"dataType" : "json",
		"async" : false,
		"success" : function(json) {
			if(json.result == 0) {
				Tips.showError(json.message);
			}else if(json.result == 1) {
				Tips.showSuccess(json.message);
				window.location.reload();
			}
		}
	});
}

/**
 * [[检查输入的专业]]
 * @param {[[DOM]]} major [[专业输入input元素]]
 * @param {[[DOM]]} error [[显示错误的DOM]]
 */
function _checkMajor(major, major_value, error) {
	if (major_value == "") {
		error.innerHTML = "请输入专业名称";
		major.focus();
		return false;
	}
	return true;
}

/**
 * [[添加专业]]
 * @param {[[DOM]]} form [[所在的表单]]
 */
function addMajor(form) {
    var major = form.major;
    var major_value = major.value.trim();
    var error = document.getElementById("major_add_error");
    if(_checkMajor(major, major_value, error)) {
        $.ajax({
            "url": "admin/major/add",
            "data": "major=" + major_value,
            "async": false,
            "dataType": "json",
            "success": function(json) {
                if(json.result == 0) {
                    error.innerHTML = json.message;
                }else {
                    toggleMajorAdd(false);
                    _resetMajor(major, error);
                    Tips.showSuccess(json.message);
                }
            }
        });
    }
    return false;
}

/**
 * 编辑专业
 * @param {} form
 */
function editMajor(form) {
	var major = form.major;
    var major_value = major.value.trim();
    var error = document.getElementById("major_edit_error");
    if(_checkMajor(major, major_value, error)) {
        $.ajax({
            "url": "admin/major/edit",
            "data": "major=" + major_value + "&id=" + form.id.value,
            "async": false,
            "dataType": "json",
            "success": function(json) {
                if(json.result == 0) {
                    error.innerHTML = json.message;
                }else {
                    toggleMajorEdit(false);
                    _resetMajor(major, error);
                    Tips.showSuccess(json.message);
                    window.location.href = "admin/major/list";
                }
            }
        });
    }
    return false;
}

/**
 * [[显示/隐藏专业添加窗口]
 */
function toggleMajorAdd(isShow) {
	document.getElementById("major_add").style.display = isShow ? "block"
			: "none";
}

/**
 * [[重置专业输入界面]]
 * @param {[[DOM]]} major [[专业输入]]
 * @param {[[DOM]]} error [[错误显示]]
 */
function _resetMajor(major, error) {
    major.value = "";
    error.innerHTML = "";
}

/**
 * [[显示/隐藏专业编辑窗口]]
 * @param {[[boolean]} [[true--显示]]
 * @param {[[DOM]]} [[如果是显示，那么为触发的按钮]]
 */
function toggleMajorEdit(isShow, btn) {
	var major_edit = document.getElementById("major_edit");
	if (isShow) {
		var name_td = $(btn).parent().prev();
		$("#major_edit_major").val(name_td.html());
		$("#major_edit_id").val(name_td.prev().html());
		major_edit.style.display = "block";
	} else {
		major_edit.style.display = "none";
	}
}

/**
 * 搜索
 * @param {DOM} 搜搜表单
 */
function search(form) {
	var input = form.search.value;
	if(input.trim() == "") {
		return false;
	}
	return true;
}