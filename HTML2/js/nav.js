$(document).ready(function() {
    var nav = new Vue({
        el: '#nav',
        data: {
            isAdmin: isAdmin,
            isStu: !isAdmin,
            stuNav: [
                {
                    name: '图书查询',
                    link: 'query.html'
                },
                {
                    name: '借阅记录',
                    link: 'history.html'
                }
            ],
            adminNav: [
                {
                    name: '录入图书',
                    link: 'newbook.html'
                },
                {
                    name: '借书还书',
                    link: 'process.html'
                },
                {
                    name: '借书证办理',
                    link: 'card.html'
                }
            ]
        }，
        methods: {
            isCurrent: function(link) {
                splitted = location.href.split('/')
                return link == splitted[splitted.length - 1]
            }
        }
    })
})