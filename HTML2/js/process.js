function ajaxAddProcess(data) {
	$.ajax({
		url: 'businessProcess.php',
		method: 'post',
		data: data,
		success: function(res) {
			if (res.status == 200) {
				cusAlert('info', 'Done')
			}  else {
				cusAlert('danger', 'Error: ' + res.msg)
			}
		}
	})
}

function ajaxUpdateHistory() {
	$.ajax({
		url: 'research.php',
		data: {
			types: 'borrow_record',
		},
		method: 'post',
		success: function(res) {
			if (res.status == 200) {
				if (res.data == "no record") {
					return
				}
				app.list = res.data
			}  else {
				cusAlert('danger', 'Error: ' + res.msg)
			}
		}
	})
}

var app;
$(document).ready(function() {
	app = new Vue({
		el: '#app',
		data: {
			select: '',
			userId: '',
			isbn: '',
			list: [],
			isAdmin: isAdmin
		},
		created: function() {
			ajaxUpdateHistory()
		},
		methods: {
			addProcess: function() {
				ajaxAddProcess(this.$data)
			}
		}
	})
})