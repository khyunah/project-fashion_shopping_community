let domain;

let index = {
	getDomain: function() {
		$.ajax({
			type: "get",
			url: "/test/api/getDomain",
			dateType: "json",
			success: function(res) {
				domain = res
				index.genderCategory();
				index.init();
			}
		}).fail(function() {
			index.getDomain();
		});
	},

	init: function() {

		$("#btn-save").bind("click", () => {
			this.save();
		});
		$("#gender").change("change", () => {
			this.genderCategory();
		});
		$("#btn-reply-save").bind("click", () => {
			this.replySave();
		});
		$("#admin-shopping-btn-update").bind("click", () => {
			this.updateItem();
		});
	},

	genderCategory: function() {
		if ($("#gender").val() == 'MAN') {
			loadCategory('MAN');
			$("#category").change("change", () => {
				console.log("체인지 카테고리 에서 실행 ");
				categorySize();
			});

		} else if ($("#gender").val() == 'WOMAN') {
			loadCategory('WOMAN');
			$("#category").change("change", () => {
				console.log("체인지 카테고리 에서 실행 ");
				categorySize();
			});
		}

	},

	save: function() {

		// 데이터 가져오기
		let data = {
			category: $("#category").val(),
			content: $("#content").val(),
			gender: $("#gender").val(),
			imageurl: $("#imageurl").val(),
			name: $("#name").val(),
			price: $("#price").val(),
			size: $("#size").val(),
			color: $("#color").val()
		}

		console.log("데이터 확인");
		console.log(data);

		$.ajax({
			type: "POST",
			url: "/api/item",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		})
			.done(function(data, textStatus, xhr) {
				if (data.status) {
					alert("새로운 제품을 추가했습니다.");
					location.href = "/shop/save_form";
				}
			})
			.fail(function(error) {
				alert("제품 추가를 실패했습니다.");
			});
	},

	updateItem: function() {
		let id = $("#itemId").val();
		let data = {
			id: id,
			category: $("#category").val(),
			content: $("#content").val(),
			gender: $("#gender").val(),
			imageurl: $("#imageurl").val(),
			name: $("#name").val(),
			price: $("#price").val(),
			size: $("#size").val(),
			color: $("#color").val()
		}

		$.ajax({
			type: "POST",
			url: "/api/item",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response) {
			if (response.status != null) {
				alert("상품 수정이 완료되었습니다.");
				location.href = `/admin/shopping/item-detail/${id}`;
			}
		}).fail(function() {
			alert("상품 수정에 실패했습니다.");
		});
	}

}
index.getDomain();

function loadCategory(gender) {
	var cell = document.getElementById("category");
	while (cell.hasChildNodes()) {
		cell.removeChild(cell.firstChild);
	}
	let category = domain.genderCategory[gender];

	let name = $("#name").val();

	category.forEach((item) => {
		if (name != null) {
			let itemCategory = $("#itemCategory").val();
			if (item == itemCategory) {
				let option = `<option value="${item}" selected>${item}</option>`;
				$("#category").append(option);
			} else {
				let option = `<option value="${item}">${item}</option>`;
				$("#category").append(option);
			}
		} else {
			let option = `<option value="${item}">${item}</option>`;
			$("#category").append(option);
		}
	});

}

function categorySize() {

	var cell = document.getElementById("size");
	while (cell.hasChildNodes()) {
		cell.removeChild(cell.firstChild);
	}
	let size = domain.categorySize[$("#category").val()];

	size.forEach((item) => {
		let option = `<option value="${item}">${item}</option>`;
		$("#size").append(option);
	});
}

function categoryColor() {
	let color = $("#itemColor").val();
	$(`#color`).val(color).prop('selected', true);

	let size = $("#itemSize").val();
	$("#size").val(size).prop('selected', true);
}

function thisSize() {
	$("#size").bind('click', () => {
		categorySize();
	});
}

if ($("#name").val() != null) {
	categoryColor();
	thisSize();
}
