--~ g_MonitorList
--~ g_InfoQuoteList
--~ g_InfoHqList
local g_Monitor ={};
local g_InfoQuote ={};
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

 ["70"] = 14.72,
 ["152"] = 16.51,
 ["55"] = "ƽ������",
 ["34"] = 16.5,
 ["35"] = 138100,
 ["157"] = 6100,
 ["29"] = 54927,
 ["10"] = 16.48,
 ["153"] = 12000,
 ["69"] = 18,
 ["28"] = 16.44,
 ["154"] = 16.42,
 ["25"] = 3200,
 ["150"] = 16.43,
 ["156"] = 16.52,
 ["151"] = 64060,
 ["7"] = 17,
 ["6"] = 16.36,
 ["155"] = 60300,
 ["24"] = 16.46,
 ["27"] = 161555,
 ["26"] = 16.45,
 ["31"] = 147852,
 ["30"] = 16.48,
 ["33"] = 68360,
 ["32"] = 16.49,}


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
	local StrInfo = [[�ò��Կ��԰���Ͷ������Ҫ���ʱ�䷶Χ����ɹ�ģ�൱��
		�г�������ָ��������ί�н��ף���ָ���������������ʣ�Ͷ���߿���ͨ���趨
		��ͬ�Ĳ������������Լ��Ľ��׽��࣬�����г����顣]];
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
	table.insert(param,dat);
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
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '�ֶ�����(��)';
	dat['Type'] = 'Select';
	dat['Key'] = 'Period';
	dat['List'] = {};
	list ={};
	list.Value = "oneminute" ;
	list.Name = "1" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "fiveminutes" ;
	list.Name = "5" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "fifteenminutes" ;
	list.Name = "15" ;
	table.insert(dat['List'],list);
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '������(%)';
	dat['Type'] = 'decimal';
	dat['Key'] = 'ParticiRate';
	dat['Max'] = 100.00;
	dat['Min'] = 0.00;
	dat['Now'] = 1.00;
	dat['Step']=0.01;
	table.insert(param,dat)
	local dat ={};
	dat['Name'] = '�µ����';
	dat['Type'] = 'number';
	dat['Key'] = 'Second';
	dat['Max'] = 1000000;
	dat['Min'] = 1;
	dat['Now'] = 15;
	dat['Step'] = 1;
	table.insert(param,dat);
	local dat ={};
	dat['Name'] = '���������';
	dat['Type'] = 'Select';
	dat['Key'] = 'Allow';
	dat['List'] = {};
	list ={};
	list.Value = "0" ;
	list.Name = "������" ;
	table.insert(dat['List'],list);
	list ={};
	list.Value = "1" ;
	list.Name = "����" ;
	table.insert(dat['List'],list);
	table.insert(param,dat);

	return param,StrInfo ;
end

local g_nowtime;
local g_Ret;
--~ print = hx_print;
function TimerOrder(param)  						--ִ�д���
	
	g_Monitor= param.Monitor;
	g_InfoQuote= param.InfoQuote;

    g_nowtime = param.NowTime;
	g_Ret = nil;
	if g_Monitor and  next(g_Monitor)  then
		g_Monitor = vpcontrol(g_Monitor);
		
	end
	return g_Monitor,g_Ret;
end

