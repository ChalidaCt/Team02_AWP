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

##  Prototype: ระบบตอนนี้ทำอะไรได้บ้าง

Prototype v1 ของทีม AWP Tech สามารถจำลองการทำงานของระบบให้อาหารสัตว์ผ่านมือถือได้ในระดับเบื้องต้น โดยมีความสามารถดังนี้

* ผู้ใช้สามารถกดปุ่ม “Feed” ผ่านหน้า Dashboard บนมือถือได้
* ระบบแสดง flow การให้อาหารผ่าน Figma Prototype
* เมื่อกดปุ่ม ระบบจะเปลี่ยนไปยังหน้า “Feeding Success” เพื่อจำลองการให้อาหารสำเร็จ
* มีการออกแบบ User Flow และหน้าจอการใช้งานหลักของระบบแล้ว
* ESP32 และ Servo Motor เริ่มมีการศึกษาและทดสอบการเชื่อมต่อเบื้องต้น
* มี GitHub Repository สำหรับรวม evidence, README และเอกสารของทีม
* มี Integration Map และ Demo Flow สำหรับอธิบายการทำงานของระบบ

## สิ่งที่ยังทำไม่ได้ใน Prototype ตอนนี้

* Hardware ยังไม่เชื่อมกับ Dashboard แบบ Real-time
* MQTT/Firebase ยังทำงานไม่สมบูรณ์
* Servo Motor ยังปล่อยอาหารจริงได้ไม่เสถียร
* ระบบ Login และ Notification ยังไม่ได้พัฒนา
* Demo บางส่วนยังใช้ Figma Prototype และ Screen Recording เป็น workaround

## Known Issues 
Prototype v1 ยังเชื่อม Hardware และ Dashboard แบบ Real-time ได้ไม่สมบูรณ์ จึงยังใช้ Figma Prototype และ Demo Video เป็น workaround บางส่วน

## Sprint 4 Test Plan
| หัวข้อ | คำตอบ |
| --- | --- |
| ผู้ใช้ที่จะทดสอบ | เจ้าของสัตว์เลี้ยง 2-3 คน |
| Task ที่ให้ลองทำ | กด Feed และดูสถานะการให้อาหาร |
| สิ่งที่จะสังเกต | ผู้ใช้เข้าใจการใช้งานหรือไม่ |
| วิธีเก็บ feedback | แบบสอบถาม + สัมภาษณ์ |
| ตัวชี้วัดเบื้องต้น | ความเข้าใจในการใช้งานและความพึงพอใจ |
| สิ่งที่ต้องเตรียมก่อน Test | Prototype, Demo Video, Feedback Form |

## Build Log
| รายการ | คำตอบ |
| --- | --- |
| สิ่งที่ทำเสร็จจริง 3 อันดับแรก | 1) Dashboard Prototype 2) Feed Flow 3) GitHub Evidence |
| สิ่งที่ยังไม่เสร็จ | เชื่อม Hardware กับ Dashboard จริง |
| สิ่งที่ตัดออกจาก Sprint 3 | ระบบ Login และ AI |
| สิ่งที่ใช้ workaround | ใช้ Figma Prototype และ Demo Video |
| blocker สำคัญที่เจอ | ESP32 ยังเชื่อม MQTT ไม่สมบูรณ์ |
| วิธีแก้หรือแผนรับมือ | ใช้ Screen Recording และ Prototype Demo |

## Prototype v1 Readiness Check
| รายการ | สถานะ | หลักฐาน / Link |
| --- | --- | --- |
| Prototype เปิดดูหรือทดลองได้ | Not Ready | **https://www.figma.com/design/H8l9tqdH1FPdleAadD9BW5/Untitled?node-id=0-1&t=1z1TLCtX6bUOLZ6L-1** |
| Core Flow หลักยังอยู่ครบ | Partly Ready  | https://github.com/ChalidaCt/Team02_AWP/blob/main/docs/core-flow.md |
| มี demo link / file / device / Figma / notebook |  Not Ready |  |
| มี known issues ที่ทีมรู้อยู่แล้ว | มี  | https://github.com/ChalidaCt/Team02_AWP/blob/main/README.md |
| มี workaround ถ้าระบบพัง | ไม่มี | - |
| ผู้ใช้สามารถลอง task ได้โดยไม่ต้องอธิบายยาว | Not Ready | - |

