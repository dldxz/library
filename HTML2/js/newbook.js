function ajaxNewBook(data) {
	$.ajax({
		url: 'bookEntry.php',
		method: 'post',
		data: data,
		success: function(res) {
			if (res.status == 200) {
				cusAlert('info', 'New book added: ' + data.bname)
			} else {
				cusAlert('warning', "Warning: " + res.msg)
			}
		}
	})
}

var app;
$(document).ready(function() {
	app = new Vue({
		el: '#app',
		data: {
			inputs: {
				isbn: {label: 'ISBN', value: '978-1-879546-05-1'},
				bname: {label: '书名', value: 'Hair Health'},
				author: {label: '作者', value: 'Loran Chen'},
				price: {label: '价格（元）', value: '999'},
				publish_house: {label: '出版社', value: 'Hangzhou Dianzi Chubanshe'},
				is_rare: {label: '是否稀有', value: '1'},
				book_type: {label: '类型', value: 'Art'}
			},
		},
		methods: {
			addNew: function() {
				data = {}
				for (key in this.inputs) {
					data[key] = this.inputs[key].value;
				}
				ajaxNewBook(data)
			}
		}
	})
})