function vpcontrol(v)
	if v and next(v) then
			
		if v.LeftQty == 0 or (tonumber(v.BeginTime)>=tonumber(v.EndTime)) or (tonumber(os.date("%H%M%S",g_nowtime))>=145950) then
			v['Stop'] = 1;
			return v;
		end

		v = vpinfo(v);
		local Time = g_nowtime;
		if not(v['VP'] and next(v['VP'])) then
			v = vpinit(v);
			if v['Stop'] == 1 then
				return v;
			end
		else			
			local Flag = checkstop(v['VP']);
			if Flag == 0 then
				v['Stop'] = 1;
				return;
			end
			if v.Allow == '0' and tonumber(os.date("%H%M%S",Time))>tonumber(v.EndTime) then
				v['Stop'] = 1;
				return;
			end
		end
		
		--�����㷨��ʼʱ�������磬����ʱ����������һ����������µ�����
		if v and v.TimeFlag and v.EntryTime and tonumber(os.date("%H%M%S",v.EntryTime+v.Second))>113000 then
			v.EntryTime =  v.EntryTime + 1.5*3600;
			v.TimeFlag = false;			
		end
		
		if v.LeftQty >0 and v['Stop']==0  and tonumber(os.date("%H%M%S",Time))>=tonumber(v.BeginTime) then
			if v.LastClOrdID==nil or  ((Time-v.EntryTime)>=v.Second ) then
				if v.StockPosition  and  v.StockPosition ~='' then
					local price =  g_InfoQuote[tostring(v.StockPosition)];
					if price==nil or price==0 or price=='' then
						return param;
					end
					local Status,Ret = vporder(v,price);
					
					if Status  then
						v = Ret ;
						return v;
					end					
				end	
			end
		end			
	end
	return v;
end

function vpinfo(param)                              --������ʾĸ����Ϣ
	if param and next(param) then
		if param.Str==nil or param.Str=='' then
			param.Str = '��ص� '..param.SecurityID..',ʱ�䷶Χ'..param.BeginTime..'-'..param.EndTime..',�µ���� '..param.Second..'��,';
			if param.Side =='Sell' then
				param.Str = param.Str..' ���� ' ;
			else 
				param.Str = param.Str..' ���� ';
			end
			param.Str = param.Str..param.OrderQty..'�ɣ�';
		end
	end	
	return param;
end

function inittime(begintime,endtime,allow)          --����ʼʱ�������ʱ�����
	local NowTime = os.date("%H%M%S",g_nowtime);
	if tonumber(begintime) <= math.max(93000,tonumber(NowTime)) then
		begintime = tostring(math.max(93000,tonumber(NowTime)));
		if tonumber(begintime) < 130000 and tonumber(begintime)>113000 then
			begintime = '130000';
		end
		if string.len(begintime) == 5 then
			begintime = '0'..begintime;
		end
	end
	
	if allow == '0' then
		if tonumber(begintime) <= tonumber(NowTime) then
			begintime = tostring(NowTime);
			if tonumber(begintime) < 130000 and tonumber(begintime)>113000 then
				begintime = '130000';
			end
		
			if string.len(begintime) == 5 then
				begintime = '0'..begintime;
			end
		end
	
		if tonumber(endtime) <= tonumber(NowTime) then
			begintime = endtime;
			return begintime,endtime;
		end

		if tonumber(endtime) < 130000 and tonumber(endtime)>113000 then
			endtime = '113000';
		end
		if string.len(endtime) == 5 then
			endtime = '0'..endtime;
		end		
		
	else
		endtime = '150000';
	end
	
	return begintime,endtime;

end

function checkstop(param)                           --����Ƿ��Ѿ�����
	local flag = 0;
	if param and next(param) then
		for i=1,#param do
			if param[i][2] ~= 0 and  param[i][3] ~= 0  then
				flag = 1;
				break
			end
		end
	end
	return flag;
end

