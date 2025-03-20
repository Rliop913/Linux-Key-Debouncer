#include <libevdev-1.0/libevdev/libevdev.h>
#include <unistd.h>
#include <cmath>
#include <cstring>


extern unsigned long BOUNCING_TIME_MICRO_SECOND;
constexpr auto EVSZ = sizeof(input_event);
int main(int argc, char* argv[])
{
    input_event evS;

    timeval inTimeTable[256] = {0, };
    while (true){
        ssize_t bytesRead = read(STDIN_FILENO, &evS, EVSZ);
        if (bytesRead != EVSZ){
            continue;
        }
        if (evS.type == EV_KEY && evS.value == 1){
            if((evS.time.tv_sec - inTimeTable[evS.code].tv_sec < 2) && evS.time.tv_usec !=  inTimeTable[evS.code].tv_usec){
                long time  = evS.time.tv_sec - inTimeTable[evS.code].tv_sec;
                time *= 1000000;
                if((evS.time.tv_usec + time) - inTimeTable[evS.code].tv_usec < BOUNCING_TIME_MICRO_SECOND){
                    continue;
                }
            }
            inTimeTable[evS.code] = evS.time;
            
        }
        write(STDOUT_FILENO, &evS, EVSZ);
    }
    return 0;
}