function ajaxGetBooks(select, keyword) {
	$.ajax({
		url: 'student.php',
		data: {
			select: select,
			keyword: keyword
		},
		success: function(data) {
			if (data.status == 200) {
				books.booklist = data.data;
			} else {
				cusAlert('danger', 'Error: ' + data.msg)
				books.booklist = []
			}
		}
	})
}

var books;
$(document).ready(function() {
	books = new Vue({
		el: '#books',
		data: {
			booklist: [],
			select: 'bname',
			keyword: ''
		},
		created: function() {
			ajaxGetBooks(this.select, this.keyword);
		},
		methods: {
			query: function() {
				ajaxGetBooks(this.select, this.keyword);
			}
		}
	})
});