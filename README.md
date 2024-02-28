# Phone authentication tutorial flutter firebase

the repository containes the full code to add phone authentication using firebase in flutter

## 🛠 Update
- added the feature to automatically read and auto fill otp please watch the another part for tutorial

## 🚀 Functionality
- Sent OTP to the phone number
- Verify the OTP received
- Automatically read OTP SMS and auto fill OTP code

## 📽 [Watch the video here](https://youtu.be/5gkJ8ZfbCHw) 
![PHONE AUTH (1)(1)](https://github.com/Snehasis4321/phone_auth_firebase_tutorial/assets/96995340/f550e999-d75f-4f84-a983-1708dbad9614)

[Link Here](https://youtu.be/5gkJ8ZfbCHw)

## 📽 [Another part to automatically read sms and auto fill otp code ](https://youtu.be/d7XgXc5ZvLs)
![READ-SMS10](https://github.com/Snehasis4321/phone_auth_firebase_tutorial/assets/96995340/b3ee2ee8-751e-49ce-9b3f-00475fe92c56)
watch this video [here](https://youtu.be/d7XgXc5ZvLs).



## ℹ Important for phone auth

To view **sha1 / sha256** key for phone auth use this command to 

First visit user folder of the OS Like `C:/YouUserName` for **Windows** or `/usr` for **Linux** there you will find a folder named  .android folder and there will be a file named debug.keystore 

- if the file there then it means you already have a sha1/sha256 key , no need to generate 
- if not then you need to generate a new debug.keystore file

### 💻 Command to view your existing sha1 and sha256 key
```
keytool -list -v -keystore debug.keystore -alias androiddebugkey
```
after running this command this will ask for password the default password is  `android`

----------------
### 💻 Command to create a new key store file 

*Run this to  create first then run above command **only if you dont have an existing debug.keystore or you have forget the password of previous one**.*

```
keytool -genkey -v -keystore debug.keystore -alias androiddebugkey -storepass android -keypass android -keyalg RSA -keysize 2048 -validity 10000
```

make sure to run the command inside .android folder of your user folder of os.

