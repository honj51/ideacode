Ext.namespace('Ext.Hudongsoft');

/************************************************************************/
/* 录入列表                                                             */
/************************************************************************/
Ext.Hudongsoft.sjlrGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"录入列表",
	jfgl: false,
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list',
        root : 'data',
	    totalProperty : 'totalProperty',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','房产类型','合同开始时间_年','合同开始时间_月','合同开始时间_日','合同结束时间_年','合同结束时间_月',
		    '合同结束时间_日','合同开始时间','合同结束时间','录入状态','缴费状态','录入月份'
		]
	}),
//	width:802,
//	height:475,	
	initComponent: function(){
	    var self = this;
	    var lx_store = new Ext.data.JsonStore({
		    autoLoad:true,
		    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
		    fields: ['lx']
		});
	    self.columns = [
		    {
			    header:"序号",
			    sortable:true,
			    resizable:true,
			    dataIndex:"id",
			    width:60
		    },
		    {
			    header:"编码",
			    sortable:true,
			    resizable:true,
			    dataIndex:"编码",
			    width:150
		    },
		    {
			    header:"客户名称",
			    sortable:true,
			    resizable:true,
			    dataIndex:"客户名称",
			    width:70
		    },
		    {
			    header:"所属工业园",
			    sortable:true,
			    resizable:true,
			    dataIndex:"所属工业园",
			    width:80
		    },
		    {
			    header:"所属房产",
			    sortable:true,
			    resizable:true,
			    dataIndex:"所属房产",
			    width:80
		    },
		    {
			    header:"合同开始时间",
			    sortable:true,
			    resizable:true,
			    dataIndex:"合同开始时间",
			    renderer: Ext.Hudongsoft.util.Format.yearMonthDayRenderer_1,
			    width:100
		    },
		    {
			    header:"合同结束时间",
			    sortable:true,
			    resizable:true,
			    dataIndex:"合同结束时间",
			    renderer: Ext.Hudongsoft.util.Format.yearMonthDayRenderer_2,
			    width:100
		    },
		    {
			    header:self.jfgl?"缴费状态":"录入状态",
			    sortable:true,
			    resizable:true,
			    dataIndex:self.jfgl?"缴费状态":"录入状态",
			    width:100
		    },
		    {
			    header:"录入月份",
			    sortable:true,
			    resizable:true,
			    dataIndex:"录入月份",
			    width:70
		    }
	    ];
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
	    
	    // 搜索变量
	    var mc = new Ext.form.TextField({width:80});
	    var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({lx_store: gyy_lx.store});
	    var hm = new Ext.form.TextField({width:80});
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
	    this.tbar=new Ext.Toolbar({		
	        enableOverflow: true,    
		    items: ['名称：',
			mc,'  ',
			'工业园：',
            gyy,'  ',
            '类型：',
            gyy_lx,'  ',
			'号码：',
			hm,'  ',
			'年：',nian,'  ',
			'月：',yue,'  ',
            {
				text:"搜索",
				iconCls: 'icon-query',
				handler: function () {
	                self.store.baseParams = {
			            mc: mc.getValue(),
                        gyy: gyy.getValue(),
                        gyy_lx: gyy_lx.getValue(),
                        hm: hm.getValue(),
                        nian: nian.getValue(),
                        yue: yue.getValue()         				            
                    };
				    self.store.load({
				        params: {
				            start: 0,limit:20
				        }
				    });
				}
			},'->',
			{
			    text:"查看详情",
			    iconCls: 'icon-list',
			    handler: function () {
			        var r = self.getSelectionModel().getSelected();
				    if (r) {
	                    function printDate(f) {
	                        var data = r.data;
	                        return data[f+'_年'] + '/' + data[f+'_月'] + '/' + data[f+'_日'];
	                    }
				        var html = '合同编号:'+r.data.编码+'客户编号:'+r.data.编码+'客户名称:'+r.data.客户名称+'<br>'+
		                '联系电话'+'联系地址<br>'+
		                '所属工业园'+r.data.所属工业园+'房产类型'+r.data.房产类型+'所属房产'+r.data.所属房产+'<br>'+
		                '合同开始时间'+printDate('合同开始时间')+'合同结束时间'+printDate('合同结束时间');
		    
			            var w = new Ext.Window({
                            title:"录入总表",
                            height: 500,
                            layout: 'border',
                            items:[
                                new Ext.Panel({
                                    region:'north',
                                    html: html
                                }),
                                new Ext.Hudongsoft.lrzbGrid({region:'center',zbdata:r.data})
                            ]
                        });
                        w.show();
				    }
			    }
			}
			
		]});
		
		self.store.baseParams = {
	        nian:now_year,yue:now_month
	    };
		self.store.load({
		    params: {
		        start: 0,limit:20
		    }
		});
		Ext.Hudongsoft.sjlrGrid.superclass.initComponent.call(this);
	}
})

