Linux Keyboard Debouncer

**Requirement**
- libevdev
- interception-tools
- cmake

**How To Build & Install**
```bash
git clone https://github.com/Rliop913/Linux-Key-Debouncer.git
cd Linux-Key-Debouncer
bash ./debounceSetter.sh
```

**How To Activate**
```bash
sudo bash ./runDebounce.sh /dev/input/eventX
```
If your device reconnects frequently, for example, bluetooth keyboard, use this.

```bash
sudo bash ./autoReconnectRunner.sh /dev/input/eventX
```
Provides continuous reconnection using the udevadm add event.

Done!


**EX**


If you want to change the threshold, edit the TIME.cpp

```C
//in TIME.cpp
unsigned long BOUNCING_TIME_MICRO_SECOND = 50000; // change this value. (value is micro second)
```
after do this, execute debounceSetter.sh again.

If you want to Check it works, use this.
```bash
sudo libinput debug-events
```
if it works, the debouncer has made a new event 
(e.g. -> if keyboard is event14, and there is 16 events are already exists, debouncer makes event17 and event 14 doesn't works.)

If you want to terminate debouncer, use this
```bash
ps -e | grep keyDebouncer
# check id
kill -9 <checked id>
```
if it was autoreconnector, use this.
```bash
ps -e | grep udevadm
#check id
kill -9 <checked id>
```

