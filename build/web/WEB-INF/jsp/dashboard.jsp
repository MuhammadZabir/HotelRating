<%-- 
    Document   : dashboard
    Created on : Jun 14, 2017, 9:07:28 PM
    Author     : AfiqMSI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/HotelRating/css/bootstrap.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="/HotelRating/js/bootstrap.min.js"></script>
        <title>Dashboard</title>
    </head>
    <body background="http://wallpapercave.com/wp/2u5OrmL.png">
        <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><h3>HOME</h3></a></li>
                        <li><a href="#"><h3>DASHBOARD</h3></a></li>
                        <li><a href="#"><h3>SIGN UP / LOGIN</h3></a></li>
                    </ul>
                </div>
        </nav>
        
        <h1>Hotel Name</h1>
        <!-- Vertical, rounded -->

            <div class="jumbotron">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="container vertical rounded">
                    
                            <h2>Percentage Customers Per State</h2>
                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>100%</span><br/>
                                  <span>Perak</span>
                                </div>
                              </div>
                            </div>

                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>75%</span><br/>
                                  <span>Kelantan</span>
                                </div>
                              </div>
                            </div>

                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>60%</span><br/>
                                  <span>Kedah</span>
                                </div>
                              </div>
                            </div>

                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>20%</span><br/>
                                  <span>Terengganu</span>
                                </div>
                              </div>
                            </div>

                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>34%</span><br/>
                                  <span>Pahang</span>
                                </div>
                              </div>
                            </div>

                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>82%</span><br/>
                                  <span>Perlis</span>
                                </div>
                              </div>
                            </div>
                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>82%</span><br/>
                                  <span>Penang</span>
                                </div>
                              </div>
                            </div>
                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>82%</span><br/>
                                  <span>Selangor</span>
                                </div>
                              </div>
                            </div>
                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>82%</span><br/>
                                  <span>Johore</span>
                                </div>
                              </div>
                            </div>
                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>82%</span><br/>
                                  <span>Malacca</span>
                                </div>
                              </div>
                            </div>
                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>82%</span><br/>
                                  <span>N. Sembilan</span>
                                </div>
                              </div>
                            </div>
                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>82%</span><br/>
                                  <span>Sabah</span>
                                </div>
                              </div>
                            </div>
                            <div class="progress-bar">
                              <div class="progress-track">
                                <div class="progress-fill">
                                  <span>82%</span><br/>
                                  <span>Sarawak</span>
                                </div>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
        
        
            <div class="jumbotron">
                <div class="container-fluid">

                    <table table-bordered >
                        <tr>
                            <td> <h2>Reviews</h2></td>
                            <td> <h2>User Type</h2></td>
                            <td> <h2>Ranking</h2></td>
                        </tr>
                         <tr>
                             <td><div class="col-md-4"><div id="chart"></div></div></td>
                            <td class="col-md-4"><canvas id="pie" width="650" height="350"></canvas></td>
                            <td class="col-md-4"><h1>#30</h1></td> 
                        </tr>


                    </table>


                </div>
            </div>
        
    </body>
</html>
<script> 
    
 // pie chart
var drawPieChart = function(data, colors) {
  var canvas = document.getElementById('pie');
  var ctx = canvas.getContext('2d');
  var x = canvas.width / 2;
      y = canvas.height / 2;
  var color,
      startAngle,
      endAngle,
      total = getTotal(data);
  
  for(var i=0; i<data.length; i++) {
    color = colors[i];
    startAngle = calculateStart(data, i, total);
    endAngle = calculateEnd(data, i, total);
    
    ctx.beginPath();
    ctx.fillStyle = color;
    ctx.moveTo(x, y);
    ctx.arc(x, y, y-100, startAngle, endAngle);
    ctx.fill();
    ctx.rect(canvas.width - 240, y - i * 25, 12, 12);
    ctx.fill();
    ctx.font = "12px sans-serif";
    ctx.fillText(data[i].label + " - " + data[i].value + " (" + calculatePercent(data[i].value, total) + "%)", canvas.width - 240 + 20, y - i * 25 + 10);
  }
};

