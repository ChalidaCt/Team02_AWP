# Team02_AWP
# Team Members

| ชื่อสมาชิก | Role |
| --- | --- |
| ณัฏฐกมล วัฒน์ปรีชากุล | Embedded / IoT Developer |
| ชลิดา ฉิมทิม | Product / UX |
| ศศิวิมล บุญร่วม | Project Manager / Scrum Lead |

## Integration Map (แผนภาพการเชื่อมระบบ)
| ส่วน | คำตอบของทีม |
| --- | --- |
| Input คืออะไร | คำสั่งให้อาหารจากผู้ใช้ / เวลาที่ตั้งไว้ |
| Component 1 | ESP32 รับคำสั่งและควบคุมระบบ |
| Component 2 | Servo Motor หมุนเพื่อปล่อยอาหาร |
| Component 3 | Sensor ตรวจปริมาณอาหารหรือสถานะการทำงาน |
| Component 4 | MQTT / Firebase / Dashboard แสดงสถานะ |
| Output คืออะไร | เครื่องปล่อยอาหารอัตโนมัติ และผู้ใช้ตรวจสอบผ่านมือถือได้ |

## Integration Map ของทีม (เขียนเป็น flow สั้น ๆ)
```
User / Timer 
  ↓
ESP32
  ↓ 
Servo Motor → Food Dispense 
  ↓ 
MQTT / Firebase 
  ↓ 
Dashboard / Mobile View 
  ↓ 
 User
```
