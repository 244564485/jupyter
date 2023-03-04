--~ g_MonitorList
--~ g_InfoQuoteList
--~ g_InfoHqList
--~ local g_Param ={};

local g_Monitor ={};
local g_InfoQuote ={};

local g_time;
--[[                                

g_Monitor   -- ĸ�������Ϣ  
{
["Key"] = 1,    --��ر�ʶ
 ["LeftQty"] = 0,
["MarketID"] = "SZA",
["TradeVolume"] = 0,
 ["Account"] = "15396614",
 ["Side"] = "Buy",
 ["Symbol"] = "ƽ������",
 ["Stop"] = 0,
 ["SecurityID"] = "000001",
 ["OrderQty"] = 100,
 ["LastClOrdID"] = "274302218",   --����һ��������ż�¼
 ['EntryTime'] = '23134646546' ,
                               ---  ��������
  
 ["Str"] = "��ص� 000001,ʱ�䷶Χ1422-142300,�µ���� 15��, ���� 100�ɣ�",    --�Զ�������Ϣ�涨
 ["ClOrdID"] = {         --�ӵ�������¼
 [1] = {
 ["index"] = 1,    --������ʾ�����ʶ �����Բ�����
 ["Price"] = 16.48,
 ["UserID"] = "15396614",
 ["OrdType"] = "Limit",
 ["OrderStatus"] = "δ�ɽ�",
 ["ClOrdID"] = "274302218",
 ["CxlQty"] = 0,
 ["TradeVolume"] = 0,
 ["SecurityExchange"] = "SZA",
 ["Side"] = "Buy",
 ["Symbol"] = "ƽ������",
 ["OrderQty"] = 100,
 ["AvgPx"] = 0,
 ["OrderEntryTime"] = "14:22:18",
 ["OrdStatus"] = "δ�ɽ�",
 ["TradeDate"] = "20150413",
 ["StatusMsg"] = "",
 ["SecurityID"] = "000001",}
},

g_InfoQuote   -- ��صĹ�Ʊ��10������
{

 ["70"] = 14.72,                    ��ͣ��       
 ["152"] = 16.51,		            ����
 ["55"] = "ƽ������",				֤ȯ����
 ["34"] = 16.5,                      ����
 ["35"] = 138100,					������
 ["157"] = 6100,					������					
 ["29"] = 54927,					������
 ["10"] = 16.48,					�ּ�
 ["153"] = 12000,					������
 ["69"] = 18,						��ͣ��
 ["28"] = 16.44,					����
 ["154"] = 16.42,					����
 ["25"] = 3200,						��һ��
 ["150"] = 16.43,					����
 ["156"] = 16.52,					����
 ["151"] = 64060,					������				
 ["7"] = 17,						����
 ["6"] = 16.36,						����
 ["155"] = 60300,					����
 ["24"] = 16.46,					��һ
 ["27"] = 161555,					�����
 ["26"] = 16.45,					���
 ["31"] = 147852,					��һ��
 ["30"] = 16.48,					��һ
 ["33"] = 68360,					������
 ["32"] = 16.49,}					����
 ['1']= '1265465465465465465',
 
 
  ["70"] = 16.34,
 ["152"] = 18.21,
 ["55"] = "�ַ�����",
 ["34"] = 18.2,
 ["35"] = 997702,
 ["157"] = 254596,
 ["29"] = 233300,
 ["10"] = 18.18,
 ["153"] = 167162,
 ["69"] = 19.98,
 ["28"] = 18.14,
 ["154"] = 18.12,
 ["25"] = 58815,
 ["150"] = 18.13,
 ["156"] = 18.22,
 ["151"] = 486013,
 ["7"] = 18.3,
 ["6"] = 18.16,
 ["155"] = 507093,
 ["24"] = 18.16,
 ["27"] = 280800,
 ["26"] = 18.15,
 ["31"] = 126377,
 ["30"] = 18.18,
 ["33"] = 910603,
 ["32"] = 18.19,
.......

g_InfoHq = {};      --��صĹ�Ʊ�ĵ��շ�ʱ����
{

 ["1"] = {      --ʱ���
 [1] = "201504130930",
 [2] = "201504130931",
},
 ["10"] = {  --����
 [1] = 16.93,
 [2] = 16.87,
},}

OrderBuySell(Param)  �����µ�  
Param.Account  --�����˺�
Param.Side  --�������� Buy Sell
Param.SecurityID  --��Ʊ����
Param.MarketID  --�г�����
Param.OrderQty -- �µ�����
Param.OrderPrice --�µ��۸�

���� true,Ret ���� false; trueΪ�µ��ɹ���falseΪʧ�� 
Ret ��ϢΪ 
Ret['SecurityID'] 
Ret['Side']
Ret['OrderQty']
Ret['Price']
Ret['ClOrdID']


OrderCancel(Param)
Param.Account  --�����˺�
Param.SecurityID --��Ʊ����
Param.ClOrdID  --���ĺ�ͬ���
���� true ���� false; trueΪ�µ��ɹ���falseΪʧ��
GetKLineHq(code,period,begintime,endtime)  -- �������� ret,err

]]--
--[[
	Name  ��ʾ�Ĳ�������
	Type  �����������ʽ  time date number decimal text �ֱ��� ʱ�� ���� ���� С�� �ı� 
		   SelectΪѡ��� 
	Key   ���淵�ص����Զ˵Ĳ���keyֵ
	Max/Min/Now  ���ֵ ��Сֵ������ֵ ��ֻ��time date number decimal text���� ������text��Max��Minֵ
	List  ��Selectѡ��� ���е�һ����Ϣ['List']����ValueΪ�޶����ص�ֵ NameΪ��ʾ����Ϣ



]]--
function TypeInit()   								--�����滮 ��ֻ�ڳ�ʼ��ʱ��ִ��
	local param = {};
	local StrInfo = [[TWAP������ʱ����о��ȷָ����ÿ���ָ�ڵ�
	�Ͻ����Ȳ�ֵĶ��������ύ��TWAP ������Ƶ�Ŀ������ʹ���׶��г�
	Ӱ����С����ͬʱ�ṩһ���ϵ͵�ƽ���ɽ��۸񣬴Ӷ��ﵽ��С���׳ɱ�
	��Ŀ�ġ�]];
	
	local dat ={};
	local NowTT = os.date("%H%M%S");
	if tonumber(NowTT) <= 93000 then
		dat['Now'] = '09:30:00';
	elseif tonumber(NowTT) >113000 and tonumber(NowTT)<=130000 then
		dat['Now'] = '13:00:00';
	elseif tonumber(NowTT)>=150000 then
		dat['Now'] = '15:00:00';
	else
		if #NowTT==5 then
			NowTT = '0'..NowTT;
		end
		dat['Now'] = string.sub(NowTT,1,2)..':'..string.sub(NowTT,3,4)..':'..string.sub(NowTT,5,6);
	end
	dat['Name'] = '��ʼʱ��';
	dat['Type'] = 'time';
	dat['Key'] = 'BeginTime';
	dat['Max'] = '15:00:00';
	dat['Min'] = '00:00:00';
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '����ʱ��';
	dat['Type'] = 'time';
	dat['Key'] = 'EndTime';
	dat['Max'] = '15:00:00';
	dat['Min'] = '09:30:00';
	dat['Now'] = '15:00:00';
	table.insert(param,dat)
--~ 	
	local dat ={};
	dat['Name'] = 'ί�м۸�';
	dat['Type'] = 'Select';
	dat['Key'] = 'StockPosition';
	dat['List'] = {};
	local list ={};
	list.Value = "10" ;
	list.Name = "���¼�" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "24" ;
	list.Name = "��1��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "26" ;
	list.Name = "��2��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "28" ;
	list.Name = "��3��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "150" ;
	list.Name = "��4��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "154" ;
	list.Name = "��5��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "30" ;
	list.Name = "��1��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "32" ;
	list.Name = "��2��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "34" ;
	list.Name = "��3��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "152" ;
	list.Name = "��4��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "156" ;
	list.Name = "��5��" ;
	table.insert(dat['List'],list);
	local list ={};
	list.Value = "MarketPriceOrder";
	list.Name = "�м�ί��" ;
	table.insert(dat['List'],list);
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '�µ����';
	dat['Type'] = 'number';
	dat['Key'] = 'Second';
	dat['Max'] = 100000;
	dat['Min'] = 1;
	dat['Now'] = 15;
	dat['Step'] = 1
	table.insert(param,dat);
	return param,StrInfo;
end


function TimerOrder(param)   						--ִ�д���
    local orderret;
	g_Monitor = param.Monitor;
	g_InfoQuote = param.InfoQuote;

	g_time = param.NowTime ; 
	if g_Monitor and  next(g_Monitor) then	
		g_Monitor,orderret = twapcontrol(g_Monitor);  
	end	

 	return g_Monitor,orderret;
end

function twapcontrol(v)
	local orderret;
	if v and next(v) then
		if v.LeftQty == 0 then
			v['Stop'] = 1;
			return v;
		end
		-----��ȡĸ����Ϣ
		v = twapinfo(v);    
		
		--��һ�μ����µ����������Ѿ����㣬������
		if v.Num == nil and v.flag == nil and v['Stop'] == 0 then
			v.BeginTime,v.EndTime = inittime(v.BeginTime,v.EndTime);
			if not(v.BeginTime and v.EndTime) then
				v['Stop'] = 1;
				return v;
			elseif tonumber(v.BeginTime)<113000 and tonumber(v.EndTime)>=130000 then
				v.TimeFlag = true;	
			end
			v.Num,v.flag = totaltimes(v.BeginTime,v.EndTime,v.Second);
		end
		
		--�����㷨��ʼʱ�������磬����ʱ����������һ����������µ�����
		if v and v.TimeFlag and v.EntryTime and tonumber(os.date("%H%M%S",v.EntryTime+v.Second))>113000 then
			v.EntryTime =  v.EntryTime + 1.5*3600;
			v.TimeFlag = false;			
		end
		
		
		local Time = g_time;
		if v['Stop'] == 0 and v.LeftQty >=100 and tonumber(os.date("%H%M%S",Time))>=tonumber(v.BeginTime) then
			if (v.LastClOrdID==nil or (Time-v.EntryTime) >= v.Second ) then			
				if v.StockPosition and  v.StockPosition ~='' then
					local price;
					if v.StockPosition == "MarketPriceOrder" then
						price = "MarketPrice";
					else
						price =  g_InfoQuote[tostring(v.StockPosition)];
					end
					
					if price == nil or price == "" then
						return v;
					end
					
					local vol = twapvol(v);
					local Status,Ret = twaporder(v,vol,price);	
					if Status  then
						orderret = Ret ;
						
					end					
				end												
			end
		end
		return v,orderret;
	end
	
end

function inittime(begintime,endtime)  				--����ʼʱ�������ʱ�����  
		
	 local ticktime = g_time;
	 local NowTime = os.date("%H%M%S",ticktime);

	if tonumber(begintime) <= math.max(93000,tonumber(NowTime)) then
		begintime = tostring(math.max(93000,tonumber(NowTime)));
		if tonumber(begintime) < 130000 and tonumber(begintime)>113000 then
			begintime = '130000';
		end
		if string.len(begintime) == 5 then
			begintime = '0'..begintime;
		end
	end
	
	if tonumber(endtime) <= tonumber(NowTime) then
		return;
	elseif tonumber(endtime)>=150000 then
		endtime = "150000";	
	elseif tonumber(endtime) < 130000 and tonumber(endtime)>113000 then
		endtime = '113000';
	end
	
	if string.len(endtime) == 5 then
		endtime = '0'..endtime;
	end
	
	if tonumber(begintime)>=tonumber(endtime) then
		return;
	end

	return begintime,endtime;

end

function totaltimes(begintime,endtime,second)       --�����µ�����
	local HH = string.sub(begintime,1,2);  
    local MM = string.sub(begintime,3,4);  
	local SS = string.sub(begintime,5,6);  
	local HH2 = string.sub(endtime,1,2) ; 
    local MM2 = string.sub(endtime,3,4) ; 
	local SS2 = string.sub(endtime,5,6)	;
	local flag = 0;

	--������Գ�ʼʱ���ʱ���
    local dt1 = os.time{year='2015', month='01', day='01', hour=HH,min=MM,sec=SS};  
	local dt2 = os.time{year='2015', month='01', day='01', hour=HH2,min=MM2,sec=SS2 }; 
	local c= (dt2- dt1);

	if tonumber(begintime) <= 113000 and tonumber(endtime) >= 130000 then
		c = c - 1.5*3600;
		flag = 1;
	end	
	--����ʱ�����µ�����������µ�����
	local num = math.ceil(c/second);
--~ 	print(num,flag)
	return num,flag;
	
end

function twapvol(v)                      			--���㵱ǰ���ӵ���С
	local vol;
	if v and next(v) then
		if v.Num >= 1 then
			local a = v.LeftQty/100;
			local b = (a/v.Num)%1;

			if b>=0.5 then							--�����ӵ���С
				vol = math.floor(a/v.Num )*100 + 100;
			else
				vol = math.floor(a/v.Num )*100;
				if v.sumtwap == nil then
					v.sumtwap = 0;
				end
				
				if vol < 100 then					--���ӵ�������һ�֣����ۼӵ�����һ��ʱ�µ�
					v.sumtwap = v.sumtwap + (a/v.Num)*100;
					if v.sumtwap >= 100 then
						vol = math.floor(v.sumtwap/100)*100;
						v.sumtwap = v.sumtwap - vol;
					else
						vol = 0;
--~ 						print('�µ�����'..v.sumtwap)
					end
				end
			end	
		else
			vol = v.LeftQty;
			v['Stop']=1;
		end
		
		v.Num = v.Num - 1;
		return vol;
	end
end

function twaporder(v,vol,price)             		--TWAP�����µ�
    local Ret ={};
	if v and next(v) then  
		local Result = false;
		
		if vol >= 100 then
			local OrderList = {} ;
			OrderList.Account = v.Account;
			OrderList.Side = v.Side;
			OrderList.SecurityID =v.SecurityID;
			OrderList.MarketID = v['MarketID'];
			OrderList.OrderQty = vol;
			OrderList.OrderPrice = price;
			OrderList.Key = v.Key;
			Result,Ret = OrderBuySell(OrderList);
			
			if Result then				
				v.EntryTime = g_time;	   
				v['LastClOrdID'] =Ret.ClOrdID ;				
				return true,Ret;
			end
		end
	end
	
	return true,Ret;	
end

function twapinfo(param)                 			--������ʾĸ����Ϣ
	if param and next(param) then
		if param.Str==nil or param.Str=='' then
			param.Str = '��ص� '..param.SecurityID..',';
			if param.Side =='Sell' then
				param.Str = param.Str..' ���� ' ;
			else 
				param.Str = param.Str..' ���� '
			end
			param.Str = param.Str..param.OrderQty..'�ɣ�';
		end
	end	
	return param;
end


--[[
----orderret-->
{
 ["Str"] = "��ص� 000001, ���� 1000000�ɣ�",
 ["Index"] = 0,
 ["flag"] = 0,
 ["BackTestDate"] = "20150518",
 ["LeftQty"] = 1000000,
 ["BeginTime"] = "093002",
 ["LastClOrdID"] = 0,
 ["TradeVolume"] = 0,
 ["Num"] = 239,
 ["Side"] = "Buy",
 ["Symbol"] = "ƽ������",
 ["EndTime"] = "103000",
 ["Second"] = 15,
 ["OrderQty"] = 1000000,
 ["Stop"] = 0,
 ["EntryTime"] = "1431912602",
 ["MarketID"] = "SZA",
 ["Account"] = "wanghao@myhexin.com_20150519175020",
 ["StockPosition"] = "10",
 ["SecurityID"] = "000001",
}

]]--
