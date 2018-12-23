isAdmin = localStorage.type == 'admin'
var nav
$(document).ready(function() {
    if (location.href.search('login.html') != -1) {
        return
    }
    nav = new Vue({
        el: '#nav',
        data: {
            isAdmin: isAdmin,
            isStu: !isAdmin,
            stuNav: [
                {
                    name: '图书查询',
                    link: 'query.html' // db: book r
                },
                {
                    name: '借阅记录',
                    link: 'history.html' // db: borrow_record r | arrear_record r
                },
                {
                    name: '图书预约',
                    link: 'reserve.html' // db: reserve_record ru
                }
            ],
            adminNav: [
                {
                    name: '图书查询',
                    link: 'query.html' // db: book r
                },
                {
                    name: '借书还书',
                    link: 'process.html' // db: borrow_record ru
                },
                {
                    name: '图书预约',
                    link: 'reserve.html' // db: reserve_record r
                },
                {
                    name: '录入图书',
                    link: 'newbook.html' // db: inbound_record ru
                },
                {
                    name: '逾期管理',
                    link: 'arrear.html' // db: arrear_record ru
                }
            ],
            sentences: [
                '读过一本好书，像交了一个益友。——臧克家 ',
                '读书破万卷，下笔如有神。——杜甫',
                '不读书的人，思想就会停止。——狄德罗',
                '凡读无益之书，皆是玩物丧志。——（清）王豫',
                '读书对于智慧，就象体操对于身体一样。——（英国）谚语',
                '读书不知味，不如束高阁；蠢鱼尔何如，终日食糟粕。——（清）袁牧',
                '鸟欲高飞先振翅，人求上进先读书。——李苦禅',
                '没有比读书更好的娱乐更持久的满足了。——（英国）谚语',
                '进学致和，行方思远。——字严',
                '壮士腰间三尺剑；男儿腹中五车书。——《对联集锦》',
                '学问对人们要求最大的紧张和最大的热情。——巴甫洛夫',
                '学习并不等于就是摹仿某些东西，而是掌握技巧和方法。——高尔基'
            ]
        },
        methods: {
            isCurrent: function(link) {
                splitted = location.href.split('/')
                return link == splitted[splitted.length - 1]
            }
        }
    })
})