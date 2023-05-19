$(function() {
	if ($("input[name=belong]").val() == 0) {
		$(".pending-member").addClass("active");
	} else if ($("input[name=belong]").val() == 1) {
		$(".join-member").addClass("active");
	}

	const searchOption = $("#searchOptions").val();
	if (searchOption != '') {
		$("select[name=searchOptions]").val(searchOption);
	}

	$("#memberInfo").on('show.bs.modal', function(e) {
		const id = $(e.relatedTarget).data('id');
		console.log("id:" + id);
		$.ajax({
			type: "post",
			url: "detailInfo",
			data: { id: id },
			success: function(rdata) {
				$("input[name=username]").val(rdata.username);
				$("input[name=id]").val(rdata.id);
				$("input[name=phone]").val(rdata.phone);
				$("input[name=dept]").val(rdata.dept);
				$("input[name=position]").val(rdata.position);
			}
		})
	})

	$(".authorize-btn").on("click", function() {
		$(".authorize-btn").removeClass("d-none").prev().addClass("d-none");
		$(".authorize-btn").next().addClass("d-none");
		$(this).addClass("d-none").prev().removeClass("d-none");
		$(this).next().removeClass("d-none");		
	})
	
	$(".cancel-btn").on("click",function(){
		$(this).prev().removeClass("d-none");
		$(".d-fluid").addClass("d-none");
	})

})