var calculatePercent = function(value, total) {
  
  return (value / total * 100).toFixed(2);
};

var getTotal = function(data) {
  var sum = 0;
  for(var i=0; i<data.length; i++) {
    sum += data[i].value;
  }
      
  return sum;
};

var calculateStart = function(data, index, total) {
  if(index === 0) {
    return 0;
  }
  
  return calculateEnd(data, index-1, total);
};

var calculateEndAngle = function(data, index, total) {
  var angle = data[index].value / total * 360;
  var inc = ( index === 0 ) ? 0 : calculateEndAngle(data, index-1, total);
  
  return ( angle + inc );
};

var calculateEnd = function(data, index, total) {
  
  return degreeToRadians(calculateEndAngle(data, index, total));
};

var degreeToRadians = function(angle) {
  return angle * Math.PI / 180
}

var data = [
  { label: 'Traveler', value: 90 },
  { label: 'Family', value: 150 },
  { label: 'Business', value: 80 }
      
];
var colors = [ '#39CCCC', '#85144B', '#00008B' ];

drawPieChart(data, colors);




//doughnut chart 
$(function(){
  $("#chart").drawDoughnutChart([
    { title: "A", value : 120,  color: "#3AB189" },
    { title: "B", value:  80,   color: "#F6504E" },
    { title: "C", value:  70,   color: "#587AC6" },
    { title: "D", value : 50,   color: "#6DBBED" }
  ], {
    baseColor: '#FFF',
    baseOffset: 0,
    animateRotate: false, // 禁用旋转动画
    edgeOffset : 90, // 图表外圆与容器的距离
    textContainerOffset: 50, // 文字与容器的距离
    percentageInnerCutout: 75, // 图表内圆与容器的距离
    afterDrawed: function() {
      // 绘制完成后的回调
    }
  });
});


