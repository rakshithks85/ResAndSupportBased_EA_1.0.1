//+------------------------------------------------------------------+
//|                                                    ExpAlgoSR.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//| Global Variables                                  |
//+------------------------------------------------------------------+

#include<Trade\Trade.mqh>;
#include <Trade\OrderInfo.mqh>;
#include "SupAndRes.mqh";

//+------------------------------------------------------------------+
//| Global Variables                                  |
//+------------------------------------------------------------------+

MqlRates priceinformation[];             
MqlTick tick;  // get tick data
MqlDateTime getTimestruct; 
input string InpFile = "InputConfig.ini";                             
input int Inp_Addition_Value = 55;          // enter round off value 
input int Inp_DiffBuffer_Value;             // Sup and Res Difference
input string Inp_Symbol;                    // Trade Symbol
input double Inp_volume;                    // Trade volumne
input int Inp_reset_pending;                // Reset re-order levels
input int Inp_magicNumber;                  // Magic Number
input double Inp_volume_updated;            // Hedge Volumne
input double Inp_TPAdjustments;             // TP adjustments value
bool flag = false;
double support[];                           // support levels
double resistance[];                        // resistnace levels
ulong openPosArr[];                         // open positions usage array
ulong _posArray[][3] = {};                  // 2d array for storing and processing
int _toHarray[][3];                         // hedge arrays
double currentprice;                        // initialized when used    
double _updatedPrice;                       // initialized when used 
double _swapvalue;                          // initialized when used 
CTrade trade;                                 // Object of trade class
CPositionInfo  m_position;                    // object of CPositionInfo class
int _buy;                                      // buy count
int _sell;                                   // sell count
int _previousPositions = 0;                       //positions count                  
double _s1,_s2,_s3,_s4,_s5;             
double _r1,_r2,_r3,_r4,_r5;
SupAndRes _ObjSupAndRes;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

int OnInit()
  {
//---
      // verify all mandatory input values
      
      if(Inp_Addition_Value <=0 || Inp_Addition_Value == EMPTY_VALUE)
      {
         Alert("ABORTING: Inp_addition_value is zero");
         return INIT_PARAMETERS_INCORRECT;
      }
      
       if(Inp_DiffBuffer_Value <=0 || Inp_DiffBuffer_Value == EMPTY_VALUE)
      {
         Alert("ABORTING: Inp_DiffBuffer_Value is zero");
         return INIT_PARAMETERS_INCORRECT;
      }
      
       if(Inp_volume <=0.0 || Inp_volume == EMPTY_VALUE)
      {
         Alert("ABORTING: Inp_volume is zero");
         return INIT_PARAMETERS_INCORRECT;
      }
      
       if(Inp_reset_pending <=0 || Inp_reset_pending == EMPTY_VALUE)
      {
         Alert("ABORTING: Inp_reset_pending is zero");
         return INIT_PARAMETERS_INCORRECT;
      }
      
       if(Inp_magicNumber <=0 || Inp_magicNumber == EMPTY_VALUE)
      {
         Alert("ABORTING: Inp_magicNumber is zero");
         return INIT_PARAMETERS_INCORRECT;
      }
      
        if(Inp_TPAdjustments <=0 || Inp_TPAdjustments == EMPTY_VALUE)
      {
         Alert("ABORTING: Inp_TPAdjustments is zero");
         return INIT_PARAMETERS_INCORRECT;
      }
   
//---
   return(INIT_SUCCEEDED);
  }
 
 
 //+------------------------------------------------------------------+
//| Expert On Start function                                 |
//+------------------------------------------------------------------+

 //handle client terminal EA loading here
 //use this for account calculations and profit verificaitons. 
 //hint use database to store and acess profits
 
  
  
  
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   _ObjSupAndRes.updatePivots(PERIOD_D1,0);
   
  /* get current Price of the symbol */
  ArraySetAsSeries(priceinformation,true);
  //ArraySetAsSeries(tick,true);
  //currentprice = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_LAST),_Digits);
  if(!SymbolInfoTick(_Symbol,tick))
  {
      Alert("Tick value not valid",GetLastError());
      return;
  }
  

     // Comment("Position size total :",PositionsTotal());
      //Comment("support size total :",support.Size());
   
  //Get account balance code to be written
  
  
  
  currentprice = tick.last;
   
  }
//+------------------------------------------------------------------+
