// Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  var firebaseConfig = {
    apiKey: "AIzaSyBcSnz_Na-F3sd2taN1QLdHaHY3v-kEi9E",
    authDomain: "cubesnack-1611124943460.firebaseapp.com",
    projectId: "cubesnack-1611124943460",
    storageBucket: "cubesnack-1611124943460.appspot.com",
    messagingSenderId: "757395929934",
    appId: "1:757395929934:web:6ca39e23834027ee5efc1f",
    measurementId: "G-650BS1FN23"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();

  var messaging = firebase.messaging()

  messaging.usePublicVapidKey('BAiFw8F1c_mmMQQWoQOR0pTWHloCPJLZKJdzNvG7kQObtLLEeUZfdZ12NE39-uDiMcQFFruaOoykdPW70LZr22o');

  messaging.getToken().then((currentToken) => {
      console.log("Toekn "+currentToken)
  })
  messaging.onMessage((payload) => {
    console.log('Message received. ', payload);
    // ...
  });

  messaging.setBackgroundMessageHandler(function (payload) {
      const promiseChain = clients
          .matchAll({
              type: "window",
              includeUncontrolled: true
          })
          .then(windowClients => {
              for (let i = 0; i < windowClients.length; i++) {
                  const windowClient = windowClients[i];
                  windowClient.postMessage(payload);
              }
          })
          .then(() => {
              return registration.showNotification("New Message");
          });
      return promiseChain;
  });
  self.addEventListener('notificationclick', function (event) {
      console.log('notification received: ', event)
  });

  messaging.onBackgroundMessage((message) => {
    console.log("onBackgroundMessage", message);
  });