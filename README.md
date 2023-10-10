# Phone authentication tutorial flutter firebase

the repository containes the full code to add phone authentication using firebase in flutter

## Functionality
- Sent OTP to the phone number
- Verify the OTP received

## [Watch the video here](https://youtu.be/5gkJ8ZfbCHw) 
![PHONE AUTH (1)(1)](https://github.com/Snehasis4321/phone_auth_firebase_tutorial/assets/96995340/f550e999-d75f-4f84-a983-1708dbad9614)

[Link Here](https://youtu.be/5gkJ8ZfbCHw)

## Important for phone auth

to view sha 1/ sha256 key for phone auth use this command to 

visit .android folder and then debug.keystore is there run this otherwise generate a debug key and run this command to show sha1 key

Cmd to view 
```
keytool -list -v -keystore debug.keystore -alias androiddebugkey
```

cmd to create new key store file 

Run this to  create first then run above command

```
keytool -genkey -v -keystore debug.keystore -alias androiddebugkey -storepass android -keypass android -keyalg RSA -keysize 2048 -validity 10000
```

make sure to run the command inside .android folder of your username