function vporder(v,price)							--VP�����µ�
	if v and v['VP'] and next(v['VP']) then
		
		for i=1,#(v['VP']),1 do
			local val = v['VP'][i] ;
			local Result =false ;
			local Ret;
			local qty = 0;
			if val[2]>0 then
				--��ʱ�����ڼ���õ�ί�����������ռ���õ��µ����������µ�
				qty= val[2]/val[3];
				if qty<100 then
					if qty > 0 then						
						qty = 100;					
					else
						break
					end
				else
					--��ʣ��ί��������ʱ����ʣ�����µ�
					qty = math.floor(qty/100)*100;
					if (v.LeftQty - qty) <100  then
						qty = v.LeftQty;
					end
				end

				local OrderList = {};
				OrderList.Account = v.Account;
				OrderList.Side = v.Side;
				OrderList.SecurityID = v.SecurityID;
				OrderList.MarketID = v['MarketID'];
				OrderList.OrderQty = qty;
				OrderList.OrderPrice = price;
				OrderList.Key = v.Key;

				Result,Ret = OrderBuySell(OrderList);
				g_Ret = Ret;
				if Result then
					v['VP'][i][3] = val[3] - 1;
					v['VP'][i][2] = val[2] - qty;
					v['LastClOrdID'] = Ret.ClOrdID ;

					return true,v;
				else
					return false,{};
				end

			end
		end
	end
	return false,{};
end

function initdate()									--��ʼ���ο�����  Ĭ��ȡ��ֹ����ǰ������ǰ��30��
	local enddate= os.date("%Y%m%d",g_nowtime - 24*3600)..'15'..'00';
	local time1 = os.time{year=string.sub(enddate,1,4), month=string.sub(enddate,5,6), day=string.sub(enddate,7,8), hour='09',min='30',sec='00'}
	local time2 = time1 - 24*30*3600;
	local startdate = os.date("%Y%m%d%H%M",time2);
	
	return startdate,enddate;
	
end

function vpinit(v)									--VP��ʼ���������ʱ����ڵ�ί����
	
	local StartDate,EndDate = initdate();
	local Ret,ErrMsg = GetKLineHq(v.SecurityID,v.Period,StartDate,EndDate);
	
	local detail = {};
	if Ret and next(Ret) then
		local param  ={};
		for i=1,#Ret,1 do	
			local value = Ret[i] ;
			local time = string.sub(value['Time'],9,12);
			if param[time]==nil  then
				param[time] = 0 ;
			end
			if param[time] then
				param[time] = param[time]+value['Vol'];
			end
		end
		if param and next(param) then
			for kk,vv in  pairs(param) do
				table.insert(detail,{tonumber(kk),vv});
			end
			table.sort(detail,function(a, b) return tonumber(b[1])>tonumber(a[1]) end);
		end
		detail  = initkline(detail);
		for i=1,#detail do
			if #(tostring(detail[i][1])) == 5 then
				detail[i][1] = '0'..detail[i][1];
			end
		end
	end
	
	v.BeginTime,v.EndTime = inittime(v.BeginTime,v.EndTime,v.Allow);
	if tonumber(v.BeginTime) >= tonumber(v.EndTime) then
		return v;
	elseif tonumber(v.BeginTime)<113000 and tonumber(v.EndTime)>=130000 then
		v.TimeFlag = true;
	end
	
	local begintt= string.sub(v.BeginTime,1,4);
	local endtt = string.sub(v.EndTime,1,4);

	--������ʷ�ɽ������ݣ�Ԥ�⵱�ճɽ����ֲ�״��
	if detail and next(detail) then
		local alldetail = 0;
		for i=1,#detail,1 do
			local lasttime ;
			if i==1 then
				lasttime = '0930' ;
			else 
				lasttime = detail[i-1][1] ;
			end	
			if tonumber(begintt)<=tonumber(lasttime) then
				if tonumber(endtt)>=tonumber(detail[i][1]) then
					local len2 = math.floor(OrderTimeDev(detail[i][1]..'00',lasttime..'00')/60) ;
					detail[i][2] = detail[i][2];
					detail[i][3] = len2;
				else
					local len1 = math.floor(OrderTimeDev(detail[i][1]..'00',lasttime..'00')/60) ;
					local len2 = math.floor(OrderTimeDev(endtt..'00',lasttime..'00')/60) ;
					detail[i][2] = detail[i][2]*len2/len1;
					detail[i][3] = len2	;			
				end
			elseif tonumber(begintt)>tonumber(lasttime) and tonumber(begintt)<=tonumber(detail[i][1]) then