// 修改过的jquery.drawDoughnutChart.js
(function ( $ ) {
  $.fn.drawDoughnutChart = function(data, options) {
    var $this = this,
      W = $this.width(),
      H = $this.height(),
      centerX = W/2,
      centerY = H/2,
      cos = Math.cos,
      sin = Math.sin,
      PI = Math.PI,
      settings = $.extend({
      segmentShowStroke : true,
      segmentStrokeColor : "#0C1013",
      segmentStrokeWidth : 0,
      baseColor: "rgba(0,0,0,0.5)",
      baseOffset: 4,
      edgeOffset : 20,//offset from edge of $this
      textContainerOffset: 10, // offset of textContainer of $this
      percentageInnerCutout : 75,
      animation : true,
      animationSteps : 90,
      animationEasing : "easeInOutExpo",
      animateRotate : true,
      animateFadeDelay: 200,
      tipOffsetX: -8,
      tipOffsetY: -45,
      tipClass: "doughnutTip",
      animationFadeDuration: 200,
      summaryClass: "doughnutSummary",
      summaryTitle: "TOTAL:",
      summaryTitleClass: "doughnutSummaryTitle",
      summaryNumberClass: "doughnutSummaryNumber",
      labelOffset: 20,
      beforeDraw: function() {  },
      afterDrawed : function() {  },
      onPathEnter : function(e,data) {  },
      onPathLeave : function(e,data) {  }
      }, options),
      animationOptions = {
      linear : function (t) {
        return t;
      },
      easeInOutExpo: function (t) {
        var v = t<.5 ? 8*t*t*t*t : 1-8*(--t)*t*t*t;
        return (v>1) ? 1 : v;
      }
      },
      requestAnimFrame = function() {
      return window.requestAnimationFrame ||
        window.webkitRequestAnimationFrame ||
        window.mozRequestAnimationFrame ||
        window.oRequestAnimationFrame ||
        window.msRequestAnimationFrame ||
        function(callback) {
        window.setTimeout(callback, 1000 / 60);
        };
      }();

    settings.beforeDraw.call($this);

    var $svg = $('<svg width="' + W + '" height="' + H + '" viewBox="0 0 ' + W + ' ' + H + '" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"></svg>').appendTo($this),
      $paths = [],
      $pieGroups = [],
      easingFunction = animationOptions[settings.animationEasing],
      doughnutRadius = Min([H / 2,W / 2]) - settings.edgeOffset,
      textContainerRdius = Min([H / 2,W / 2]) - settings.textContainerOffset,
      cutoutRadius = doughnutRadius * (settings.percentageInnerCutout / 100),
      segmentTotal = 0;

    var $defs = $(document.createElementNS('http://www.w3.org/2000/svg', 'defs')).appendTo($svg);
    for (var i = 0; i < data.length; i++) {
      $defs.append(
        $(document.createElementNS('http://www.w3.org/2000/svg', 'marker'))
        .attr({
          id: 'arrow-' + i,
          viewBox: "0 0 10 10",
          markerWidth: '10',
          markerHeight: '10',
          'refX': '1',
          'refY': '5',
          orient: 'auto'
        })
        .append(
          $(document.createElementNS('http://www.w3.org/2000/svg', 'path'))
          .attr({
            d: 'M 0 0 L 10 5 L 0 10 z',
            fill: data[i].color
          })
        )
      )

    };


    //Draw base doughnut
    var baseDoughnutRadius = doughnutRadius + settings.baseOffset,
      baseCutoutRadius = cutoutRadius - settings.baseOffset;
    $(document.createElementNS('http://www.w3.org/2000/svg', 'path'))
      .attr({
      "d": getHollowCirclePath(baseDoughnutRadius, baseCutoutRadius),
      "fill": settings.baseColor
      })
      .appendTo($svg);

    //Set up pie segments wrapper
    var $pathGroup = $(document.createElementNS('http://www.w3.org/2000/svg', 'g'));
    $pathGroup.attr({opacity: 1}).appendTo($svg);

    //Set up tooltip
    var $tip = $('<div class="' + settings.tipClass + '" />').appendTo('body').hide(),
      tipW = $tip.width(),
      tipH = $tip.height();

    for (var i = 0, len = data.length; i < len; i++) {
      segmentTotal += data[i].value;

      $pieGroup = $(document.createElementNS('http://www.w3.org/2000/svg', 'g'))
      .attr({
        'fill-opacity': 0,
        id: 'path-' + i
      })
      .appendTo($pathGroup);
      $pieGroups[i] = $pieGroup;

      $paths[i] = $(document.createElementNS('http://www.w3.org/2000/svg', 'path'))
      .attr({
        "stroke-width": settings.segmentStrokeWidth,
        "stroke": settings.segmentStrokeColor,
        "fill": data[i].color,
        "data-order": i,
        "fill-opacity": 0
      })
      .delay(settings.animateFadeDelay * i)
      .animate({'fill-opacity': '1'}, settings.animateFadeDelay)
      .appendTo($pieGroup)
     
    }

    //Animation start
    // animationLoop(drawPieSegments);
    drawPieSegments(1);
    settings.afterDrawed();
    //Functions
    function getHollowCirclePath(doughnutRadius, cutoutRadius) {
      
        var startRadius = -1.570,// -Math.PI/2
        segmentAngle = 6.2831,// 1 * ((99.9999/100) * (PI*2)),
        endRadius = 4.7131,// startRadius + segmentAngle
        startX = centerX + cos(startRadius) * doughnutRadius,
        startY = centerY + sin(startRadius) * doughnutRadius,
        endX2 = centerX + cos(startRadius) * cutoutRadius,
        endY2 = centerY + sin(startRadius) * cutoutRadius,
        endX = centerX + cos(endRadius) * doughnutRadius,
        endY = centerY + sin(endRadius) * doughnutRadius,
        startX2 = centerX + cos(endRadius) * cutoutRadius,
        startY2 = centerY + sin(endRadius) * cutoutRadius;
      var cmd = [
        'M', startX, startY,
        'A', doughnutRadius, doughnutRadius, 0, 1, 1, endX, endY,//Draw outer circle
        'Z',//Close path
        'M', startX2, startY2,//Move pointer
        'A', cutoutRadius, cutoutRadius, 0, 1, 0, endX2, endY2,//Draw inner circle
        'Z'
      ];
      cmd = cmd.join(' ');
      return cmd;
    };
    function pathMouseEnter(e) {
      var order = $(this).data().order;
      $tip.text(data[order].title + ": " + data[order].value)
        .fadeIn(200);
      settings.onPathEnter.apply($(this),[e,data]);
    }
    function pathMouseLeave(e) {
      $tip.hide();
      settings.onPathLeave.apply($(this),[e,data]);
    }
    function pathMouseMove(e) {
      $tip.css({
      top: e.pageY + settings.tipOffsetY,
      left: e.pageX - $tip.width() / 2 + settings.tipOffsetX
      });
    }

    function drawPieSegments (animationDecimal) {
      var startRadius = -PI / 2,//-90 degree
        rotateAnimation = 1;
      if (settings.animation && settings.animateRotate) rotateAnimation = animationDecimal;//count up between0~1

      if (data.length === 1 && (4.7122 < (rotateAnimation * ((data[0].value / segmentTotal) * (PI * 2)) + startRadius))) {
      $paths[0].attr("d", getHollowCirclePath(doughnutRadius, cutoutRadius));
      return;
      }

      function animateTextContainer($textContainer, i) {
        setTimeout(function() {
          $textContainer.animate({opacity: 1}, {duration: settings.animateFadeDelay})
        }, settings.animateFadeDelay * i);
      }

      for (var i = 0, len = data.length; i < len; i++) {
        var segmentAngle = rotateAnimation * ((data[i].value / segmentTotal) * (PI * 2)),
          labelAngle = segmentAngle / 2,
          labelRadius = startRadius + labelAngle,
          labelEndX = centerX + cos(labelRadius) * doughnutRadius,
          labelEndY = centerY + sin(labelRadius) * doughnutRadius,
          textX = centerX + cos(labelRadius) * (textContainerRdius),
          textY = centerY + sin(labelRadius) * (textContainerRdius),


          endRadius = startRadius + segmentAngle,
          largeArc = ((endRadius - startRadius) % (PI * 2)) > PI ? 1 : 0,
          startX = centerX + cos(startRadius) * doughnutRadius,
          startY = centerY + sin(startRadius) * doughnutRadius,
          endX2 = centerX + cos(startRadius) * cutoutRadius,
          endY2 = centerY + sin(startRadius) * cutoutRadius,
          endX = centerX + cos(endRadius) * doughnutRadius,
          endY = centerY + sin(endRadius) * doughnutRadius,
          startX2 = centerX + cos(endRadius) * cutoutRadius,
          startY2 = centerY + sin(endRadius) * cutoutRadius;
        var cmd = [
          'M', startX, startY,//Move pointer
          'A', doughnutRadius, doughnutRadius, 0, largeArc, 1, endX, endY,//Draw outer arc path
          'L', startX2, startY2,//Draw line path(this line connects outer and innner arc paths)
          'A', cutoutRadius, cutoutRadius, 0, largeArc, 0, endX2, endY2,//Draw inner arc path
          'Z'//Cloth path
        ];
        $paths[i].attr("d", cmd.join(' '));

        
        var $textContainer = $('<div class="pie-text-container"><div class="text-number" style="color: '+data[i].color+';">'+(data[i].value / segmentTotal).toFixed(2) * 100 + '</div><div class="text-title" style="background-color: '+data[i].color+'">' + data[i].title + '</div></div>')
        .css({
          position: 'absolute',
          top: textY,
          left: textX,
          opacity: 0
        })
        .appendTo($this);

        // 调整文字位置
        textY = textY - $textContainer.height() / 2;
        textX = textX - $textContainer.width() / 2;
        $textContainer.css({
          top: textY,
          left: textX
        });
        animateTextContainer($textContainer, i);
        startRadius += segmentAngle;
      }
    }
    function drawDoughnutText(animationDecimal, segmentTotal) {
      $summaryNumber
      .css({opacity: animationDecimal})
      .text((segmentTotal * animationDecimal).toFixed(1));
    }
    function animateFrame(cnt, drawData) {
      var easeAdjustedAnimationPercent =(settings.animation)? CapValue(easingFunction(cnt), null, 0) : 1;
      drawData(easeAdjustedAnimationPercent);
    }
    function animationLoop(drawData) {
      var animFrameAmount = (settings.animation)? 1 / CapValue(settings.animationSteps, Number.MAX_VALUE, 1) : 1,
        cnt =(settings.animation)? 0 : 1;
      requestAnimFrame(function() {
        cnt += animFrameAmount;
        animateFrame(cnt, drawData);
        if (cnt <= 1) {
        requestAnimFrame(arguments.callee);
        } else {
        settings.afterDrawed.call($this);
        }
      });
    }
    function Max(arr) {
      return Math.max.apply(null, arr);
    }
    function Min(arr) {
      return Math.min.apply(null, arr);
    }
    function isNumber(n) {
      return !isNaN(parseFloat(n)) && isFinite(n);
    }
    function CapValue(valueToCap, maxValue, minValue) {
      if (isNumber(maxValue) && valueToCap > maxValue) return maxValue;
      if (isNumber(minValue) && valueToCap < minValue) return minValue;
      return valueToCap;
    }
    return this;
  };

}( jQuery ));






