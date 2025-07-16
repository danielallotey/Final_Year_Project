// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { getFirestore } from "firebase/firestore";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyB1nKRhCYn-q-KsegkerzJxgpL8tZhQCks",
  authDomain: "final-year-project---comlink.firebaseapp.com",
  projectId: "final-year-project---comlink",
  storageBucket: "final-year-project---comlink.firebasestorage.app",
  messagingSenderId: "270279405346",
  appId: "1:270279405346:web:4cf5b2d46e6c29515e3f7b",
  measurementId: "G-X5R261LDYW",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
export const db = getFirestore(app);
