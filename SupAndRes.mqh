// class to include for EA

class SupAndRes
{
   public:
      
      datetime _dateTimeStruct;
   
   private:
   MqlDateTime _structime;
   
   
   public: 
   void updatePivots(ENUM_TIMEFRAMES timeframe, int offset)
   {
   
      Comment("Hello my first mqh");
      if(timeframe != NULL)
      {
            switch(timeframe)
            {
               
               case PERIOD_D1:
                     TimeCurrent(_structime);
                     _dateTimeStruct = StructToTime(_structime); 
                     Comment(_dateTimeStruct);
                  
                          
                     
            }
      }
      
   }
   
   void setoffset();
   
};

void SupAndRes::setoffset()
{
      
}
