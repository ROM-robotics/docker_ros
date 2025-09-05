### how to build
```
docker build -t ros2-robot-yolo .
```

### user name and password
```
username=mr_robot
password=mr_robot
```

### ဘယ်လို run ရမလဲ
``` 
# wayland က docker container ထဲမှာ အဆင်မပြေတာကြောင့် .tmuxinator ထဲက နောက်ဆုံး instruction ဖြစ်တဲ့ 
source ~/yolo_env/bin/activate; export QT_QPA_PLATFORM=wayland; python3 ~/devel_ws/src/moveit2_2025/ui/bolt_selector.py
# သူ့ကို container ထဲမှာ run လို့မအောင်မြင်ဘူး။ ဒါကြောင့် container ရဲ့ home ထဲမှာ 
tmuxinator
# လို့ရိုက်ပြီး bolt_selector.py ကလွဲရင် အကုန် run ပါ။ Host OS ပေါ်မှာ ~/devel_ws/src/moveit2_25 ကို build လုပ်ပြီး source လုပ်ကာ အောက်ပါအတိုင်း run ပြီး network connection ရရှိမှာဖြစ်ပါတယ်။
source ~/devel_ws/install/setup.bash
python3 ~/devel_ws/src/moveit2_2025/ui/bolt_selector.py
```

wayland ပြသနာကြောင့် app ကို container နဲ့ Host OS တို့ ros2 topic ကနေတဆင့် ချိတ်ဆက်ဆောင်ရွက်ခြင်းပဲဖြစ်ပါတယ်။
