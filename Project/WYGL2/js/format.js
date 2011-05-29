Ext.namespace("Ext.Hudongsoft.util.Format");

Ext.Hudongsoft.util.Format = function(){
	return {
		dateRenderer : function (format){
			 return function(v){
                if(v==null) return v;
                
                var f = format?format: 'yyyy-MM-dd';
                if (typeof(v) == 'string') {
                    return new Date(v).format(f);
                }
                else
                {
                    return v.format(f);
                }					
            };
		},			
		dateTimeRenderer : function(v,format){
		    return function(v){
                if(v==null) return v;
                var f = format?format: 'yyyy-MM-dd hh:mm:ss';
                if (typeof(v) == 'string') {
                    return new Date(v).format(f);
                }
                else
                {                
                    return v.format(f);
                }	
            };
        },
        ssfcRenderer: function () {
            return function(v, metaData, record, rowIndex, colIndex, store){
                if(v)
				{
				    return record.data.房产类型 + '-' + v;
				}
			};
        },
        htztRenderer: function () { // 合同状态
            return function(v, metaData, record, rowIndex, colIndex, store){
                var dt = record.data.合同结束时间;
            	if(dt)
				{
				    var now = new Date();
				    var num = now.dateDiff('d',dt);
				    if (num<=0) {
				        return "<span style='color:red'>到期</span>";
				    }
				    else if (num<90) {				    
                        return "<span style='color:red'>"+num+"天到期</span>";
				    }
				    else
				        return "正常";
				}
			};
        },
        lrztRenderer:function () { //数据录入状态
            return function(v, metaData, record, rowIndex, colIndex, store){
                var dt = record.data.录入状态;
                if (dt == "已录入") {
                    return "<span style='color:green'>已录入</span>";
                }
                else if(dt == "未录入"){
                    return "<span style='color:red'>未录入</span>";
                }
                else if(dt == "不能录入"){
                    return "<span style='color:black'>不能录入</span>";
                }
            }
        },
        
        jfztRenderer:function () { //缴费状态
            return function(v, metaData, record, rowIndex, colIndex, store){
                var dt = record.data.缴费状态;
                if (dt == "已缴费") {
                    return "<span style='color:green'>已缴费</span>";
                }
                else if(dt == "未缴费"){
                    return "<span style='color:red'>未缴费</span>";
                }
                else if(dt == "不能缴费"){
                    return "<span style='color:black'>不能缴费</span>";
                }                
                else if(dt == "不要交费"){
                    return "<span style='color:black'>不要交费</span>";
                }
            }
        },
        
        htjsRenderer: function () { // 合同结束
            return function(v, metaData, record, rowIndex, colIndex, store){
                if(v!=null)
				{
					if(record.data.合同结束时间)
					{
					}
				}
			};
        },
		lastFollowDateRenderer : function (format){
			 return function(v, metaData, record, rowIndex, colIndex, store){
                if(v!=null)
				{
					if(record.data.lastFollowDate)
					{
						if(record.data.propertyNo && App.sys.ts.propertyLastFollowDays !=null && App.sys.ts.propertyLastFollowDays !=0 )
						{
							var num = new Date(v).dateDiff('d',new Date());
							if( num > App.sys.ts.propertyLastFollowDays)
							{
								return '<span style="color:red;">' + new Date(v).format(format) + '</span>'
							}
						}
						if(record.data.inquiryNo && App.sys.ts.inquiryLastFollowDays !=null && App.sys.ts.inquiryLastFollowDays !=0 )
						{
							var num = new Date(v).dateDiff('d',new Date());
							if( num > App.sys.ts.inquiryLastFollowDays)
							{
							return '<span style="color:red;">' + new Date(v).format(format) + '</span>'
							}
						}
					}
					return new Date(v).format(format);
				}
            };		
		},	
        yearMonthDayRenderer_1 : function(v, metaData, record, rowIndex, colIndex, store){
            return record.data.合同开始时间_年 + '-' + record.data.合同开始时间_月+ '-' + record.data.合同开始时间_日;	
		},
        yearMonthDayRenderer_2 : function(v, metaData, record, rowIndex, colIndex, store){
            return record.data.合同结束时间_年 + '-' + record.data.合同结束时间_月+ '-' + record.data.合同结束时间_日;	
		},
		yearMonthRenderer : function(v, metaData, record, rowIndex, colIndex, store){
            return record.data.合同开始时间_年 + '/' + record.data.合同开始时间_月;
		},
		yearMonthRenderer2 : function(v, metaData, record, rowIndex, colIndex, store){
            return record.data.日期年 + '/' + record.data.日期月;
		}
	}
}();
/* 得到日期年月日等加数字后的日期 */
Date.prototype.dateAdd = function(interval,number)
{
var d = this;
var k={"y":"FullYear", "q":"Month", "m":"Month", "w":"Date", "d":"Date", "h":"Hours", "n":"Minutes", "s":"Seconds", "ms":"MilliSeconds"};
var n={"q":3, "w":7};
eval("d.set"+k[interval]+"(d.get"+k[interval]+"()+"+((n[interval]||1)*number)+")");
return d;
};
/* 计算两日期相差的日期年月日等 */
Date.prototype.dateDiff = function(interval,objDate)
{
var d=this, t=d.getTime(), t2=objDate.getTime(), i={};
i["y"]=objDate.getFullYear()-d.getFullYear();
i["q"]=i["y"]*4+Math.floor(objDate.getMonth()/4)-Math.floor(d.getMonth()/4);
i["m"]=i["y"]*12+objDate.getMonth()-d.getMonth();
i["ms"]=objDate.getTime()-d.getTime();
i["w"]=Math.floor((t2+345600000)/(604800000))-Math.floor((t+345600000)/(604800000));
i["d"]=Math.floor(t2/86400000)-Math.floor(t/86400000);
i["h"]=Math.floor(t2/3600000)-Math.floor(t/3600000);
i["n"]=Math.floor(t2/60000)-Math.floor(t/60000);
i["s"]=Math.floor(t2/1000)-Math.floor(t/1000);
return i[interval];
};

Date.prototype.format = function(format) {    
  var o = {    
    "M+" : this.getMonth()+1, //month    
    "d+" : this.getDate(),    //day    
    "h+" : this.getHours(),   //hour    
    "m+" : this.getMinutes(), //minute    
    "s+" : this.getSeconds(), //second    
    "q+" : Math.floor((this.getMonth()+3)/3),  //quarter    
    "S" : this.getMilliseconds() //millisecond    
  }    
  if(/(y+)/.test(format)) format=format.replace(RegExp.$1,    
    (this.getFullYear()+"").substr(4 - RegExp.$1.length));    
  for(var k in o)if(new RegExp("("+ k +")").test(format))    
    format = format.replace(RegExp.$1,    
      RegExp.$1.length==1 ? o[k] :    
        ("00"+ o[k]).substr((""+ o[k]).length));    
  return format;   
 } 
