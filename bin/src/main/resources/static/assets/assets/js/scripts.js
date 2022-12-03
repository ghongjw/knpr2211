var _deviceCondition = '';

$.gnb = function () {
    var gnbNum = -1;

    $('.gnb>li').mouseover(function () {
        $("#header").addClass("over");
    });
    $('.gnb>li').mouseleave(function () {
        $("#header").removeClass("over");
        $(".gnb > li").removeClass("is-active");
        $(".gnb > li .depth2 > li").removeClass("is-active");
    });
    $(".gnb > li").each(function (q) {
        $(this).on("mouseenter focusin", function () {
            if (gnbNum != $(this).index()) {
                $(".depth2 > li").removeClass("is-active");
            }
            $(this).siblings().removeClass("is-active");
            $(this).addClass("is-active");

            gnbNum = $(this).index();
        });
    });

    $(".depth2 > li").each(function (q) {
        $(this).mouseenter(function () {
            $(this).siblings().removeClass("is-active");
            $(this).addClass("is-active");
        });
    });
};

$.snb = function () {
    var btnMenu = $('.btn-menu');

    // 전체메뉴 닫기
    btnMenu.on("click", function () {
        $(".all-menu").fadeIn(200, function () {
            $("body").addClass("overflow-hidden");
            $(this).addClass("open");
        });
    });

    // 전체메뉴 아코디언
    var curAllMenuNum = -1;
    $(".all-menu .gnb > li").each(function (q) {
        $(this).on("click", function () {
            if (curAllMenuNum == q) {
                $(".all-menu .gnb > li").attr("title", "하위 메뉴 열기");

                curAllMenuNum = -1;
                $(".all-menu .gnb > li").attr("title", "하위 메뉴 닫기");

            } else {
                $(".all-menu .gnb > li").removeClass("is-active");
                $(".all-menu .gnb > li").attr("title", "하위 메뉴 열기");
                curAllMenuNum = q;
                $(this).attr("title", "하위 메뉴 닫기");
                $(this).addClass("is-active");
            }
        });
    });

    $(".all-menu .depth2 > li").on("click", function () {
        $('.depth2 > li').removeClass("is-active");
        $(this).addClass("is-active");
    })

    // 전체메뉴 닫기
    var btnClose = $('.btn-close');
    btnClose.on("click", function () {
        $(".all-menu").removeClass("open");
        $("body").removeClass("overflow-hidden");
        $(".all-menu").fadeOut(200, function () {
            $("body").removeClass("overflow-hidden");
            $(".all-menu .gnb > li").removeClass("is-active");
        });
        curAllMenuNum = -1;
    });
};

$.layerToggle = function () {

    $(".btn-toggle").on("click", function () {
        $(this).toggleClass("is-active");
    });
}

$.layerPopup = function () {

    $(".btn-layer").on("click", function (e) {
        e.preventDefault();
        $("body").addClass("overflow-hidden");
        $("#" + $(this).data("popup")).addClass("active");
        $("#" + $(this).data("popup")).find(".popup-wrap").center();
        $(".zoomable").zoomer("resize");
    });

    $(".btn-close").on('click', closePopup);

    $(".popup-wrap").scroll(function () {
        $(".input-datepicker").datepicker("update")
    })
}

$.fn.center = function () {
    var position = Math.max(40, (($(window).height() - $(this).outerHeight()) / 2)) + "px"
    this.css("top", position).css("bottom", position);
    return this;
}

$.resize = function () {
    $(window).resize(function () {
        if (window.innerWidth > 1023) {
            _deviceCondition = "pc";
            $.gnb();
            $(".all-menu").removeClass("open");
            $("body").removeClass("overflow-hidden");
            $(".all-menu").fadeOut(200, function () {
                $("body").removeClass("overflow-hidden");
                $(".all-menu .gnb > li").removeClass("is-active");
            });
        } else {
            _deviceCondition = "mobile";
            $.snb();
        }
        $(".zoomable").zoomer("resize");
    }).resize();
}

