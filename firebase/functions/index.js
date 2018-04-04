//
// Firebase Cloud Functions
//

const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

exports.testFunc = functions.https.onRequest((req, res) => {
    const tokenId = req.get('Authorization').split('Bearer ')[1];

    return admin.auth().verifyIdToken(tokenId)
        .then((decoded) => res.status(200).send('HELLO!'))
        .catch((err) => res.status(401).send(err));
});

exports.onLike = functions.firestore
    .document('/likes/{likeId}')
    .onCreate((event) => {
        const data = event.data.data();

        let catId, userId;
        [catId, userId] = event.params.likeId.split(':');
        return event.data.ref.set({
            cat_id: catId,
            user_id: userId,
        });
    });