## Prototype v1 ที่จะใช้ทดสอบ
| รายการ | คำตอบ |
| --- | --- |
| Prototype ที่ใช้ทดสอบคืออะไร | Prototype แอปพลิเคชัน Smart Pet Feeder สำหรับควบคุมและติดตามการให้อาหารสัตว์เลี้ยง |
| Link / File / Device / Location | https://www.figma.com/design/H8l9tqdH1FPdleAadD9BW5/Untitled?node-id=0-1&p=f&t=wQH4u4hTNuhukDno-0 |
| Core Flow ที่จะทดสอบ | เปิดแอป → ดูสถานะอาหาร → สั่งให้อาหาร → ตรวจสอบประวัติการให้อาหาร |
| สิ่งที่ prototype ทำได้แล้ว | แสดงหน้าจอหลักของระบบ สามารถนำเสนอ Flow การใช้งานและการเชื่อมโยงระหว่างหน้าจอได้ |
| ข้อจำกัดที่ต้องบอกผู้ใช้ก่อน test | Prototype ยังไม่สมบูรณ์ บางปุ่มหรือฟังก์ชันอาจยังไม่สามารถใช้งานได้จริง และยังไม่เชื่อมต่อกับอุปกรณ์ให้อาหารสัตว์จริง |

## CP6 — User Testing Report + Iteration Plan
| ส่วนของ CP6 | รายละเอียด | Link / Evidence |
| --- | --- | --- |
| 1. User Test Plan | ทดสอบผู้ใช้ 2 คน โดยให้ทำ 3 Tasks ได้แก่ ตั้งเวลาให้อาหาร, สั่งให้อาหารทันที และตรวจสอบอาหารคงเหลือ | https://drive.google.com/drive/folders/10PyIZJOIAbjr7yk_jkBHDrsF9deGocqK?usp=sharing |
| 2. User Test Evidence | รูป วิดีโอ screenshot form response interview note | https://drive.google.com/drive/folders/1Y09eYLHLvu40kSWHA0mQr8ia_AQ4x_n8?usp=sharing |
| 3. Feedback Summary | สรุป feedback ดิบจากผู้ใช้ | ผู้ใช้เข้าใจฟังก์ชันให้อาหารทันทีได้ดี แต่สับสนเมนูตั้งเวลาและข้อมูลอาหารคงเหลือ |
| 4. Insight | ทีมเรียนรู้อะไรจาก feedback | https://github.com/ChalidaCt/Team02_AWP/blob/main/docs/insights.md |
| 5. Priority Fix List | สิ่งที่ต้องแก้เรียงความสำคัญ | https://github.com/ChalidaCt/Team02_AWP/blob/main/docs/priority-fix-list.md |
| 6. Prototype v2 Plan | จะปรับอะไรใน Sprint 5 | https://github.com/ChalidaCt/Team02_AWP/blob/main/docs/prototype-v2-plan.md |
| 7. Updated Backlog | backlog สำหรับ Sprint 5 | https://github.com/ChalidaCt/Team02_AWP/blob/main/docs/sprint5-backlog.md |

## Sprint 5 Goal
ปรับปรุง Prototype v2 ให้ผู้ใช้เข้าใจขั้นตอนการให้อาหารและดูประวัติการให้อาหารได้ง่ายขึ้น จาก Feedback ที่พบว่าผู้ใช้สับสนบางเมนูและไม่เห็นสถานะการทำงานชัดเจน
## Prototype v2 Scope Lock

| Must Fix in Sprint 5 | Nice to Have | Not Doing / Later |
| --- | --- | --- |
| ปรับปรุงกลไกการจ่ายอาหารเพื่อลดการติดขัด | เพิ่มการแจ้งเตือนเมื่ออาหารใกล้หมด | ระบบแจ้งเตือนผ่าน Line Notify |
| ปรับ Calibration ให้ปริมาณอาหารแม่นยำขึ้น | ปรับปรุงดีไซน์ UI ให้สวยงามขึ้น | การพัฒนา Mobile Application จริง |
| ปรับปุ่ม Feed ให้ชัดเจน | เพิ่ม Animation | เชื่อม Hardware จริง

## demo link
https://drive.google.com/file/d/103fV-mGnuMkR0mcY2YGXWoH4fNP4NW6k/view?usp=sharing