/*
 *	录入总表 (收费总表)
 */
Ext.Hudongsoft.lrzbGrid=Ext.extend(Ext.grid.GridPanel ,{
	zbdata: null,
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_zb',
		fields:[
		    '序号','年份月份','单据编号','客户编号','客户名称','日期年','日期月','总费用','缴费金额','余额','录入状态','缴费状态'
		]
	}),
	width:700,
	height:500,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:60		
		},
		{
			header:"年份月份",
			dataIndex:"年份月份",
			width:100
		},
		{
			header:"总费用",
			dataIndex:"总费用",
			width:80
		},
		{
			header:"缴费金额",
			dataIndex:"缴费金额",
			width:80
		},
		{
			header:"余额",
			dataIndex:"余额",
			width:80
		},
		{
			header:"录入状态",
			dataIndex:"录入状态",
			width:100
		},
		{
			header:"缴费状态",
			dataIndex:"缴费状态",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    console.log(self.zbdata);
		this.tbar=[
		    {
		    text: '查看详情',
		    handler: function () {
		        var r = self.getSelectionModel().getSelected();
		        if (r) {
		            var html = '';
		            var w = new Ext.Window({
                        title:"收款详细列表",
                        height: 500,
                        layout: 'border',
                        items:[
                            new Ext.Panel({
                                region:'north',
                                html: html
                            }),
                            new Ext.Hudongsoft.sksjGrid({region:'center',djbh:r.data.单据编号})
                        ]
                    });
                    w.show();
		        }
		    }
		},{
		    text: '录入',
		    handler: function () {
		    
		    }
		}];
		self.store.load({params:{
            htbh: self.zbdata.编码
		}});
		Ext.Hudongsoft.lrzbGrid.superclass.initComponent.call(this);
	}
})

/*
 *	收款详细列表 (收款收据)
 */
Ext.Hudongsoft.sksjGrid=Ext.extend(Ext.grid.GridPanel ,{
    djbh: null,
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_lb',
		fields:[
		    'id','序号','收费项目','收费类型','上月读数','本月读数','值','倍率','损耗','总量','滞纳金','费用','录入状态'
		]
	}),
	width:700,
	height:400,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:40		
		},
		{
			header:"收费项目",
			dataIndex:"收费项目",
			width:100
		},
		{
			header:"上月读数",
			dataIndex:"上月读数",
			width:60
		},
		{
			header:"本月读数",
			dataIndex:"本月读数",
			width:60
		},
		{
			header:"倍率",
			dataIndex:"倍率",
			width:60
		},
		{
			header:"损耗",
			dataIndex:"损耗",
			width:60
		},
		{
			header:"总量",
			dataIndex:"总量",
			width:60
		},
		{
			header:"值",
			dataIndex:"值",
			width:60
		},
		{
			header:"滞纳金",
			dataIndex:"滞纳金",
			width:60
		},
		{
			header:"费用",
			dataIndex:"费用",
			width:60
		},
		{
			header:"说明",
			dataIndex:"说明",
			width:80
		}
	],
	initComponent: function(){
	    var self = this;
		this.tbar=['->',{
		    text: '打印',
		    handler: function () {		        
		    }
		}];
		self.store.load({params:{
		    djbh: self.djbh
		}});
		Ext.Hudongsoft.sksjGrid.superclass.initComponent.call(this);
	}
})
