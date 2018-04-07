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
            liked_on: Date.now(),
        }).then(() => {
            const db = admin.firestore();

            const catRef = db.collection('cats').doc(catId);
            db.runTransaction(t => {
                return t.get(catRef)
                    .then(doc => {
                        t.update(catRef, {
                            like_counter: (doc.data().like_counter || 0) + 1
                        });
                    })
            }).then(result => {
                console.log('AGGREGATED CAT LIKE COUNTER!');
            }).catch(err => {
                console.log('FAILED TO AGGREGATE CAT LIKE COUNTER: ', err);
            });
        });
    });