$.accordion = function () {
    $(".collapse-wrap>.q, .btn.collapse").on("click", function () {
        if ($(this).hasClass("is-active") == true) {
            $(this).toggleClass("is-active");
            $(this).next().stop().slideToggle(300);
        } else {
            $(this).parents(".collapse-wrap").find(".collapse-wrap>.q, .btn.collapse").removeClass('is-active');
            $(this).parents(".collapse-wrap").find(".a").slideUp(300);
            $(this).addClass("is-active");
            $(this).next().stop().slideDown(300);
        }
        return false
    })

    $(".collapse-wrap .check.collapse").on("change", function () {
        if ($(this).prop("checked")) {
            $(this).parents(".collapse-wrap").find(".a").stop().slideToggle(200);

        } else {
            $(this).parents(".collapse-wrap").find(".a").slideUp(200);
        }
    })
}

$.datepicker = function () {
    $(".input-datepicker").datepicker({
        language: 'en',
        autoclose: true
    });
}

$.fn.datepicker.language['en'] = {
    days: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
    daysShort: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
    daysMin: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
    months: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
    monthsShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    today: 'Today',
    clear: 'Clear',
    dateFormat: 'yyyy/mm/dd',
    timeFormat: 'hh:ii aa'
};

$.scrollTable = function () {
    $('.scroll-body').scroll(function () {
        var scrollX = $('.scroll-body').scrollLeft();
        $('.scroll-head').scrollLeft(scrollX);
    });
}

$.zoom = function () {
    $(".zoomable").zoomer();

    $(window).on("resize", function(e) {
        $(".zoomer_wrapper").zoomer("resize");
    });

    $(window).one("pronto.load", function() {
        $(".zoomable").zoomer("destroy");
        $(".zoomer_custom").zoomer("destroy");
        $(".zoomer_tiled").zoomer("destroy");
        $(".load_zoomer_tiled").off("click");
    });
}

$(document).ready(function() {
    if ($(".nav-tabs").length > 0) {
        $(".nav-tabs").each(function () {
            $(".tab-menu li:not(.menu-tabs .tab-menu li)").on("click", function (e) {
                e.preventDefault();

                $(this).parent().find("li").removeClass("is-active");
                $(this).addClass("is-active");
                var activeTab = $(this).find("a").attr("href");
                $(this).parent().next().find(".tab-pane").removeClass("is-active");
                $(activeTab).addClass("is-active");
            })
            return false;
        });

        $(".menu-tabs").each(function () {
            $(".menu-tabs .tab-menu li").on("click", function (e) {
                e.preventDefault();

                $(".menu-tabs .tab-menu li").removeClass("is-active");
                $(this).addClass("is-active");
                var activeTab = $(this).find("a").attr("href");
                $(this).parents().next().find(".tab-pane").removeClass("is-active");
                $(activeTab).addClass("is-active");
            })
            return false;
        });
    };

    if ($("select").length > 0) {
        $("select").change(function () {
            $(this).css("color", "#1e1f21");
        });
    }

    if ($(".input-datepicker").length > 0) {
        $.datepicker();
    }

    if ($(".table-reservation").length > 0) {
        $.scrollTable();
    }

    if ($(".zoom-container").length > 0) {
        $.zoom();
    }

    $.layerToggle();
    $.layerPopup();
    $.resize();
    $.accordion();
});

function openPopup(id){
    $("body").addClass("overflow-hidden");
    $("#"+id).addClass("active");
    $("#"+id).find(".popup-wrap").center();
    $(".zoomable").zoomer("resize");
}

function closePopup() {
    $("body").removeClass("overflow-hidden");
    if(typeof arguments[0] == 'string'){
        $("#"+arguments[0]).removeClass("active");
    }else{
        $(this).parents().removeClass("active");
    }
    $(".popup-wrap").css("top", "auto");
}