--~ 				print('bbbb',lasttime,detail[i][1])
				if tonumber(endtt)>=tonumber(detail[i][1]) then
					local len1 = math.floor(OrderTimeDev(detail[i][1]..'00',lasttime..'00')/60) ;
					local len2 = math.floor(OrderTimeDev(detail[i][1]..'00',begintt..'00')/60) ;
					detail[i][2] = detail[i][2]*len2/len1;
					detail[i][3] = len2;
				else
					local len1 = math.floor(OrderTimeDev(detail[i][1]..'00',lasttime..'00')/60) ;
					local len2 = math.floor(OrderTimeDev(endtt..'00',begintt..'00')/60) ;
					detail[i][2] = detail[i][2]*len2/len1;
					detail[i][3] = len2;
				end
			elseif  tonumber(begintt)>tonumber(detail[i][1]) or tonumber(endtt)<=tonumber(lasttime) then
--~ 				print('cccc',lasttime,detail[i][1])
				detail[i][2] = 0;
				detail[i][3] = 0;
			end
			alldetail = alldetail + detail[i][2];
			detail[i][3] = math.floor(detail[i][3]*60/v.Second);
		end

		local allqty = v.OrderQty; 
		for i=1,#detail,1 do
			if allqty == 0 then
				break
			end
			
			--�����趨�Ĳ����ʣ�ȷ����ʱ�����ڵ�ί���������µ�����
			if detail[i][2] > 0 then
				local ParticiRate = tonumber(v.ParticiRate);
				if ParticiRate==0 then
					v['Stop'] = 1;
					return v ;
				end
				
				local a = math.floor(detail[i][2]*ParticiRate/(#detail)/100)*100;

				if a >= allqty then
					detail[i][2] = allqty;
					for k=(i+1),#detail do
						detail[k][2] = 0;
						detail[k][3] = 0;
					end
					allqty = 0;
					break										
				else
					if a < 100 then
						detail[i][2] = 100;
						allqty = allqty - 100;
						detail[i][3] = 1;
					else
						detail[i][2] = a;
						allqty = allqty - a;
					end					
				end				
			end
		end
	end

	v['VP'] = detail ;
	
	return v ;
end

function initkline(param)							--����09:30��13:00�����K������
	local a;
	local b;
	if param and next(param) then
		for i=1,#param do
			if param[i][1] == 930 then
				param[i+1][2] =  param[i+1][2] + param[i][2];
				a = i;
			end
			if param[i][1] == 1300 then
				param[i+1][2] =  param[i+1][2] + param[i][2];
				b = i;
			end
		end
		if a then
			if b then
				table.remove(param,a);
				table.remove(param,b - 1);
			else
				table.remove(param,a);
			end
		end

	end
	return param;
end

function OrderTimeDev(Time,Time2)					--ʱ����㺯��
    if string.len(Time) == 5 then
		Time = '0'..Time;
	end
	if string.len(Time2) == 5 then
		Time2 = '0'..Time2;
	end
	
	local HH = string.sub(Time,1,2);  
    local MM = string.sub(Time,3,4) ; 
	local SS = string.sub(Time,5,6) ; 
	local HH2 = string.sub(Time2,1,2) ; 
    local MM2 = string.sub(Time2,3,4);  
	local SS2 = string.sub(Time2,5,6) ; 
    local dt1 = os.time{year='2015', month='01', day='01', hour=HH,min=MM,sec=SS} ; 
	local dt2 = os.time{year='2015', month='01', day='01', hour=HH2,min=MM2,sec=SS2 } ;
	local b = dt2;
	local c = (dt1- dt2);
	local num = 0;
	
	for i=1,c,1 do 
		local new = tonumber(os.date("%H%M%S", b + i ));
		if (new>93000 and new<=113000) or (new>=130000 and new<=150000)  then 
			num = num + 1;
		end
	end
	
    return num;
end