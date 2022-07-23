function clickList(target) {
	let bb = target.parentNode;
	let trs = bb.getElementsByTagName("tr");

	// 선택안된 
	var backColor = "#212529";
	var textColor = "#ffffff";
	// 선택 된
	var orgBColor = "black";
	var orgTColor = "#ffffff";

	let th_value = [];

	for (var i = 0; i < trs.length; i++) {
		if (trs[i] != target) {
			trs[i].style.backgroundColor = backColor;
			trs[i].style.color = textColor;
		} else {
			trs[i].style.backgroundColor = orgBColor;
			trs[i].style.color = orgTColor;
			var td = trs[i].getElementsByTagName("td");
			for (let j = 0; j < td.length; j++) {
				th_value[j] = td[0].innerText;
			}
		}
	}
	var id = th_value[0];
	$("#admin-object-id").text(id);
}

let admin = {
	userDelete: function(){
		let result = confirm('유저를 삭제할까요?');
		let id = $("#admin-object-id").text();
		console.log(id);
    	if(result){
			location.href = `/admin/user/delete/${id}`;
    	}
	},
	
	userChangeRole: function(){
		let result = confirm('유저에게 권한을 부여할까요?\n[ 확인 - 관리자     취소 - 회원 ]');
		let id = $("#admin-object-id").text();
		console.log(result);
		location.href = `/admin/user/change-role/${id}/${result}`;
	}
}
