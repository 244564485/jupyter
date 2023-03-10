from __future__ import print_function, absolute_import, unicode_literals
import numpy as np
import pandas as pd
try:
    import talib
except:
    print('请安装TA-Lib库')
def init(context):
    # context.parameter分别为唐奇安开仓通道.唐奇安平仓通道.短ma.长ma.ATR的参数
    context.parameter = [55, 20, 10, 60, 20]
    context.tar = context.parameter[4]
    # context.goods交易的品种
    context.goods = ['CZCE.FG801', 'SHFE.rb1801']
    # context.ratio交易最大资金比率
    context.ratio = 0.8
    # 订阅context.goods里面的品种, bar频率为1min
    subscribe(symbols=context.goods, frequency='60s', count=101)
    # 止损的比例区间
def on_bar(context, bars):
    bar = bars[0]
    symbol = bar['symbol']
    recent_data = context.data(symbol=symbol, frequency='60s', count=101, fields='close,high,low')
    close = recent_data['close'].values[-1]
    # 计算ATR
    atr = talib.ATR(recent_data['high'].values, recent_data['low'].values, recent_data['close'].values,
                    timeperiod=context.tar)[-1]
    # 计算唐奇安开仓和平仓通道
    context.don_open = context.parameter[0] + 1
    upper_band = talib.MAX(recent_data['close'].values[:-1], timeperiod=context.don_open)[-1]
    context.don_close = context.parameter[1] + 1
    lower_band = talib.MIN(recent_data['close'].values[:-1], timeperiod=context.don_close)[-1]
    # 计算开仓的资金比例
    percent = context.ratio / float(len(context.goods))
    # 若没有仓位则开仓
    position_long = context.account().position(symbol=symbol, side=PositionSide_Long)
    position_short = context.account().position(symbol=symbol, side=PositionSide_Short)
    if not position_long and not position_short:
        # 计算长短ma线.DIF
        ma_short = talib.MA(recent_data['close'].values, timeperiod=(context.parameter[2] + 1))[-1]
        ma_long = talib.MA(recent_data['close'].values, timeperiod=(context.parameter[3] + 1))[-1]
        dif = ma_short - ma_long
        # 获取当前价格
        # 上穿唐奇安通道且短ma在长ma上方则开多仓
        if close > upper_band and (dif > 0):
            order_target_percent(symbol=symbol, percent=percent, order_type=OrderType_Market,
                                 position_side=PositionSide_Long)
            print(symbol, '市价单开多仓到比例: ', percent)
        # 下穿唐奇安通道且短ma在长ma下方则开空仓
        if close < lower_band and (dif < 0):
            order_target_percent(symbol=symbol, percent=percent, order_type=OrderType_Market,
                                 position_side=PositionSide_Short)
            print(symbol, '市价单开空仓到比例: ', percent)
    elif position_long:
        # 价格跌破唐奇安平仓通道全平仓位止损
        if close < lower_band:
            order_close_all()
            print(symbol, '市价单全平仓位')
        else:
            # 获取持仓均价
            vwap = position_long['vwap']
            # 获取持仓的资金
            money = position_long['cost']
            # 获取平仓的区间
            band = vwap - np.array([200, 2, 1.5, 1, 0.5, -100]) * atr
            grid_percent = float(pd.cut([close], band, labels=[0, 0.25, 0.5, 0.75, 1])[0]) * percent
            # 选择现有百分比和区间百分比中较小的值(避免开仓)
            target_percent = np.minimum(money / context.account().cash['nav'], grid_percent)
            if target_percent != 1.0:
                print(symbol, '市价单平多仓到比例: ', target_percent)
                order_target_percent(symbol=symbol, percent=target_percent, order_type=OrderType_Market,
                                     position_side=PositionSide_Long)
    elif position_short:
        # 价格涨破唐奇安平仓通道或价格涨破持仓均价加两倍ATR平空仓
        if close > upper_band:
            order_close_all()
            print(symbol, '市价单全平仓位')
        else:
            # 获取持仓均价
            vwap = position_short['vwap']
            # 获取持仓的资金
            money = position_short['cost']
            # 获取平仓的区间
            band = vwap + np.array([-100, 0.5, 1, 1.5, 2, 200]) * atr
            grid_percent = float(pd.cut([close], band, labels=[1, 0.75, 0.5, 0.25, 0])[0]) * percent
            # 选择现有百分比和区间百分比中较小的值(避免开仓)
            target_percent = np.minimum(money / context.account().cash['nav'], grid_percent)
            if target_percent != 1.0:
                order_target_percent(symbol=symbol, percent=target_percent, order_type=OrderType_Market,
                                     position_side=PositionSide_Short)
                print(symbol, '市价单平空仓到比例: ', target_percent)
if __name__ == '__main__':
    '''
    strategy_id策略ID,由系统生成
    filename文件名,请与本文件名保持一致
    mode实时模式:MODE_LIVE回测模式:MODE_BACKTEST
    token绑定计算机的ID,可在系统设置-密钥管理中生成
    backtest_start_time回测开始时间
    backtest_end_time回测结束时间
    backtest_adjust股票复权方式不复权:ADJUST_NONE前复权:ADJUST_PREV后复权:ADJUST_POST
    backtest_initial_cash回测初始资金
    backtest_commission_ratio回测佣金比例
    backtest_slippage_ratio回测滑点比例
    '''
    run(strategy_id='strategy_id',
        filename='main.py',
        mode=MODE_BACKTEST,
        token='token_id',
        backtest_start_time='2017-09-15 09:15:00',
        backtest_end_time='2017-10-01 15:00:00',
        backtest_adjust=ADJUST_PREV,
        backtest_initial_cash=10000000,
        backtest_commission_ratio=0.0001,
        backtest_slippage_ratio=0.0001)
