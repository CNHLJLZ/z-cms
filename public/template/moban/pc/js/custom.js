function goTop(){$(window).scroll(function(e){if($(window).scrollTop()>100)
$(".gotop").fadeIn(350).css("display","block");else
$(".gotop").fadeOut(350).css("display","none");});$(".gotop").click(function(e){$('body,html').animate({scrollTop:0},500);return false;});};$(document).ready(function(){if($(".fixed-bottom").is(":visible")){$("#wrapper").css("paddingBottom",$(".fixed-bottom").height());}else{}
goTop();dataAnimate();$('.language ul.sf-menu').superfish({delay:500,animation:{opacity:'fast',height:'show'},speed:'fast',autoArrows:true,dropShadows:false});$('.main-nav ul.sf-menu').superfish({delay:500,animation:{opacity:'fast',height:'show'},speed:'fast',autoArrows:true,dropShadows:false});$('.main-nav ul.sf-menu > li').last().addClass('last').end().hover(function(){$(this).addClass('nav-hover');},function(){$(this).removeClass('nav-hover');});$(".main-nav li a, .logo a").click(function(){if($(this).attr("target")!="_blank"){if($(this).attr("href")!="javascript:;"&&$(this).attr("href")!="#")
return openwork($(this).attr("href"));}});function openwork(url){$("#wrapper").css({'-webkit-animation':"bounceIn 0.5s .25s ease both",'-moz-animation':'bounceIn 1s .25s ease both','animation':'bounceIn 0.5s .25s ease both'});$("body").append("<div class='page-cover'></div>").css("position","relative");$(".page-cover").delay(600).animate({"height":$(document).height()},800,null,function(){location.href=url;});return false};$(".tabs-nav").tabs(" > .tabs-panes > div",{event:'mouseover'});$(".tabs-nav > li > a").click(function(){var _tabIndex=$(this).parents(".tabs-nav").find("li").index($(this).parent());if($(this).parents(".tabs-default").find(".tab-box").eq(_tabIndex).find(".scrollable-default").length>0){$(".scrollable-default").carouFredSel({width:'100%',infinite:false,circular:false,auto:{pauseOnHover:true,timeoutDuration:3500},swipe:{onTouch:true,onMouse:true},prev:{button:function(){return $(this).parent().next('.carousel-direction').find(".carousel-prev");}},next:{button:function(){return $(this).parent().next('.carousel-direction').find(".carousel-next");}}});$(".scrollable-default").parents(".scrollable").css("overflow","visible");}
if($(this).parents(".tabs-default").find(".tab-box").eq(_tabIndex).find(".full-scrollable-default").length>0){$(".full-scrollable-default").carouFredSel({infinite:false,circular:false,auto:false,swipe:{onTouch:true,onMouse:true},responsive:true,items:{visible:{min:2,max:8}},prev:{button:function(){return $(this).parent().next('.carousel-direction').find(".carousel-prev");}},next:{button:function(){return $(this).parent().next('.carousel-direction').find(".carousel-next");}}});}});$(".accordion").tabs(".accordion .accordion-pane",{tabs:'.accordion-handle',effect:'slide',initialIndex:0});$.tools.tabs.addEffect("slide",function(tabIndex,done){this.getPanes().slideUp("fast").eq(tabIndex).slideDown("fast");done.call();});$('.pgwSlideshow-gallery').pgwSlideshow({mainClassName:'pgwSlideshow-gallery pgwSlideshow'});$('.pgwSlideshow-gallery-simple').pgwSlideshow({mainClassName:'pgwSlideshow-gallery-simple pgwSlideshow',displayList:false});$('.pgwSlideshow-gallery-zoom').pgwSlideshow({mainClassName:'pgwSlideshow-gallery-zoom pgwSlideshow',displayControls:false});$(".qhd-content table tbody>tr").hover(function(){$(this).addClass("trhover");},function(){$(this).removeClass("trhover");});$(".qhd-content table").each(function(){if(!$(this).parent().hasClass("table-responsive")){$(this).wrap("<div class='table-responsive'></div>");}});$(".fixed-left").fixed({halfTop:true});$(".fixed-right").fixed({halfTop:true});$(".service-close-btn").click(function(){var serviceMax=$(this).parents(".service-max"),serviceMin=serviceMax.next(".service-min");serviceMin.show();serviceMax.hide();});$(".service-open-btn").click(function(){var serviceMax=$(this).prev(".service-max"),fixedELement=$(this).parents(".fixed");$(this).hide();serviceMax.show();});$(".link-fixed-side > ul > li").each(function(){$(this).hover(function(){$(this).addClass("active").find(".link-summary").show();},function(){$(this).removeClass("active").find(".link-summary").hide();});if($(this).find('a').attr('href').indexOf("#popup")!=-1){$(this).find('a').addClass('popup-show-btn');}});$('.fancybox-video-play').fancybox({'autoScale':false,'transitionIn':'elastic','transitionOut':'elastic','hideOnOverlayClick':false,'centerOnScroll':true,'overlayColor':'#000','padding':'5'});$("a").each(function(){if(typeof($(this).attr('href'))!="undefined"&&$(this).attr('href').indexOf("#popup")!=-1){$(this).addClass('popup-show-btn');}});$('.popup-show-btn').click(function(){$('.popup').show();$('.popup-overlay').height($(document).height());$('.popup-content').css({marginLeft:-($('.popup-content').outerWidth()/2),marginTop:-($('.popup-content').outerHeight()/2)});$('.popup-close-btn').click(function(){$(this).parents('.popup').hide();});return false;});var touchWindowWidth=$(window).width();if(touchWindowWidth<1000){$('.article-detail-fancybox').css("width",touchWindowWidth-80);}
var isMobile=device.mobile(),isTable=device.tablet(),isiPhone=device.iphone(),isiPad=device.ipad();if(isMobile||isTable||isiPhone||isiPad){$('a').not('[data-mobile-target="_blank"]').removeAttr('target');}});$(window).load(function(){$(".scrollable-default").carouFredSel({width:'100%',infinite:false,auto:{pauseOnHover:true,timeoutDuration:3500},swipe:{onTouch:true,onMouse:true},prev:{button:function(){return $(this).parent().next('.carousel-direction').find(".carousel-prev");}},next:{button:function(){return $(this).parent().next('.carousel-direction').find(".carousel-next");}}});$(".scrollable-default").parents(".scrollable").css("overflow","visible");$(".full-scrollable-default").carouFredSel({infinite:false,circular:false,auto:false,swipe:{onTouch:true,onMouse:true},responsive:true,items:{visible:{min:2,max:8}},prev:{button:function(){return $(this).parent().next('.carousel-direction').find(".carousel-prev");}},next:{button:function(){return $(this).parent().next('.carousel-direction').find(".carousel-next");}}});$(".full-scrollable-default").parents('.caroufredsel_wrapper').css({'height':($(".full-scrollable-default").find('li').outerHeight())+'px'});if($('.izotope-container').length){$('.izotope-container').isotope({itemSelector:'.izotope-item',layoutMode:'masonry',masonry:{columnWidth:'.grid-sizer'}});};});