#include<stdio.h>
#include<stdlib.h>
#include<math.h>

main()
{
    int samplingrate=60;
    int time=10; //Seconds
    int heartrate=60;
    int NrOfElements=samplingrate*time;
    int noise=1;
    int DC=15;
    int AC=1;
    int DN=1; //Dicrotic notch
    int fluctuation=1;
	float wave1[NrOfElements];
	float wave2[NrOfElements];
	float wave3[NrOfElements];
	float wave4[NrOfElements];
	int i;
	float pi=3.14159;
	int random;




	for ( i = 0; i <= NrOfElements; i++ )
    {
        wave1[i]=4*sin(i*2*pi*heartrate/(60*samplingrate))+4;
        if  ( wave1[i]<0 )
        {
            wave1[i]=0;
        }

        wave2[i]=4*sin(i*2*pi*heartrate/(60*samplingrate)+pi*1.4)-3.5;
         if  ( wave2[i]<0 )
        {
            wave2[i]=0;
        }
        float random=(rand() % 10)/10;
        wave3[i]=AC*(wave1[i]+DN*4*wave2[i])+noise*random/20+DC;
    }

//for ( i = 0; i <= 10; i++ )
//{
//	printf("%3.4f\n", wave3[i]);
//}
    if (fluctuation != 0)
    {
        for ( i = 0; i <= NrOfElements; i++ )
        {
            wave4[i]=0.05*sin(i/samplingrate)+1;
            wave3[i]=fluctuation*wave4[i]*wave3[i];
        }
    }


//for ( i = 0; i < 10; i++ )
//{
//	printf("%3.4f\n", wave3[i]);
//}

   return(0);
}
