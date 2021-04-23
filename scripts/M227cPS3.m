
pRain = 0.1;

Mmw = [0,0,0,0,1-pRain;
    0,0,0,1-pRain,pRain;
    0,0,1-pRain,pRain,0;
    0,1-pRain,pRain,0,0;
    1-pRain,pRain,0,0,0];

TUntilWet = -ones(5,1)\(Mmw-eye(5));

display(TUntilWet);