//barchart

$('.vertical .progress-fill span').each(function(){
  var percent = $(this).html();
  var pTop = 100 - ( percent.slice(0, percent.length - 1) ) + "%";
  $(this).parent().css({
    'height' : percent,
    'top' : pTop
  });
});

</script>

<style>  


body {
  background: #eee;
  text-align: center;
}



#chart{width: 400px; height: 400px;}
        .pie-text-container {}
        .pie-text-container .text-number {
          font-size: 1.6em;
        }
        .pie-text-container .text-number:after {
          content: '%';
          font-size: 0.6em;
        }
        .pie-text-container .text-title {
          color: #FFF !important;
          padding: 2px 4px;
        }
        @-webkit-keyframes fadein {
          from {opacity: 0;}
          to {opacity: 1;}
        }
        @keyframes fadein {
          from {opacity: 0;}
          to {opacity: 1;}
        }

        
        
        
        
*, *:before, *:after {
  -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;
 }



h2 {
  margin: 0 0 20px 0;
  padding: 0 0 5px 0;
  border-bottom: 1px solid #999;
  font-family: sans-serif;
  font-weight: normal;
  color: #333;
}

.container {
  align-content: center;
  width: 95%;
  margin: 20px;
  background: #fff;
  padding: 20px;
  overflow: hidden;
  float: left;
}


/* Vertical */

.vertical .progress-bar {
  float: left;
  height: 300px;
  width: 70px;
  margin-right: 22px;
}

.vertical .progress-track {
  position: relative;
  width: 70px;
  height: 100%;
  background: #ebebeb;
}

.vertical .progress-fill {
  position: relative;
  background: #825;
  height: 50%;
  width: 70px;
  color: #fff;
  text-align: center;
  font-family: "Lato","Verdana",sans-serif;
  font-size: 12px;
  line-height: 20px;
}

.rounded .progress-track,
.rounded .progress-fill {
  box-shadow: inset 0 0 5px rgba(0,0,0,.2);
  border-radius: 3px;
}
</style>
