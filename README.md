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
## Scope Cut Table (ตัด scope อย่างเป็นทางการ)
| Must Finish for Demo | Can Demo with Workaround | Cut for Sprint 3 |
| --- | --- | --- |
| ESP32 ควบคุม Servo ได้ | ใช้ปุ่ม local แทน dashboard | ระบบแจ้งเตือน LINE |
| ปล่อยอาหารอัตโนมัติได้ | ใช้ video backup | AI วิเคราะห์พฤติกรรมสัตว์ |
| Dashboard แสดงสถานะได้ | refresh manual | ระบบ login ผู้ใช้ |

## ## Prototype: ระบบตอนนี้ทำอะไรได้บ้าง

Prototype v1 ของทีม AWP Tech สามารถจำลองการทำงานของระบบให้อาหารสัตว์ผ่านมือถือได้ในระดับเบื้องต้น โดยมีความสามารถดังนี้

* ผู้ใช้สามารถกดปุ่ม “Feed” ผ่านหน้า Dashboard บนมือถือได้
* ระบบแสดง flow การให้อาหารผ่าน Figma Prototype
* เมื่อกดปุ่ม ระบบจะเปลี่ยนไปยังหน้า “Feeding Success” เพื่อจำลองการให้อาหารสำเร็จ
* มีการออกแบบ User Flow และหน้าจอการใช้งานหลักของระบบแล้ว
* ESP32 และ Servo Motor เริ่มมีการศึกษาและทดสอบการเชื่อมต่อเบื้องต้น
* มี GitHub Repository สำหรับรวม evidence, README และเอกสารของทีม
* มี Integration Map และ Demo Flow สำหรับอธิบายการทำงานของระบบ

### สิ่งที่ยังทำไม่ได้ใน Prototype ตอนนี้

* Hardware ยังไม่เชื่อมกับ Dashboard แบบ Real-time
* MQTT/Firebase ยังทำงานไม่สมบูรณ์
* Servo Motor ยังปล่อยอาหารจริงได้ไม่เสถียร
* ระบบ Login และ Notification ยังไม่ได้พัฒนา
* Demo บางส่วนยังใช้ Figma Prototype และ Screen Recording เป็น workaround









