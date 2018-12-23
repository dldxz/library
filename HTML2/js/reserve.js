function ajaxAddReserve(data) {
	$.ajax({
		url: 'reserve.php',
		data: data,
		method: 'post',
		success: function(res) {
			if (res.status == 200) {
				cusAlert('info', 'New reservation added: ' + data.ISBN)
			}  else {
				cusAlert('danger', 'Error: ' + res.msg)
			}
		}
	})
}

function ajaxUpdateReserve() {
	$.ajax({
		url: 'research.php',
		data: {
			types: 'reserve_record',
		},
		method: 'post',
		success: function(res) {
			if (res.status == 200) {
				if (res.data == "no record") {
					return
				}
				reserve.list = res.data
			}  else {
				cusAlert('danger', 'Error: ' + res.msg)
			}
		}
	})
}

var reserve;
$(document).ready(function() {
	reserve = new Vue({
		el: '#app',
		data: {
			ISBN: '',
			username: parseJwt(localStorage.token).username,
			isAdmin: isAdmin,
			list: []
		},
		created: function() {
			ajaxUpdateReserve()
		},
		methods: {
			addReserve: function() {
				ajaxAddReserve(this.$data)
			}
		}
	})
})