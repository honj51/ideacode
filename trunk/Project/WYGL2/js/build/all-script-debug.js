/*!
 * HdAgency JS. Hudongsoft.cn
 */
Ext.namespace('Ext.Hudongsoft');

/************************************************************************/
/* 录入列表                                                             */
/************************************************************************/
Ext.Hudongsoft.sjlrGrid=Ext.extend(Ext.grid.GridPanel ,{	
	jfgl: false,
	dispalyDetails: function() {
	    var self = this;
	    var r = self.getSelectionModel().getSelected();
	    if (r) {
            function printDate(f) {
                var data = r.data;
                return data[f+'_年'] + '/' + data[f+'_月'] + '/' + data[f+'_日'];
            }
            
            var html = '<table class="tab1">'+
                        '<tr style="height:20px;">'+
                            '<td>'+'<strong>'+'合同编号：'+'</strong>'+r.data.编码+'<td>'+
                            '<td>'+'<strong>'+'客户编号：'+'</strong>'+r.data.客户编码+'<td>'+
                            '<td>'+'<strong>'+'客户名称:'+'</strong>'+r.data.客户名称+'<td>'
                        +'</tr>'
                        +'<tr style="height:20px;">'+
                            '<td>'+'<strong>'+'联系电话：'+'</strong>'+r.data.联系电话+'<td>'+
                            '<td>'+'<strong>'+'联系地址：'+'</strong>'+r.data.联系地址+'<td>'
                        +'</tr>'+
                        '<tr style="height:20px;">'+
                            '<td>'+'<strong>'+'所属工业园：'+'</strong>'+r.data.所属工业园+'<td>'+
                            '<td>'+'<strong>'+'房产类型：'+'</strong>'+r.data.房产类型+'<td>'+
                            '<td>'+'<strong>'+'所属房产：'+'</strong>'+r.data.所属房产+'<td>'+
                            '<td>'+'<strong>'+'合同开始时间：'+'</strong>'+printDate('合同开始时间')+'<td>'+
                            '<td>'+'<strong>'+'合同结束时间：'+'</strong>'+printDate('合同结束时间')+'<td>'+
                         '</tr>'
                        +'</table>';
            var panel = new Ext.Panel({
                title: self.jfgl?'缴费总表':'录入总表',                
                layout: 'border',                
                items: [{
                    xtype: 'panel',
                    region:'north',
                    cls: 'side_col',
                    html: html
                },
                new Ext.Hudongsoft.lrzbGrid({region:'center',jfgl: self.jfgl,zbdata:r.data})]
            });
            main_tab.add(panel).show();
	    }
	},
	listeners : { // 添加监听事件
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.dispalyDetails();
	    }
	},
	initComponent: function(){
	    var self = this;
	    self.title = self.jfgl? "缴费管理":"录入管理";
	    self.store = new Ext.data.JsonStore({
	        storeId:self.jfgl?'jiaofei':'luru',
		    url: 'ajax/sfgl/sjlr.aspx?action=list',
            root : 'data',
	        totalProperty : 'totalProperty',
		    fields:[ // id为合同id
		        'id','编码','客户名称','客户编码','联系电话','联系地址','所属工业园','所属房产','房产类型','合同开始时间_年','合同开始时间_月','合同开始时间_日','合同结束时间_年','合同结束时间_月',
		        '合同结束时间_日','合同开始时间','合同结束时间','录入状态','缴费状态','录入月份'
		    ]
	    });
	    
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
			    renderer:self.jfgl?Ext.Hudongsoft.util.Format.jfztRenderer():Ext.Hudongsoft.util.Format.lrztRenderer(),
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
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
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
			        self.dispalyDetails();
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
	jfgl: false,
	store:new Ext.data.JsonStore({
		url: 'ajax/sfgl/sjlr.aspx?action=list_zb',
		fields:[
		    'id','序号','年份月份','单据编号','客户编号','客户名称','日期年','日期月','总费用','缴费金额','余额','录入状态','缴费状态'
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
			renderer: Ext.Hudongsoft.util.Format.lrztRenderer(),
			width:100
		},
		{
			header:"缴费状态",
			dataIndex:"缴费状态",
			renderer: Ext.Hudongsoft.util.Format.jfztRenderer(),
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    var btnXQ = new Ext.Button({
	        text: '查看详情',
	        iconCls: 'icon-list',
	        disabled: true,
		    handler: function () {
		        var r = self.getSelectionModel().getSelected();
		        if (r) {
		            var html = '';
		            var w = new Ext.Window({
                        title:"收款详细列表",
            	        width:815,
                        autoScroll: true,
                        items:[{
                            xtype: 'panel',
                            html:'<iframe src="Print.aspx?djbh='+r.data.单据编号+ '&ny='+r.data.年份月份+'" width=800 height=500 frameborder="0" scrolling="auto"></iframe>'
                         }]
                    });
                    w.show();
		        }
		    }
	    });
	    var btnLR = new Ext.Button({
	        text: self.jfgl?'缴费':'录入',
	        iconCls: 'icon-jiSuan',
	        width:90,
	        disabled: true,
		    handler: function () {	
//		        var r = self.getSelectionModel().getSelected();
//		        if (btnLR.text == "修改录入" && r.data.缴费状态=='已缴费') {
//	                Ext.Msg.alert("提示","该条录入已缴费，更改数据会清除缴费信息，需要重新缴费"); 
//	            }
    
		        // 录入
		        function lr() {
		            if (btnLR.text == "修改录入") {
		                if (permission_xglr == false) {
		                    Ext.Msg.alert("提示","没有权限修改已录入的数据");
		                    return;
		                }
		            }
		        	var r = self.getSelectionModel().getSelected();
				    if (!r) return;
		            var fs = ['编号','消费项目','消费类型','值','倍率','损耗','滞纳金','上月读数','读数','说明','读数输入'];
		            var xf_store = new Ext.data.JsonStore({
		                url: 'ajax/sfgl/sjlr.aspx?action=list_lr&id='+self.zbdata.id +'&xh='+r.data.序号, // id为合同id,	                    
	                    autoLoad: true,
			            fields: fs
		            });         
		            // 网格编辑器
		            var textEditor = new Ext.form.NumberField();
		            var blCombox = new Ext.BLCombox();
		            var vCombox = new Ext.SHCombox();
		            var colModel = new Ext.grid.ColumnModel({
		                columns: [{
		                    header: '编号', dataIndex: '编号', width: 40
		                },{
		                     header: '消费项目', dataIndex: '消费项目', width: 110,css:read_only_css
		                },{
		                    header: '消费类型', dataIndex: '消费类型', width: 70,css:read_only_css
		                },{
			                header: '值', dataIndex: '值', width: 70, css:read_only_css
		                },{
			                header: '倍率', dataIndex: '倍率', width: 70, css:read_only_css
		                },{
			                header: '损耗', dataIndex: '损耗',  width: 70, css:read_only_css
		                },{
			                header: '滞纳金', dataIndex: '滞纳金',  width: 60, css:read_only_css
		                },{
			                header: '上月读数', dataIndex: '上月读数', width: 80,  css:read_only_css
		                },{
			                header: '读数', dataIndex: '读数', editor: textEditor, width: 80
		                },{
			                header: '说明', dataIndex: '说明', width: 110,  css:read_only_css
		                },{
			                header: '读数输入', dataIndex: '读数输入',width: 60,css:read_only_css
		                }],
		                isCellEditable: function(col, row) {
                            var record = xf_store.getAt(row);
                            if (record.get(fs[col]) == '-') { // replace with your condition
                              return false;
                            }
                            return Ext.grid.ColumnModel.prototype.isCellEditable.call(this, col, row);
                        }
		            });		            
		            
				    var grid = new Ext.grid.EditorGridPanel({
			            store: xf_store,
			            colModel: colModel,
			            tbar: ['注意:灰色项为不可编辑项。','->',{
			                text: '提交',
			                width:80,
			                iconCls: 'icon-wanChen',
			                handler: function () {
			                    var data = [];
			                    var validate_pass = true;
			                    xf_store.each(function(record){
			                        var ds = record.data.读数;
			                        if (ds === '') {
			                            validate_pass = false;
			                            return false;
			                        }
			                        data.push(record.data);
			                    });
			                    if (!validate_pass) {
			                        Ext.Msg.alert('录入','请输入读数');
			                        return;
			                    }
			                    Ext.Ajax.request({
			                         url: "ajax/sfgl/sjlr.aspx?action=lr_tj", 
			                         params: {
			                            htid: self.zbdata.id, // 合同id
			                            xh: r.data.序号,
			                            year: r.data.年份月份.split('/')[0],
			                            month: r.data.年份月份.split('/')[1],
			                            data: Ext.encode(data)
			                         },
			                         success: function () {
			                            Ext.Msg.alert('提交','数据提交成功！');
			                            self.store.reload();
			                            win.close();
			                            Ext.StoreMgr.get('luru').reload();
			                         }
			                    });			                    
			                }
			            }  
			            ]
            		});
            		var win = new Ext.Window({
            		    layout: 'fit',
			            height: 500,
			            width: 850,
            		    title: '录入',
            		    items: grid
            		});
            		
            		if (btnLR.text == "修改录入" && r.data.缴费状态=='已缴费'){
            		    Ext.MessageBox.confirm("提示","该条录入已缴费，更改数据会清除缴费信息，需要重新缴费", function(btn){
                            if (btn == 'yes'){
                                win.show();
                            }
                        });
            		}else{
            		    win.show();
            		}  
		        }
	       
		        // 缴费
		        function jf() {
		        	var r = self.getSelectionModel().getSelected();
				    if (!r) return;		            
				    Ext.Ajax.request({
				        url: 'ajax/sfgl/sjlr.aspx?action=list_jf&id='+self.zbdata.id+'&xh='+r.data.序号, // id为合同id
				            success: function(response, opts) {
                                var obj = Ext.decode(response.responseText);
                                var xf_store = new Ext.data.JsonStore({
                                    url: 'ajax/sfgl/sjlr.aspx?action=list_jf&id='+self.zbdata.id+'&xh='+r.data.序号, // id为合同id
                                    data: obj.data,
                                    fields: ['编号','收费项目','收费类型','值','倍率','损耗','滞纳金','上月读数','读数','费用','说明']
                                });         	            
                                xf_store.on("load",function (store, records) {
                                    
                                })
                                var x = obj.总金额;
                                var sf_textfield = new Ext.form.NumberField({});		            
                                var grid = new Ext.grid.GridPanel({
                                    store: xf_store,
                                    columns: [{
                                        header: '编号', dataIndex: '编号', width: 40
                                    },{
                                         header: '消费项目', dataIndex: '收费项目', width: 110
                                    },{
                                        header: '消费类型', dataIndex: '收费类型', width: 70
                                    },{
                                        header: '值', dataIndex: '值',  width: 70
                                    },{
                                        header: '倍率', dataIndex: '倍率', width: 70
                                    },{
                                        header: '损耗', dataIndex: '损耗', width: 70
                                    },{
                                        header: '滞纳金', dataIndex: '滞纳金', width: 70
                                    },{
                                        header: '上月读数', dataIndex: '上月读数',  width: 70
                                    },{
                                        header: '读数', dataIndex: '读数',  width: 80
                                    },{
                                        header: '费用', dataIndex: '费用',width: 60
                                    },{
                                        header: '说明', dataIndex: '说明',  width: 110
                                    }],
                                    tbar: {
                                        items: ['']
                                    },
                                    bbar: {
                                        items: ['总金额：￥&nbsp;',''+obj.总金额,'上次结余：￥',''+obj.上次结余,'&nbsp;&nbsp;&nbsp;需要交费金额：￥',''+obj.需要交费金额,'实收金额：&nbsp',sf_textfield]
                                    },
                                    buttons: [{
                                        text: '提交',
                                        iconCls: 'icon-wanChen',
                                        handler: function () {			                    
                                            Ext.Ajax.request({
                                                 url: "ajax/sfgl/sjlr.aspx?action=jf_tj", 
                                                 params: {
                                                    zbid: r.data.id,
                                                    缴费金额: sf_textfield.getValue(),
                                                    总费用: obj.总金额,
                                                    上次余额: obj.上次结余
                                                 },
                                                 success: function (response, opts) {
                                                    var obj = Ext.decode(response.responseText);
                                                    if (obj.success) {
                                                        Ext.Msg.alert('提交','缴费成功！');
                                                        self.store.reload();
                                                        win.close();
                                                        Ext.StoreMgr.get('jiaofei').reload();
                                                    }
                                                    else {
                                                        Ext.Msg.alert('提交失败', obj.errorMessage);                                                        
                                                    }
                                                 }
                                            });			                    
                                        }
                                    }  
                                    ]
                                });
                                var win = new Ext.Window({
                                    layout: 'fit',
                                    height: 500,
                                    width: 850,
                                    title: '缴费',
                                    items: grid
                                });
                                win.show();
                            }
				    });
		        }
		        
		        if (self.jfgl) {
		            jf();
		        }
		        else
		            lr();
		    }// handler
	    });
	    self.getSelectionModel().on('rowselect', function(sm, rowIdx, r) {
	        btnLR.setDisabled(true);
	        btnXQ.setDisabled(true);
	        if (self.jfgl) { //缴费	            
	            if (r.data.缴费状态=='已缴费') btnXQ.setDisabled(false);
	            if (r.data.缴费状态=='未缴费' && r.data.录入状态=='已录入') btnLR.setDisabled(false);
	        }	        
	        else // 录入
	        {	       
	            btnLR.setText('录入');     
	            if ((r.data.录入状态=='已录入') && (r.data.缴费状态!='不要交费')) {
	                btnXQ.setDisabled(false);
	                btnLR.setDisabled(false);
	                btnLR.setText('修改录入');
                }
	            if (r.data.录入状态=='未录入') btnLR.setDisabled(false);
	        }	            
	    });
		this.tbar=['->',btnXQ,btnLR];
		
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
Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.glylbGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"管理员列表",
	store:new Ext.data.JsonStore({
		url: 'ajax/xtgl/glylb.aspx?action=list',
		fields:[
		    'id','admin_id','admin_pwd','admin_name','admin_limit','tel','qq','email'
		]
	}),
	width:814,
	height:450,
	columns:[
		{
			header:"编号",
			dataIndex:"id",
			width:100
		},
		{
			header:"管理员帐号",
			dataIndex:"admin_id",
			width:100
		},
		{
			header:"名称",
			dataIndex:"admin_name",
			width:100
		},
		{
			header:"角色",
			dataIndex:"admin_limit",
			width:100
		}
	],
	
	listeners : { // 添加监听事件
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	
	showDetailWindow: function (add, data) {    // 显示详细窗体: add: 是否是新增数据, data: 数据参数
        var self = this;
        var password1 = new Ext.form.TextField({ 
            fieldLabel: '密码',
            name: 'admin_pwd',
            width:226,
            inputType: 'password',
            allowBlank:false 	   
        });
        
        var password2 = new Ext.form.TextField({ 
            fieldLabel: '确认密码',
            name: 'admin_pwd2',
            width:226,
            allowBlank:false,
            inputType: 'password'	   
        });
        
        var js = new Ext.form.ComboBox({
            fieldLabel:'角色',
            width:226,
            name:'admin_limit',
            triggerAction:'all',
            editable:false,
            store: new Ext.data.JsonStore({
                autoLoad:true,
	            url: "ajax/xtgl/glylb.aspx?action=glygl_js",
	            fields: ['js']
            }),            
            valueField:'js',
            displayField:'js'  
        });
        
        var form = new Ext.FormPanel({
	        padding:10,
	        items:[
	            {
	                xtype: 'textfield',
                    name: 'id',
                    hidden: true,
                    hideLabel:true
	            },
                {
                    fieldLabel: '帐号',
                    name: 'admin_id',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '名称',
                    name: 'admin_name',
                    width:226,
                    xtype: 'textfield'				                           
                },
                password1,
                password2,
                js,
                {
                    fieldLabel: '电话',
                    name: 'tel',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: 'qq',
                    name: 'qq',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '邮箱',
                    name: 'email',
                    width:226,
                    vtype:'email',  
                    xtype: 'textfield'				                           
                }              
	        ],
	        buttons:[
	            {
	                text:'保存',// callback
	                iconCls: 'icon-save',
	                handler:function (c) {	
	                    if (password1.getValue() != password2.getValue()) {
	                         Ext.Msg.alert("提示","两次密码输入不一致,请重新输入！");
	                         return;
	                    };	                
	                     form.getForm().submit({
	                        url:'ajax/xtgl/glylb.aspx',
	                        params:{
	                            action: add?'add':'update'
	                        },
	                        success:function (form, action) {
	                            w.close();
                                self.store.load();                                
                                Ext.Msg.alert("管理员管理","数据保存成功!");
	                        }
	                    });
	                }
	            },
	            {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function (c) {
                        w.close();
                    }
                }
	        ]
        });
    
        if (!add && data) {
            data.admin_pwd2 = data.admin_pwd;
            form.getForm().setValues(data);
        }
        
        var w = new Ext.Window({
            title:add?"添加管理员":'修改管理员',
	        width:400,
            items:[
                form
            ]
        });
        w.show();
    },
	
	initComponent: function(){
	    var self = this;
		this.tbar=[
			{
				text:"添加",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
                    
				}
			},
			{
				text:"修改",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				        
				    }				    
				}
			},
			{
				text:"删除",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除管理员','确定要删除选中的管理员吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/xtgl/glylb.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除管理员','管理员删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
				
			}
		];
		self.store.load();		
		Ext.Hudongsoft.glylbGrid.superclass.initComponent.call(this);
	}
});
Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.jsqxGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"角色权限",
     store:new Ext.data.JsonStore({
		url: 'ajax/xtgl/jsqx.aspx?action=list',
		fields:[
		    'id','role_id','role_name'
		]
	}),
	width:814,
	height:450,
	columns:[{
			header:"编号",
			dataIndex:"role_id",
			width:100
		},
		{
			header:"角色名称",
			dataIndex:"role_name",
			width:300
		}
	],
	listeners : {  // 添加监听事件
        celldblclick: function(grid, rowIndex, columnIndex, e) {
            var r = grid.store.getAt(rowIndex);	
            grid.showDetailWindow(false, r.data);
        }
	},
	showDetailWindow: function (add, data) {    // 显示详细窗体: add: 是否是新增数据, data: 数据参数
	    if (!add && data.role_name=="总管理员") {
	        Ext.Msg.alert("提示","总管理员不能修改！");
		    return;
	    }
        var self = this;
        var form = new Ext.FormPanel({
	        id:'form1',
	        padding:10,
	        items:[
	            {
                    xtype:'hidden',
                    name:'id'    				        
	            },
                {
                    fieldLabel: '角色排列序号',
                    name: 'role_id',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '角色名称',
                    name: 'role_name',
                    width:226,
                    xtype: 'textfield'				                           
                }
                
                  
	        ],
	        buttons:[
	            {
	                text:'保存',// callback
	                iconCls: 'icon-save',
	                handler:function (c) {		
	                    if (add && form.getForm().getValues().role_name == '总管理员') {
	                        Ext.Msg.alert("提示","总管理员不能新增！");
	                        return;
	                    }                
	                     form.getForm().submit({
	                        url:'ajax/xtgl/jsqx.aspx',
	                        params:{
	                            action: add?'add':'update'
	                        },
	                        success:function (form, action) {
	                            w.close();                                
                                self.store.reload();
	                        }
	                    });
	                }
	            },
	            {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function (c) {
                        w.close();
                    }
                }
	        ]
        });
        
            if (!add && data) {
                form.getForm().setValues(data);
            }
            
            var w = new Ext.Window({
                title: add?"添加角色":'修改角色',
    	        width:400,
                items:[
                    form
                ]
            });
            w.show();
    },
    
    setPermissions:function (data) { 
        var form = new Ext.form.FormPanel({
            width:400,
            height:300,
            items:[
                {
                    xtype: 'hidden',
                    name: 'id'
                },
                {
                    xtype: 'hidden',
                    name: 'role_name'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'数据录入',
                    name:'数据录入'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'缴费管理',
                    name:'缴费管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'工业园管理',
                    name:'工业园管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'房产管理',
                    name:'房产管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'客户管理',
                    name:'客户管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'预定管理',
                    name:'预定管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'租赁合同管理',
                    name:'租凭合同管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'合同到期提示',
                    name:'合同到期提示'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'收款分类统计',
                    name:'收款分类统计'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'收款详细统计',
                    name:'收款详细统计'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'角色权限',
                    name:'角色权限'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'管理员管理',
                    name:'管理员管理'
                },
                {
                    xtype:'checkbox',
                    boxLabel:'修改本身密码',
                    name:'修改本身密码'
                }     
            ],
            buttons:[
                {
                    text:'保存',// callback
                    iconCls: 'icon-save',
                    handler:function () {
                        form.getForm().submit({
                            url: 'ajax/xtgl/jsqx.aspx',
                            params: {
                                action:'updatePermissions'
                            },
                            success: function (form, action) {                                                               
                                wins.close();
                            }
                        })
                    }
                },
                {
                    text:'取消',
                    iconCls:'icon-cancel',
                    handler:function () {
                        wins.close()
                    }
                }
            ]
        });        
        var wins = new Ext.Window({
            title:'修改权限',
            layout:'fit',
            width:500,
            height:400,
            store:self.PermissionsStore,
            items: form
        });
        form.getForm().load({
            url: 'ajax/xtgl/jsqx.aspx?action=set&role_name='+data.role_name,            
            failure: function(form, action) {
                Ext.Msg.alert("Load failed", action.result.errorMessage);
            }
        });
        wins.show();    
    },
	
	initComponent: function(){
	    var self = this;
		this.tbar=[
			{
				text:"添加",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        if (r.data.role_name == "总管理员") {
				            Ext.Msg.alert("提示","总管理员不能删除！");
		                    return;
				        }
				        Ext.Msg.confirm('删除角色','确定要删除选中的角色吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/xtgl/jsqx.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除角色','角色删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			},
			{
				text:"设置权限",
				iconCls: 'icon-sheZhi',
				handler:function () {
				    var per = self.getSelectionModel().getSelected();
				    if (per) {
				        if (per.json.role_name=='总管理员') {
				            Ext.Msg.alert("提示","总管理员拥有最高权限，不能修改！");
				            return;
				        }
				         self.setPermissions(per.data);
				    }			   
				}
			}
		];
		self.store.load();
		Ext.Hudongsoft.jsqxGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xgmmWin=Ext.extend(Ext.Window ,{
    xtype:"window",
	title:"修改密码",
	layout: 'fit',
	width:320,
	height:150,
	initComponent: function(){
	    var self = this;
	    var password1 = new Ext.form.TextField({ 
            fieldLabel: '密码',
            name: 'admin_pwd',
            inputType: 'password',
            allowBlank:false 	   
        });
        
        var password2 = new Ext.form.TextField({ 
            fieldLabel: '确认密码',
            name: 'admin_pwd2',
            allowBlank:false,
            inputType: 'password'	   
        });
        
		var form = new Ext.FormPanel({
		    padding:10,
		    //width:300,
		    items:[
		      password1,password2
		        
		    ],
		    buttons:[
		        {
		            text:'保存',// callback
	                iconCls: 'icon-save',
	                handler:function () {
	                    if (password1.getValue() != password2.getValue()) {
	                         Ext.Msg.alert("提示","两次密码输入不一致,请重新输入！");
	                         return;
	                    };
	                    form.getForm().submit({
	                        url:'ajax/xtgl/glylb.aspx',
	                        params:{
	                            action:'updata_self'
	                        },
	                        success:function () {
	                            self.close();
	                            Ext.Msg.alert("修改密码","密码修改成功");
	                        }
	                    });
	                }
	                
		        },
		        {
		            text:'取消',// callback
	                iconCls: 'icon-cancel',
	                handler: function () {
                        self.close();
                    }
		        }
		    ]
		});
		this.items=[
		    form
		]

		Ext.Hudongsoft.xgmmWin.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.htdqtsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"合同到期列表",
    store : new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/htdqts.aspx?action=list',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','合同开始时间','合同结束时间','增浮期'
		]	
    }),
	width:792,
	height:560,
	viewConfig : {
		getRowClass : function(record, rowIndex, rowParams, store) {
			var zfq = record.data.增浮期;
			if (!zfq) return;
			var num = new Date(zfq).dateDiff('d',new Date());
			if (num>=0) {
				return 'x-grid-record-red';
			}
		}
	},
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:50
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:160
		},
		{
			header:"客户名称",
			sortable:true,
			resizable:true,
			dataIndex:"客户名称",
			width:100
		},
		{
			header:"所属工业园",
			sortable:true,
			resizable:true,
			dataIndex:"所属工业园",
			width:100
		},
		{
			header:"所属房产",
			sortable:true,
			resizable:true,
			dataIndex:"所属房产",
			width:100
		},
		{
			header:"合同开始时间",
			sortable:true,
			resizable:true,
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			dataIndex:"合同开始时间",
			width:100
		},
		{
			header:"合同结束时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同结束时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"合同状态",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100,
			renderer: Ext.Hudongsoft.util.Format.htztRenderer()
		},
		{
		    header:"增浮期提示",
		    sortable:true,
		    resizable:true,
		    dataIndex:"增浮期" ,
		    //value: new Date(),
		    renderer: Ext.Hudongsoft.util.Format.dateRenderer()		    
		}
	],
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
	    
	    var lx_store = new Ext.data.JsonStore({
		    autoLoad:true,
		    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
		    fields: ['lx']
		});
		
		var iFieldName = new Ext.form.TextField({ //搜索栏名称
            emptyText:'请输入客户姓名',
	        width:100
    	   
        });
        
        var iFieldNo = new Ext.form.TextField({ //搜索栏号码
            emptyText:'请输入编号',
	        width:150
    	   
        });
	    
        var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    
        this.tbar=[
		    '->',
			{
				xtype:"label",
				text:"客户名称："
			},
			iFieldName,
			{
				xtype:"label",
				text:"工业园："
			},
			gyy,
			{
				xtype:"label",
				text:"类型："
			},
			gyy_lx,
			{
				xtype:"label",
				text:"号码："
			},
			iFieldNo,
			{
				text:"搜索",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.baseParams = {
				            iFieldName:iFieldName.getValue(),
				            iFieldNo:iFieldNo.getValue(), 
				            gyy:gyy.getValue(),
				            leix:gyy_lx.getValue()
				        };
				    self.store.load({
				        params: {
				            start:0,
		                    limit:20
				        }
				    });			
				}
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.htdqtsGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.zphtglWin=Ext.extend(Ext.Window ,{
	title:"临时开票",
	width:520,
	height:330,
	initComponent: function(){
	    var form = new Ext.FormPanel({
	        padding:10,
	        //width:300,
	        items:[
              {
                xtype: 'textfield',
                fieldLabel: '工业园名称',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '用户姓名',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '月份',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '客户类型',
                name: 'role_id',
                width:226
              },
              {
                xtype: 'textfield',
                fieldLabel: '房产',
                name: 'role_id',
                width:226
              }
    	        
	       ]
	    });
	    this.items=[
	        form
	    ]
		Ext.Hudongsoft.zphtglWin.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.skfltsGrid=Ext.extend(Ext.grid.GridPanel ,{
    xfxtj: false,		
	width:792,
	height:560,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:50
		},
		{
			header:"工业园名称",
			dataIndex:"工业园名称",
			width:100
		},
		{
			header:"房产类型",
			dataIndex:"房产类型",
			width:100
		},
		{
			header:"消费项目",
			dataIndex:"消费项目",
			width:100
		},
		{
			header:"月份",
			dataIndex:"月份",
			width:100
		},
		{
			header:"费用",
			dataIndex:"费用",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    self.title = self.xfxtj?"收款详细统计":"收款分类统计";
        var xfxm = new Ext.sfxmCombox({hidden: !self.xfxtj});
        var gyy_lx = new Ext.GyyLxCombox({value:'厂房'}); //{nextCombox: xfxm}
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
//        var sf = new Ext.sfxmCombox();
		this.tbar=[
			{
				xtype:"label",
				text:"工业园名称："
			},
		    gyy,
			{
				xtype:"label",
				text:"房产类型："
			},
			gyy_lx,
			
			{
				xtype:"label",
				text:"消费项目",
				hidden: !self.xfxtj
			},
			xfxm,
			{
				xtype:"label",
				text:"年："
			},
			nian,
			{
				xtype:"label",
				text:"月："
			},
			yue,
			{
				text:"搜索",
				iconCls: 'icon-query',
			    handler:function () {
				    self.store.load({
				        params:{
				            xfxtj: self.xfxtj,
				            gyy: gyy.getValue(),
				            gyy_lx:gyy_lx.getValue(),
				            xfxm:xfxm.getValue(),
				            nian:nian.getValue(),
				            yue:yue.getValue()
				        }
				    });
				}
			},
			'->',
			{
			    text:"打印",
			    iconCls:'icon-batch_print',
			    handler:function () {
			        window.open("Print2.aspx?gyy="+ escape(gyy.getValue()) +'&gyy_lx=' + escape(gyy_lx.getValue()) +'&xfxm='+ escape(xfxm.getValue()) +'&nian='+nian.getValue()+'&yue='+yue.getValue()+'&xfxtj='+self.xfxtj);
			    }
			}			
		];
		self.store = new Ext.data.JsonStore({
            totalProperty : 'totalProperty',
            url: 'ajax/zlgl/tj.aspx?action=fltj',
		    fields:[
		        '序号','工业园名称','房产类型','消费项目','月份','费用'
		    ]	
        });
		self.store.load({
		    params:{
		        xfxtj: self.xfxtj,
		        gyy_lx: '厂房',
		        nian:nian.getValue(),
			    yue:yue.getValue()
		    }
		});
		Ext.Hudongsoft.skfltsGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.fltjGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"分类统计",
    store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=fltj',
		fields:[
		    '序号','工业园名称','房产类型','消费项目','月份','费用'
		]	
    }),
	width:792,
	height:560,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:100
		},
		{
			header:"工业园名称",
			dataIndex:"工业园名称",
			width:100
		},
		{
			header:"房产类型",
			dataIndex:"房产类型",
			width:100
		},
		{
			header:"消费项目",
			dataIndex:"消费项目",
			width:100
		},
		{
			header:"月份",
			dataIndex:"月份",
			width:100
		},
		{
			header:"费用",
			dataIndex:"费用",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
		    '->',
			{
				xtype:"label",
				text:"名称："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"工业园："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"类型："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"号码："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:70
			},
			{
				text:"搜索",
				iconCls: 'icon-query'
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.fltjGrid.superclass.initComponent.call(this);
	}
});

Ext.Hudongsoft.xxtjGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"分类统计",
    store : new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=xxtj',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','合同开始时间','合同结束时间'
		]	
    }),
	width:792,
	height:560,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:100
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:100
		},
		{
			header:"客户名称",
			sortable:true,
			resizable:true,
			dataIndex:"客户名称",
			width:100
		},
		{
			header:"所属工业园",
			sortable:true,
			resizable:true,
			dataIndex:"所属工业园",
			width:100
		},
		{
			header:"所属房产",
			sortable:true,
			resizable:true,
			dataIndex:"所属房产",
			width:100
		},
		{
			header:"合同开始时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同开始时间",
			width:100
		},
		{
			header:"合同结束时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同结束时间",
			width:100,
			format:"m/d/Y"
		},
		{
			header:"合同状态",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		}
	],
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
		    '->',
			{
				xtype:"label",
				text:"名称："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"工业园："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"类型："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"号码："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签",
				width:70
			},
			{
				text:"搜索",
				iconCls: 'icon-query'
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.xxtjGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.xxfytjlbGrid=Ext.extend(Ext.grid.GridPanel ,{
    title:"详细费用统计列表",
	store : new Ext.data.JsonStore({
        //root : 'data',
		totalProperty : 'totalProperty',
        url: 'ajax/zlgl/tj.aspx?action=xxtj',
		fields:[
		    '序号','编码','客户名称','所属工业园','所属房产','合同开始时间','合同结束时间','月份','费用'
		]	
    }),
	width:843,
	height:560,
	columns:[
		{
			header:"序号",
			dataIndex:"序号",
			width:50
		},
		{
			header:"编码",
			dataIndex:"编码",
			width:160
		},
		{
			header:"客户名称",
			dataIndex:"客户名称",
			width:80
		},
		{
			header:"所属工业园",
			dataIndex:"所属工业园",
			width:100
		},
		{
			header:"所属房产",
			dataIndex:"所属房产",
			width:100
		},
		{
			header:"合同开始时间",
			dataIndex:"合同开始时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"合同结束时间",
			dataIndex:"合同结束时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"消费项目",
			dataIndex:"消费项目",
			width:100
		},
		{
			header:"月份",
			dataIndex:"月份",
			width:50
		},
		{
			header:"费用",
			dataIndex:"费用",
			width:100,
			format:"0,000.00"
		}
	],
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
	    
	    var iField = new Ext.form.TextField({ //搜索栏
            emptyText:'请输入姓名',
	        width:80
    	   
        });

        var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});
	    var nian = new Ext.YearCombox();
	    var yue = new Ext.MonthCombox();
		this.tbar=[
			"名称：",
			iField,
			{
				xtype:"label",
				text:"工业园："
			},
			gyy,
			{
				xtype:"label",
				text:"房产类型："
			},
			gyy_lx,
			{
				xtype:"label",
				text:"日期："
			},
			nian,
			yue,
			{
				text:"搜索",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.baseParams = {
			            gyy: gyy.getValue(),
			            gyy_lx:gyy_lx.getValue(),
			            iField:iField.getValue(),
			            nian:nian.getValue(),
			            yue:yue.getValue()
				    };
				    self.store.load({
				        params: {
				            start:0,
		                    limit:20
				        }
				    });	
				}
			}
		];
		self.store.load({
		    params:{
		        nian:nian.getValue(),
			    yue:yue.getValue(),
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.xxfytjlbGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.ydglGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"预定管理",
	store:new Ext.data.JsonStore({
	    root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zlgl/ydgl.aspx?action=list',
		fields:[
		    'id','编码','客户名称','所属工业园','所属房产','合同开始时间','操作时间','备注'
		]
	
	}),	
	width:792,
	height:560,
	columns:[
		{
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:50
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:160
		},
		{
			header:"预定客户名称",
			sortable:true,
			resizable:true,
			dataIndex:"客户名称",
			width:100
		},
		{
			header:"所属工业园",
			sortable:true,
			resizable:true,
			dataIndex:"所属工业园",
			width:100
		},
		{
			header:"所属房产",
			sortable:true,
			resizable:true,
			dataIndex:"所属房产",
			width:100
		},
		{
			header:"预定时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同开始时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"操作时间",
			sortable:true,
			resizable:true,
			dataIndex:"操作时间",
			width:150,
			renderer: Ext.Hudongsoft.util.Format.dateTimeRenderer()
		}
	],
	
	listeners : {
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	
	showDetailWindow: function (add, data) {    // 显示详细窗体: add: 是否是新增数据, data: 数据参数
	    var self = this;
	    var gyy_lx = new Ext.LinkCombox({
            width:226,
            store: new Ext.data.JsonStore({
                url: "ajax/zlgl/zphtgl.aspx?action=gyy_fc_lb",
	            fields: ['fc']
            }),
	        displayField: 'fc',
	        valueField: 'fc',
	        keyField: ['gyy'],
	        initComponent: function(){	    
	            Ext.LinkCombox.superclass.initComponent.call(this);	    
	        },
            fieldLabel:'所属房产类型',
            name:'所属房产'
        });
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx,width:226,fieldLabel:'所属工业园',name:'所属工业园'});	    
	    var kehu = new Ext.KehuCombox({
	        width:226,            
            name:'客户名称',
            fieldLabel:'预定客户名称'
	    });	    	    
        
	    var form = new Ext.FormPanel({
		    padding:10,
		    items:[
		        {
                    xtype:'hidden',
                    name:'id'    				        
		        },
		        {
                    fieldLabel: '编码',
                    name: '编码',
                    width:226,
                    readOnly: true, 
                    value: '自动产生',  
                    xtype: 'textfield'				                           
                },
                kehu,
                gyy,
                gyy_lx,
                {
                    fieldLabel: '预定时间',
                    name: '合同开始时间',
                    width:226,
                    xtype: 'datefield',
                    format:'Y-m-d'				                           
                },
                {
                    fieldLabel: '操作时间',
                    name: '操作时间',
                    width:226,
                    readOnly: true,
                    format: 'Y-m-d H:i:s',
                    xtype: 'datefield',
                    value: new Date()		                           
                },
                {
                    fieldLabel: '备注',
                    name: '备注',
                    width:226,
                    height:63,
                    xtype: 'textarea'				                           
                }
                
                  
		    ],
		    buttons:[
		        {
		            text:'保存',// callback
		            iconCls: 'icon-save',
		            handler:function (c) {		                
		                 form.getForm().submit({
		                    url:'ajax/zlgl/ydgl.aspx',
		                    params:{
		                        action: add?'add':'update'
		                    },
		                    success:function (form, action) {
		                        w.close();                                
                                self.store.reload();
		                    }
		                });
		            }
		        },
		        {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function (c) {
                        w.close();
                    }
                }
		    ]
	    }); 
	    
	    if (!add && data) {
            form.getForm().setValues(data);
        }
        
	    var w = new Ext.Window({
	        title:add?"新增预定":"修改预定",
		    width:400,
	        items:[
	            form
	        ]
	    });
	    w.show();
	},  
	
	
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
			{
				text:"新增",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除房产','确定要删除选中房产吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zlgl/ydgl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除房产','房产删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			},'->',
			{				
				text:"转为正式合同",
				iconCls: 'icon-jobSum',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('转为正式合同','确定要转为正式合同吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zlgl/ydgl.aspx?action=change',
									success:function(){
										Ext.Msg.alert('转为正式合同','转为正式合同成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }
				}
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.ydglGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.MyGrid=Ext.extend(Ext.grid.GridPanel ,{
xtype:"grid",
	title:"总费用统计列表",
	store:{
		xtype:"jsonstore",
		
	},
	width:792,
	height:560,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"data1",
			width:40
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"data2",
			width:100
		},
		{
			header:"客户名称",
			sortable:true,
			resizable:true,
			dataIndex:"data3",
			width:100
		},
		{
			header:"所属工业园",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		},
		{
			header:"所属房产",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100,
			format:"m/d/Y"
		},
		{
			header:"合同开始时间",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		},
		{
			header:"合同结束时间",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100
		},
		{
			header:"月份",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:70,
			format:"m/d/Y"
		},
		{
			header:"费用",
			sortable:true,
			resizable:true,
			dataIndex:"",
			width:100,
			format:"0,000.00"
		}
	],
	initComponent: function(){
		this.tbar=[
			{
				xtype:"label",
				text:"名称："
			},
			{
				xtype:"textfield",
				fieldLabel:"标签"
			},
			{
				xtype:"label",
				text:"工业园："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"类型："
			},
			{
				xtype:"combo",
				triggerAction:"all",
				fieldLabel:"标签",
				width:70
			},
			{
				xtype:"label",
				text:"日期："
			},
			{
				xtype:"datefield",
				fieldLabel:"标签"
			},
			{
				text:"搜索"
			}
		]
		Ext.MyGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft')

Ext.Hudongsoft.zphtglGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"合同列表",
	store:new Ext.data.JsonStore({
		url: 'ajax/zlgl/zphtgl.aspx?action=list',
		root : 'data',
		totalProperty : 'totalProperty',
		fields:[
		    'id','编码','客户名称','所属工业园','房产类型','所属房产','合同开始时间','合同结束时间','增浮期','合同状态','操作时间','备注','客户编码'
		]	
	}),
	width:792,
	height:560,
	viewConfig : {
		getRowClass : function(record, rowIndex, rowParams, store) {
			var zfq = record.data.增浮期;
			if (!zfq) return;
			var num = new Date(zfq).dateDiff('d',new Date());
			if (num>=0) {
				return 'x-grid-record-red';
			}
		}
	},
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:50
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:160
		},
		{
			header:"客户名称",
			sortable:true,
			resizable:true,
			dataIndex:"客户名称",
			width:100
		},
		{
			header:"所属工业园",
			sortable:true,
			resizable:true,
			dataIndex:"所属工业园",
			width:100
		},
		{
			header:"所属房产",
			sortable:true,
			resizable:true,
			dataIndex:"所属房产",
			width:100
		},
		{
			header:"合同开始时间",
			sortable:true,
			resizable:true,
			dataIndex:"合同开始时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"合同结束时间",
			dataIndex:"合同结束时间",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100
		},
		{
			header:"增浮期",
			dataIndex:"增浮期",
			renderer: Ext.Hudongsoft.util.Format.dateRenderer(),
			width:100		
		},
		{
			header:"合同状态",
			sortable:true,
			resizable:true,
			dataIndex:"合同状态",
			width:100,
			renderer: Ext.Hudongsoft.util.Format.htztRenderer()
		}
	],
	
	listeners : {
   	    celldblclick: function(grid, rowIndex, columnIndex, e) {
        var r = grid.store.getAt(rowIndex);	
        grid.showDetailWindow(false, r.data);
	    }
	
	},
	
	showDetailWindow: function (add, data) { // 显示详细窗体: add: 是否是新增数据, data: 数据参数
	    var self = this;
        var gyy_lx = new Ext.LinkCombox({
            width:226,
            append: false,
            store: new Ext.data.JsonStore({
                url: "ajax/zlgl/zphtgl.aspx?action=gyy_fc_lb",
	            fields: ['fc']
            }),
	        displayField: 'fc',
	        valueField: 'fc',
	        keyField: ['gyy'],
	        initComponent: function(){	    
	            Ext.LinkCombox.superclass.initComponent.call(this);	    
	        },
            fieldLabel:'所属房产',
            name:'所属房产'
        });
	    var gyy = new Ext.GyyCombox({
	        append: false,
	        nextCombox: gyy_lx,
	        width:226,
	        fieldLabel:'所属工业园',
	        name:'所属工业园'
	    });	    
	    var kehu = new Ext.KehuCombox({
	        width:226,            
            name:'客户名称',
            fieldLabel:'客户名称'
	    });
	    var form = new Ext.FormPanel({	
            padding: 10,
            items: [{
                xtype: 'hidden',
                name: 'id'
            },
            {
                fieldLabel: '编码',
                name: '编码',
                width:226,
                readOnly: true, 
                value: '自动产生',                
                xtype: 'textfield'				                           
            },kehu,
            gyy,gyy_lx,
            {
                fieldLabel: '合同开始时间',
                name: '合同开始时间',
                width:226,
                allowBlank:false,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()				                           
            },
            {
                fieldLabel: '合同结束时间',
                name: '合同结束时间',
                width:226,
                allowBlank:false,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()					                           
            },
            {
                fieldLabel: '增浮期',
                name: '增浮期',
                width:226,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()
            },            
            {
                fieldLabel: '操作时间',
                name: '操作时间',
                width:226,
                readOnly: true,
                format: 'Y-m-d H:i:s',
                xtype: 'datefield',
                value: new Date()					                           
            },
            {
                fieldLabel: '备注',
                name: '备注',
                width:226,
                height:63,
                xtype: 'textarea'		
            }
           
            ],
            buttons: [{
                text: '保存',
                iconCls: 'icon-save',
                handler: function (c) {                                
                    form.getForm().submit({
                        url: 'ajax/zlgl/zphtgl.aspx',
                        params: {
                            action: add?'add':'update'
                        },
                        success: function (form, action) {  
                            w.close();
                            self.store.reload();
                        }
                    });
                }
            },{
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function (c) {
                    w.close();
                }
            }]
        });
        if (!add && data) {
            form.getForm().setValues(data);
        }
        
	    var w = new Ext.Window({
	        title: add?"新增合同":"修改合同",				        
            width:390,
	        items:[
	            form
	        ]
	    });
	    w.show();
	    
	},
	
	initComponent: function(){    
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
	    
	    var lx_store = new Ext.data.JsonStore({
		    autoLoad:true,
		    url: "ajax/zlgl/zphtgl.aspx?action=find_gyy_fclx",
		    fields: ['lx']
		});
		
		var iFieldName = new Ext.form.TextField({ //搜索栏名称
            emptyText:'请输入客户姓名',
	        width:100
    	   
        });
        
        var iFieldNo = new Ext.form.TextField({ //搜索栏号码
            emptyText:'请输入编号',
	        width:150
    	   
        });
        
        var gyy_lx = new Ext.GyyLxCombox();
	    var gyy = new Ext.GyyCombox({nextCombox: gyy_lx});        
		this.tbar=[		    
			{
				text:"新增合同",
				iconCls: 'icon-group-create',
				handler: function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改合同",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除合同",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除合同','确定要删除选中合同吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zlgl/zphtgl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除合同','合同删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			},
			{
				text:"编辑固定消费项目",
				iconCls: 'icon-xieGenJin',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (!r) return;			    
		            var fs = ['id','编号','消费项目','消费类型','值','倍率','损耗','滞纳金','前期读数','说明','读数导入','项目导入','合同编号'];
		            var xf_store = new Ext.data.JsonStore({
		                url: 'ajax/zlgl/zphtgl.aspx?action=edit_gdxfx&id='+r.data.id,
	                    root : 'data',
	                    autoLoad: true,
			            fields: fs
		            });         
		            // 网格编辑器
		            var textEditor = new Ext.form.TextField();
		            var blCombox = new Ext.BLCombox();
		            var vCombox = new Ext.SHCombox();
		            var colModel = new Ext.grid.ColumnModel({
		                columns: [{
		                    header: '编号', dataIndex: '编号', width: 40
		                },{
		                     header: '消费项目', dataIndex: '消费项目', width: 120,css:read_only_css
		                },{
		                    header: '消费类型', dataIndex: '消费类型', width: 80,css:read_only_css
		                },{
			                header: '值', dataIndex: '值', editor: textEditor, width: 70, renderer: valueRenderer
		                },{
			                header: '倍率', dataIndex: '倍率', editor: blCombox, width: 70, renderer: valueRenderer
		                },{
			                header: '损耗', dataIndex: '损耗', editor: vCombox, width: 70, renderer: percentRenderer
		                },{
			                header: '滞纳金', dataIndex: '滞纳金', editor: vCombox, width: 70, renderer: percentRenderer
		                },{
			                header: '前期读数', dataIndex: '前期读数', editor: textEditor, width: 80, renderer: valueRenderer
		                },{
			                header: '说明', dataIndex: '说明', editor: textEditor, width: 120
		                },{
			                header: '读数导入', dataIndex: '读数导入',width: 60,css:read_only_css
		                },{
			                header: '项目导入', dataIndex: '项目导入',width: 60,css:read_only_css
		                }],
		                isCellEditable: function(col, row) {
                            var record = xf_store.getAt(row);
                            if (record.get(fs[col]) == '-') { // replace with your condition
                              return false;
                            }
                            return Ext.grid.ColumnModel.prototype.isCellEditable.call(this, col, row);
                        }
		            });
	            
		            
				    var grid = new Ext.grid.EditorGridPanel({
			            store: xf_store,
			            id: 'xxxxxxxx',
			            colModel: colModel,
			            tbar: ['注意:灰色项为不可编辑项。',
			                {
			                    text:'新增消费项',
			                    iconCls: 'icon-group-create',
			                    handler:function(){			                     
	                                var r = self.getSelectionModel().getSelected();
//	                                addxfx(null,xf_store,r);
                                    addxfx(null,xf_store,r,function (values) {
                                        values["编号"] = xf_store.getCount()+1;
                                        var r = new Ext.data.Record(values);
                                        xf_store.add(r);
                                    });
                                    
			                    }
			                },
			                {
			                    text:'删除消费项',
			                    iconCls: 'icon-group-delete',
			                    handler:function () {
			                        var r = grid.getSelectionModel().getSelectedCell();
			                        if(r) {
			                            Ext.Msg.confirm('删除消费项','确定要删除选中的消费项吗？',function(btn){
			                                if(btn == 'yes') {
			                                    grid.store.removeAt(r[0]);
			                                }
			                            });
			                        
//			                            var id = grid.store.getAt(r[0]).data.id;
//			                            Ext.Msg.confirm('删除消费项','确定要删除选中的消费项吗？',function(btn){
//							                if(btn == 'yes') {
//								                Ext.Ajax.request({
//									                url:'ajax/zlgl/zphtgl.aspx?action=delete_xfx',
//									                success:function(){
//										                Ext.Msg.alert('删除消费项','消费项删除成功！');
//										                grid.store.reload();
//									                },
//									                params:{id:id}
//								                });
//							                }
//						                });
                                        
			                        }
			                    }
			                },
			                 '->',
			                {
			                    text: '导入到合同',
			                    handler: function () {
			                        var data = [];
			                        xf_store.each(function(record){
			                            data.push(record.data);
			                        });
			                        Ext.Ajax.request({
			                             url: "ajax/zlgl/zphtgl.aspx?action=import_gdxfx", 
			                             params: {
			                                id: r.data.id,
			                                data: Ext.encode(data)
			                             },
			                             success: function () {
			                                Ext.Msg.alert('固定消费项导入','数据导入成功！');
			                                win.close();
			                             }
			                        });			                    
			                    }
			                }  
			            ]
            		});
            		var win = new Ext.Window({
            		    layout: 'fit',
			            height: 500,
			            width: 900,
            		    title: '固定消费项目',
            		    items: grid
            		});
            		win.show();
				}
			},
			'->',
	        iFieldName,
			{
				xtype:"label",
				text:"工业园："
			},
            gyy,
			{
				xtype:"label",
				text:"类型："
			},
            gyy_lx,
            iFieldNo,
			{
				text:"搜索",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.baseParams = {
			            iFieldName:iFieldName.getValue(),
			            iFieldNo:iFieldNo.getValue(), 
			            gyy:gyy.getValue(),
			            leix:gyy_lx.getValue()
				    };
				    self.store.load({
				        params: {
				            start:0,
		                    limit:20
				        }
				    });						
				}
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.zphtglGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');


Ext.Hudongsoft.fcglGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"房产管理",
	store:new Ext.data.JsonStore({
		root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zygl/fcgl.aspx?action=list',
		fields:[
		    'id','工业园名称','房产类型','房号','描述','房型','朝向','房屋结构'
		]
	}),
	width:785,
	height:576,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:100
		},
		{
			header:"工业园名称",
			sortable:true,
			resizable:true,
			dataIndex:"工业园名称",
			width:100
		},
		{
			header:"房产类型",
			sortable:true,
			resizable:true,
			dataIndex:"房产类型",
			width:100
		},
		{
			header:"房号",
			sortable:true,
			resizable:true,
			dataIndex:"房号",
			width:100
		}
	],
	
	listeners : {
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	showDetailWindow: function (add, data) {    // 显示详细窗体: add: 是否是新增数据, data: 数据参数
	    var self = this;
	    //实例化combox组件

        var gyy_lx = new Ext.GyyLxCombox({
            width:130,
	        emptyText:'请选择',
	        fieldLabel:'类型',
	        name:'房产类型'
        });
	    var gyy = new Ext.GyyCombox({
	        nextCombox: gyy_lx,
	        width:130,
	        emptyText:'请选择',
	        fieldLabel:'工业园',
	        name:'工业园名称'
	    });
	    
	    var form = new Ext.FormPanel({
		    id:'form1',
		    padding:10,
		    items:[
		        {
                    xtype:'hidden',
                    name:'id'    				        
		        },
		        {
                    fieldLabel: '房号',
                    name: '房号',
                    xtype: 'textfield'				                           
                },
                gyy,
                gyy_lx,
                {
                    fieldLabel: '描述',
                    name: '描述',
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '房型',
                    name: '房型',
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '朝向',
                    name: '朝向',
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '房屋结构',
                    name: '房屋结构',
                    xtype: 'textfield'				                           
                }
                
                  
		    ],
		    buttons:[
		        {
		            text:'保存',// callback
		            iconCls: 'icon-save',
		            handler:function (c) {		                
		                 form.getForm().submit({
		                    url:'ajax/zygl/fcgl.aspx',
		                    params:{
		                        action: add?'add':'update'
		                    },
		                    success:function (form, action) {
		                        w.close();                                
                                self.store.reload();
		                    }
		                });
		            }
		        },
		        {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function (c) {
                        w.close();
                    }
                }
		    ]
	    });
        
        if (!add && data) {
            form.getForm().setValues(data);
        }
        
	    var w = new Ext.Window({
	        title:add?"新增房产":"修改房产",
		    width:300,
	        items:[
	            form
	        ]
	    });
	    w.show();
	},
	
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
			{
				text:"新增房产",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
				}
				
			},
			{
				text:"修改房产",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除房产",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除房产','确定要删除选中房产吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zygl/fcgl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除房产','房产删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			}
		];
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});
		Ext.Hudongsoft.fcglGrid.superclass.initComponent.call(this);
	}
});


Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.gslbGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"公司列表",
    store:new Ext.data.JsonStore({
        root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zygl/gslb.aspx?action=list',
		fields:[
		    'id','编码','名称','描述','联系人','联系电话','助记码','注册号','法人代表','办公地址','联系方法','备注','成立日期_年','成立日期_月','成立日期_日'
		]
	}),
	width:792,
	height:560,
	columns:[
	    {
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:100
		},
		{
			header:"编码",
			sortable:true,
			resizable:true,
			dataIndex:"编码",
			width:100
		},
		{
			header:"名称",
			sortable:true,
			resizable:true,
			dataIndex:"名称",
			width:100
		},
		{
			header:"描述",
			sortable:true,
			resizable:true,
			dataIndex:"描述",
			width:100
		},
		{
			header:"联系人",
			sortable:true,
			resizable:true,
			dataIndex:"联系人",
			width:100
		},
		{
			header:"联系电话",
			sortable:true,
			resizable:true,
			dataIndex:"联系电话",
			width:100
		}
	],
	
	listeners : { // 添加监听事件
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	
	showDetailWindow: function (add, data) {    // 显示详细窗体: add: 是否是新增数据, data: 数据参数
    var self = this;
    var form = new Ext.FormPanel({
	    id:'form1',
	    padding:10,	   
	    items:[
	        {
                xtype:'hidden',
                name:'id'    				        
	        },
            {
                fieldLabel: '编码',
                name: '编码',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '名称',
                name: '名称',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '描述',
                name: '描述',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '助记码',
                name: '助记码',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '注册号',
                name: '注册号',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '成立日期',
                name: '成立日期',
                width:226,
                xtype: 'datefield',
                format:'Y-m-d'				                           
            },
            {
                fieldLabel: '法人代表',
                name: '法人代表',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '办公地址',
                name: '办公地址',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系电话',
                name: '联系电话',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系方法',
                name: '联系方法',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '联系人',
                name: '联系人',
                width:226,
                xtype: 'textfield'				                           
            },
            {
                fieldLabel: '备注',
                name: '备注',
                width:226,
                height:60,
                xtype: 'textarea'				                           
            }
            
              
	    ],
	    buttons:[
	        {
	            text:'保存',// callback
	            iconCls: 'icon-save',
	            handler:function (c) {		                
	                 form.getForm().submit({
	                    url:'ajax/zygl/gslb.aspx',
	                    params:{
	                        action: add?'add':'update'
	                    },
	                    success:function (form, action) {
	                        w.close();                                
                            self.store.reload();
	                    }
	                });
	            }
	        },
	        {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function (c) {
                    w.close();
                }
            }
	    ]
    });
    
        if (!add && data) {
            data.成立日期 = new Date(data.成立日期_年,data.成立日期_月-1,data.成立日期_日);
            form.getForm().setValues(data);
        }
        
        var w = new Ext.Window({
            title:add?"新增公司":"修改公司",
             width:400,
            items:[
                form
            ]
        });
        w.show();
    },
	
	initComponent: function(){
	    var self = this;
	    var iField = new Ext.form.TextField({ //搜索栏
            emptyText:'请输入姓名',
	        width:150
        });
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
			{
				text:"新增",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除公司','确定要删除选中的公司吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zygl/gslb.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除公司','公司删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			},
			'->',
			{
				xtype:"label",
				text:"姓名："
			},
			iField,
			{
				text:"搜索",
				iconCls: 'icon-query',
				handler:function () {
				    self.store.load({
				        params:{
				            iField:iField.getValue()
				        }
				    });
				}
			}
		];
	    self.store.load();
		Ext.Hudongsoft.gslbGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.gyyglGrid=Ext.extend(Ext.grid.GridPanel ,{
    xtype:"grid",
	title:"工业园管理列表",
	store:new Ext.data.JsonStore({
		url: 'ajax/zygl/gyygl.aspx?action=list',
		fields:[
		    'id','序号','工业园名称','工业园面积'
		]
	}),
	width:778,
	height:544,
	columns:[
		{
			header:"编号",
			sortable:true,
			resizable:true,
			dataIndex:"序号",
			width:100
		},
		{
			header:"工业园名称",
			sortable:true,
			resizable:true,
			dataIndex:"工业园名称",
			width:100
		},
		{
			header:"工业面积（平方米）",
			sortable:true,
			resizable:true,
			dataIndex:"工业园面积",
			width:120
		}
	],
	listeners : {
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	showDetailWindow: function (add, data) { // 显示详细窗体: add: 是否是新增数据, data: 数据参数
	    var self = this;
        var form = new Ext.FormPanel({	
            padding: 10,            
            items: [{
                xtype: 'hidden',
                name: 'id'
            },{
                fieldLabel: '序号',
                name: '序号',
                allowBlank:false,
                xtype: 'textfield'				                           
            },{
                fieldLabel: '工业园名称',
                name: '工业园名称',
                allowBlank:false,
                xtype: 'textfield'				                           
            },{
                fieldLabel: '工园业面积',
                name: '工业园面积',
                allowBlank:false,
                xtype: 'textfield'				                           
            }],
            buttons: [{
                text: '保存',
                iconCls: 'icon-save',
                handler: function (c) {                                
                    form.getForm().submit({
                        url: 'ajax/zygl/gyygl.aspx',
                        params: {
                            action: add?'add':'update'
                        },
                        success: function (form, action) {  
                            w.close();
                            self.store.reload();
                        }
                    });
                }
            },{
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function (c) {
                    w.close();
                }
            }]
        });
        
        if (!add && data) {
            form.getForm().setValues(data);
        }
        
	    var w = new Ext.Window({
	        title: add?'新增工业园':'修改工业园',	
	        width: 300,			        
	        items:[
	            form
	        ]
	    });
	    w.show();
	},
	
	
	initComponent: function(){
	    var self = this;
	    this.bbar = new Ext.PagingToolbar({
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
		this.tbar=[
			{
				text:"添加工业园",
				iconCls: 'icon-group-create',
				handler: function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改工业园",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			{
				text:"删除工业园",
				iconCls: 'icon-group-delete',
				handler: function () {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        Ext.Msg.confirm('删除工业园','确定要删除选中工业园吗？',function(btn){
							if(btn == 'yes') {
								Ext.Ajax.request({
									url:'ajax/zygl/gyygl.aspx?action=delete',
									success:function(){
										Ext.Msg.alert('删除工业园','工业园删除成功！');
										self.store.reload();
									},
									params:{id: r.get('id')}
								});
							}
						});
				    }				    
				}
			},
			{
				text:"编辑房产类型",
				iconCls: 'icon-xieGenJin',
				handler:function () {
				    var r = self.getSelectionModel().getSelected();
				    if (!r) return;
				    var lxstore = new Ext.data.JsonStore({
                        url: 'ajax/zygl/gyygl.aspx?action=lx_list&find_id='+escape(r.data.工业园名称),
                        fields:[
                            'id','序号','工业园名称','房产类型'
                        ]
	                }); 
	                
	                var lxgird = new Ext.grid.GridPanel({
	                    store:lxstore,
	                    layout:'fit',
	                    columns:[
	                                {
			                            header:"编号",
			                            sortable:true,
			                            resizable:true,
			                            dataIndex:"序号",
			                            width:200
			                           
		                            },
		                            {
			                            header:"房产类型",
			                            sortable:true,
			                            resizable:true,
			                            dataIndex:"房产类型",
			                            width:300
			                            
		                            }
	                            ]
	                            ,
	                            listeners : {
	                                celldblclick: function(grid, rowIndex, columnIndex, e) {
	                                    var d = grid.store.getAt(rowIndex);	
	                                    showLx(false, d.data);
	                                }
	                            }
	                });
	                
	                function showLx(add,data) {
	                    var lxform = new Ext.FormPanel({
	                        padding:10,
	                        items:[
	                            {
	                                xtype: 'hidden',
                                    name: 'id',
                                    value: r.json.id 
	                            },
                                {
                                    xtype: 'hidden',
                                    name: '工业园名称',
                                    value: r.json.工业园名称    
                                },
                                {
                                    fieldLabel:'编号',
                                    name:'序号',
                                    allowBlank:false,
                                    xtype: 'textfield' 
                                },
                                {
                                    fieldLabel:'房产类型',
                                    name:'房产类型',
                                    allowBlank:false,
                                    xtype: 'textfield' 
                                }
                                
                            ],
                            buttons:[
                                {
                                    text: '保存',
                                    iconCls: 'icon-save',
                                    handler:function () {
                                        lxform.getForm().submit({
                                            url: 'ajax/zygl/gyygl.aspx',
                                            params: {
                                                action:add? 'addlx':'updatelx'
                                            },
                                            success: function (form, action) {  
                                                //console.log(action.response.responseText);                                      
                                                lxWin.close();
                                                lxstore.reload();
                                            }
                                        });
                                    } 
                                },
                                {
                                    text: '取消',
                                    iconCls: 'icon-cancel',
                                    handler: function () {
                                        lxWin.close();
                                    }
                                }
                            ]
	                    });
	                    
                        var lxWin = new Ext.Window({
                            title:add?'新增类型':'修改类型',
                            width:300,
                            height:150,
                            layout:'fit',
                            items:[                                     
                                   lxform 
                            ]
                        });
                        
                    if (!add && data) {
                        lxform.getForm().setValues(data);
                    }
                    
                    lxWin.show();
	                }        
	                       
				    var win = new Ext.Window({
				        title:"房产类型列表",
				        width:600,
				        height:400,
				        layout:'fit',
				        tbar:[
				            {
				                text:"新增类型",
				                iconCls: 'icon-group-create',
				                handler:function(){
				                    showLx(true,null);
                                }
				            },
				            {
				                text:"修改类型",
				                iconCls: 'icon-group-update',
				                handler:function () {
				                    var d = lxgird.getSelectionModel().getSelected();
                                    showLx(false,d.data); 
				                    
				                }
				            },
				            {
				                text:"删除类型",
				                iconCls: 'icon-group-delete',
				                handler: function () {
				                    var d = lxgird.getSelectionModel().getSelected();
				                    if (d) {
				                        Ext.Msg.confirm('删除房产类型','确定要删除选中的房产类型吗？',function(btn){
							                if(btn == 'yes') {
								                Ext.Ajax.request({
									                url:'ajax/zygl/gyygl.aspx?action=deletelx',
									                success:function(){
										                Ext.Msg.alert('删除房产类型','房产类型删除成功！');
										                lxstore.reload();
									                },
									                params:{id: d.get('id')}
								                });
							                }
						                });
				                    }				    
				                }
				            },
				            {
				                text:"编辑房产消费列表",
				                iconCls: 'icon-xieGenJin',
				                handler:function () {
				                    var d = lxgird.getSelectionModel().getSelected();
				                    var fcxfStore = new Ext.data.JsonStore({
				                        url: 'ajax/zygl/gyygl.aspx?action=fcxf_list',
		                                fields:[
		                                    'id','序号','工业园名称','房产类型','消费项目','消费类型','值','倍率','损耗','滞纳金','说明'
		                                ],
		                                baseParams:{
		                                    gyyName:d.data.工业园名称,
		                                    fclx:d.data.房产类型
		                                }
				                    });
				                    //console.log(d);
				                    
				                    
				                    var fcxfGird = new Ext.grid.GridPanel({
	                                    store:fcxfStore,
	                                    columns:[
                                            {
	                                            header:"编号",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"序号",
	                                            width:50
        			                           
                                            },
                                            {
	                                            header:"消费项目",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"消费项目",
	                                            width:100
        			                            
                                            },
                                            {
                                                header:"消费类型",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"消费类型",
	                                            width:100
                                            },
                                            {
                                                header:"值",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"值",
	                                            width:100
                                            },
                                            {
                                                header:"倍率",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"倍率",
	                                            width:100
                                            },
                                            {
                                                header:"损耗",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"损耗",
	                                            width:100
                                            },
                                            {
                                                header:"滞纳金",
	                                            sortable:true,
	                                            resizable:true,
	                                            dataIndex:"滞纳金",
	                                            width:100
                                            },
                                            {
                                                header:"说明",
	                                            dataIndex:"说明",
	                                            width:100
                                            }
                                        ]
	                                });
	                                
	                                var fcxfWin = new Ext.Window({
	                                    layout:'fit',
	                                    width:800,
	                                    height:400,
	                                    tbar:[
	                                        {
	                                            text:"新增房产消费",
	                                            iconCls: 'icon-group-create',
	                                            handler:function(){
                                                     addxfx(d,fcxfStore,null);
    
                                                }
	                                        },
	                                        {
	                                            text:"删除房产消费",
	                                            iconCls: 'icon-group-update',
	                                            handler:function () {
	                                                var d = fcxfGird.getSelectionModel().getSelected();
                                                    if (d) {
				                                        Ext.Msg.confirm('删除房产消费','确定要删除选中的房产消费吗？',function(btn){
							                                if(btn == 'yes') {
								                                Ext.Ajax.request({
									                                url:'ajax/zygl/gyygl.aspx?action=delete_fcxf',
									                                success:function(){
										                                Ext.Msg.alert('删除房产消费','房产消费删除成功！');
										                                fcxfStore.reload();
									                                },
									                                params:{id: d.get('id')}
								                                });
							                                }
						                                });
				                                    } 
	                                            }
	                                        }
	                                    ],
				                        items:[
				                            fcxfGird
				                        ]
				                    });
				                    fcxfWin.show();
				                    fcxfStore.load();
				                }
				            }
				        ],
				        items:[
				            lxgird
				        ]
				        
				    });
				    win.show();
				    lxstore.load();
				    
				
				}
			}
		];
		self.store.load();
		Ext.Hudongsoft.gyyglGrid.superclass.initComponent.call(this);
	}
});Ext.namespace('Ext.Hudongsoft');

Ext.Hudongsoft.zrrlbGrid=Ext.extend(Ext.grid.GridPanel ,{
	title:"自然人列表",
		store:new Ext.data.JsonStore({
		root : 'data',
		totalProperty : 'totalProperty',
		url: 'ajax/zygl/zrrlb.aspx?action=list',
		fields:[
		    'id','编码','名称','描述','联系人','联系电话','助记码','性别','证件名称','证件号码','籍贯','联系地址','备注','出生日期_年','出生日期_月','出生日期_日','canDelete'
		]
	}),
	width:792,
	height:560,
	columns:[
		{
			header:"序号",
			sortable:true,
			resizable:true,
			dataIndex:"id",
			width:50
		},
		{
			header:"编码",
			dataIndex:"编码",
			width:160
		},
		{
			header:"名称",
			sortable:true,
			resizable:true,
			dataIndex:"名称",
			width:100
		},
		{
			header:"描述",
			sortable:true,
			resizable:true,
			dataIndex:"描述",
			width:100
		},
		{
			header:"联系人",
			sortable:true,
			resizable:true,
			dataIndex:"联系人",
			width:100
		},
		{
			header:"联系电话",
			sortable:true,
			resizable:true,
			dataIndex:"联系电话",
			width:100
		}
	],
	
	listeners : { // 添加监听事件
	    celldblclick: function(grid, rowIndex, columnIndex, e) {
	        var r = grid.store.getAt(rowIndex);	
	        grid.showDetailWindow(false, r.data);
	    }
	},
	
	showDetailWindow: function (add, data) {    // 显示详细窗体: add: 是否是新增数据, data: 数据参数
        var self = this;
        
        var sex = new Ext.form.ComboBox({
            fieldLabel:'性别',
            width:226,
            mode:'local',
            name:'性别',
            triggerAction:'all',
            editable:false,
            store:new Ext.data.SimpleStore({
                fields : ['myId','displayText'],
                data :[['男','男'],['女','女']]
            }),
            value:'男',
            valueField:'myId',
            displayField:'displayText'
         });
         
        var jiGuan = new Ext.form.ComboBox({
            fieldLabel:'籍贯',
            name:'籍贯',
            width:226,
            mode:'local',
            name:'籍贯',
            triggerAction:'all',
            editable:false,
            store:new Ext.data.SimpleStore({
                fields : ['id','Text'],
                data :[['河北省','河北省'],['山西省','山西省'],['辽宁省','辽宁省'],['吉林省','吉林省'],['黑龙江省','黑龙江省'],['江苏省','江苏省'],['浙江省','浙江省'],['安徽省','安徽省'],['福建省','福建省'],
                        ['江西省','江西省'],['山东省','山东省'],['河南省','河南省'],['湖北省','湖北省'],['湖南省','湖南省'],['广东省','广东省'],['海南省','海南省'],['四川省','四川省'],['贵州省','贵州省'],
                        ['云南省','云南省'],['陕西省','陕西省'],['甘肃省','甘肃省'],['青海省','青海省'],['台湾省','台湾省'],['北京市','北京市'],['天津市','天津市'],['重庆市','重庆市'],['上海市','上海市'],
                        ['香港','香港'],['澳门','澳门'],['内蒙古','内蒙古'],['广西','广西'],['宁夏','宁夏'],['新疆','新疆'],['西藏','西藏']]  
            }),
            emptyText:'请选择',
            valueField:'id',
            displayField:'Text'
         });
        
        var form = new Ext.FormPanel({
	        id:'form1',
	        padding:10,	    
	        items:[
	            {
                    xtype:'hidden',
                    name:'id'    				        
	            },
                {
                    fieldLabel: '编码',
                    name: '编码',
                    width:226,
                    readOnly: true, 
                    value: '自动产生',
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '名称',
                    name: '名称',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '描述',
                    name: '描述',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '助记码',
                    name: '助记码',
                    width:226,
                    xtype: 'textfield'				                           
                },
                sex,
                {
                    fieldLabel: '出生日期',
                    name: '出生日期',
                    width:226,
                    xtype: 'datefield',
                    format:'Y-m-d'				                           
                },
                {
                    fieldLabel: '证件名称',
                    name: '证件名称',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '证件号码',
                    name: '证件号码',
                    width:226,
                    xtype: 'textfield'				                           
                },
                jiGuan,
                {
                    fieldLabel: '联系电话',
                    name: '联系电话',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '联系地址',
                    name: '联系地址',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '联系人',
                    name: '联系人',
                    width:226,
                    xtype: 'textfield'				                           
                },
                {
                    fieldLabel: '备注',
                    name: '备注',
                    width:226,
                    height:63,
                    xtype: 'textarea'				                           
                }
                
                  
	        ],
	        buttons:[
	            {
	                text:'保存',// callback
	                iconCls: 'icon-save',
	                handler:function (c) {		                
	                     form.getForm().submit({
	                        url:'ajax/zygl/zrrlb.aspx',
	                        params:{
	                            action: add?'add':'update'
	                        },
	                        success:function (form, action) {
	                            w.close();                                
                                self.store.reload();
	                        }
	                    });
	                }
	            },
	            {
                    text: '取消',
                    iconCls: 'icon-cancel',
                    handler: function (c) {
                        w.close();
                    }
                }
	        ]
        });
        
            if (!add && data) {
                data.出生日期 = new Date(data.出生日期_年,data.出生日期_月-1,data.出生日期_日);
                form.getForm().setValues(data);
            }
            
            var w = new Ext.Window({
                title:add?"新增自然人":"修改自然人",
                width:400,
                items:[
                    form
                ]
            });
            w.show();
    },
    
    //新增合同
    addhtWindow: function (data) { // 显示详细窗体: add: 是否是新增数据, data: 数据参数
	    var self = this;
        var gyy_lx = new Ext.LinkCombox({
            width:226,
            append: false,
            store: new Ext.data.JsonStore({
                url: "ajax/zlgl/zphtgl.aspx?action=gyy_fc_lb",//过滤已经有的房产号
	            fields: ['fc']
            }),
	        displayField: 'fc',
	        valueField: 'fc',
	        keyField: ['gyy'],
	        initComponent: function(){	    
	            Ext.LinkCombox.superclass.initComponent.call(this);	    
	        },
            fieldLabel:'所属房产',
            name:'所属房产'
        });
	    var gyy = new Ext.GyyCombox({
	        append: false,
	        nextCombox: gyy_lx,
	        width:226,
	        fieldLabel:'所属工业园',
	        name:'所属工业园'
	    });	    
	    var kehu = new Ext.KehuCombox({
	        width:226,        
            name:'客户名称',
            fieldLabel:'客户名称'
	    });
        
	    var form = new Ext.FormPanel({	
            padding: 10,
            items: [{
                xtype: 'hidden',
                name: 'id'
            },
            {
                fieldLabel: '编码',
                name: '编码',
                width:226,
                readOnly: true, 
                value: '自动产生',                
                xtype: 'textfield'				                           
            },kehu,
            gyy,gyy_lx,
            {
                fieldLabel: '合同开始时间',
                name: '合同开始时间',
                width:226,
                allowBlank:false,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()				                           
            },
            {
                fieldLabel: '合同结束时间',
                name: '合同结束时间',
                width:226,
                allowBlank:false,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()					                           
            },
            {
                fieldLabel: '增浮期',
                name: '增浮期',
                width:226,
                format: 'Y-m-d',
                xtype: 'datefield',
                value: new Date()
            },            
            {
                fieldLabel: '操作时间',
                name: '操作时间',
                width:226,
                readOnly: true,
                format: 'Y-m-d H:i:s',
                xtype: 'datefield',
                value: new Date()					                           
            },
            {
                fieldLabel: '备注',
                name: '备注',
                width:226,
                height:63,
                xtype: 'textarea'		
            }
           
            ],
            buttons: [{
                text: '保存',
                iconCls: 'icon-save',
                handler: function (c) {                                
                    form.getForm().submit({
                        url: 'ajax/zlgl/zphtgl.aspx',
                        params: {
                            action:'add'
                        },
                        success: function (form, action) {  
                            win.close();
                        }
                    });
                }
            },{
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function (c) {
                    win.close();
                }
            }]
        });
        
	    var win = new Ext.Window({
	        title:"新增合同",				        
            width:390,
	        items:[
	            form
	        ]
	    });
	    win.show();
	    kehu.setValue(data.名称);

	},
	
	initComponent: function(){
	    var self = this;    
	    var iField = new Ext.form.TextField({ //搜索栏
            emptyText:'请输入姓名',
	        width:150
    	   
        });
        this.bbar = new Ext.PagingToolbar({ //分页控件
	        pageSize: 20,
	        store: self.store,
	        displayInfo: true,
	        plugins: [new Ext.ux.ProgressBarPager()]
	    });
	    var btnDelete = new Ext.Button({
			text:"删除",
			iconCls: 'icon-group-delete',
			handler: function () {
			    var r = self.getSelectionModel().getSelected();
			    if (r) {
			        Ext.Msg.confirm('删除自然人','确定要删除选中的自然人吗？',function(btn){
						if(btn == 'yes') {
							Ext.Ajax.request({
								url:'ajax/zygl/zrrlb.aspx?action=delete',
								success:function(){
									Ext.Msg.alert('删除自然人','自然人删除成功！');
									self.store.reload();
								},
								params:{id: r.get('id')}
							});
						}
					});
			    }				    
			}
		});
		this.tbar=[
			{
				text:"新增",
				iconCls: 'icon-group-create',
				handler:function () {
                    self.showDetailWindow(true, null);
				}
			},
			{
				text:"修改",
				iconCls: 'icon-group-update',
				handler: function() {
				    var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.showDetailWindow(false, r.data);
				    }				    
				}
			},
			btnDelete,
			{
			    text:"添加合同",
			    iconCls: 'icon-group-create',
			    handler:function () {
			        var r = self.getSelectionModel().getSelected();
				    if (r) {
				        self.addhtWindow(r.data); 
				    }
			        
			    }
			},
			'->',
			{
				xtype:"label",
				text:"姓名："
			},
			iField,
			{
				text:"搜索",
				iconCls: 'icon-query',
				handler:function () {
				    //iField:iField.getValue()
				    
				    self.store.load({
				        params:{
				            iField:iField.getValue()
				        }
				    });
				}
			}
		];
		self.getSelectionModel().on('rowselect', function(sm, rowIdx, r) {
		    btnDelete.setDisabled(!r.data.canDelete);
		});
		self.store.load({
		    params:{
		        start:0,
		        limit:20
		    }
		});		
		Ext.Hudongsoft.zrrlbGrid.superclass.initComponent.call(this);
	}
});